from fastapi import FastAPI
from dotenv import dotenv_values
from pymongo import MongoClient
from fastapi import  Request, Response
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import numpy as np
from clip_client import Client


config = dotenv_values(".env")
app = FastAPI()


def get_database():
     
   # Provide the mongodb atlas url to connect python to mongodb using pymongo
   CONNECTION_STRING = "mongodb://localhost:27017"
 
   # Create a connection using MongoClient. You can import MongoClient or use pymongo.MongoClient
   client = MongoClient(CONNECTION_STRING)
 
   # Create the database for our example (we will use the same database throughout the tutorial
   return client['test']

@app.on_event("startup")
def startup_db_client():
    
    app.mongodb_client = MongoClient(config["DB_URI"])
    app.database = app.mongodb_client['test']
    app.clip_client = Client('grpcs://api.clip.jina.ai:2096',
                credential={'Authorization': config["JINA_API_KEY"]}, asyncio = True)
    print("Connected to the MongoDB database!")

@app.on_event("shutdown")
def shutdown_db_client():
    app.mongodb_client.close()

@app.get("/")
async def root():
    return {"message": "Learnify Semantic server is up!"}

#Learning space model, it will use only title and get the remaining LS from the DB
class LS(BaseModel):
    title: str
#TODO: add description

@app.post('/encode')
def encode_learning_space(request:Request, ls: LS):
    collection= app.database["learningspaces"]
    ls = next(collection.find({"title": ls.title}))
    print(ls["title"])

    querry = ls['title'] + ":" + ls['description']
    print("encoding querry:" , querry)
    encoding = app.clip_client.encode(
        [
            querry
        ]
    )
    encoding = np.array(encoding) / np.linalg.norm(encoding)
    details = collection.update_one({"title" : ls["title"]}, {"$set": {"BERT": encoding.tolist()[0]}})

    return 200

@app.get('/search/{querry}')
def encode_learning_space(request:Request, querry: str):

    
    encoding = app.clip_client.encode(
        [
            querry
        ]
    )
    encoding = np.array(encoding[0])
    encoding = encoding / np.linalg.norm(encoding)


    
    collection= app.database["learningspaces"]

    similarity_index = {}
    for ls in collection.find({}):
        if "BERT" in ls:
            similarity = np.array(ls["BERT"])  @ encoding 
            if similarity > 0.80:
                similarity_index[similarity] = ls["title"]

    
    sim_list = list(similarity_index.keys())
    sim_list.sort()
    sim_list.reverse()

    sim_list = sim_list[:19]
    
    titles = {}
    titles_list = []
    for sim in sim_list:
        titles[similarity_index[sim]] = sim
        titles_list.append(similarity_index[sim])
    
    titles["titles"] = titles_list
    
    titles = jsonable_encoder(titles)
    return JSONResponse(content = titles)