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

@app.on_event("startup")
def startup_db_client():
    print("API key: ", config["JINA_API_KEY"])
    app.mongodb_client = MongoClient(config["DB_URI"])
    app.database = app.mongodb_client['test']
    app.clip_client = Client('grpcs://api.clip.jina.ai:2096',
                credential={'Authorization': config["JINA_API_KEY"]}, asyncio = True)
    print("Connected to the MongoDB database!")

@app.on_event("shutdown")
def shutdown_db_client():
    app.mongodb_client.close()

@app.get("/")
def root():
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

@app.get('/search/{query}')
def  encode_learning_space(request:Request, query: str):

    
    encoding = app.clip_client.encode(
        [
            query
        ]
    )
    encoding = np.array(encoding[0])
    encoding = encoding / np.linalg.norm(encoding)

    print("Query is:", query)
    
    collection= app.database["learningspaces"]

    similarity_index = {}
    for ls in collection.find({}):
        if "BERT" in ls:
            similarity = np.array(ls["BERT"])  @ encoding 
            print(ls["title"], similarity)
            if similarity > 0.75:
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

@app.get('/reccomended/{username}')
async def  encode_learning_space(request:Request, username: str):


    print("Username is:", username)
    
    collection= app.database["learningspaces"]

    similarity_index = {}
    participated = (list(collection.find({"participants": {"$in" :[ username]}})))
    non_participated = (list(collection.find({"participants": {"$nin" :[ username]}})))
        
    for ls in participated:
        for ls2 in non_participated:
            similarity_index[np.array(ls["BERT"]) @ np.array(ls2["BERT"] )] = ls2["title"]
    
    sim_list = list(similarity_index.keys())
    sim_list.sort()
    sim_list.reverse()

    sim_list = sim_list[:9]
    
    titles = {}
    titles_list = []
    for sim in sim_list:
        titles[similarity_index[sim]] = sim
        titles_list.append(similarity_index[sim])
    
    titles["titles"] = titles_list
    
    titles = jsonable_encoder(titles)
    return JSONResponse(content = titles)