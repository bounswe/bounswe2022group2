from clip_client import Client
import numpy as np
from numpy import dot
from numpy.linalg import norm

from pymongo import MongoClient
c = Client('grpcs://api.clip.jina.ai:2096',
                credential={'Authorization': 'df65cdf3b756d34e030ebf74ede231e0'})

def get_encoding(text):
    r = c.encode(
        [
            text
        ]
    )
    print(r)
    print(len(r[0]))
    r = np.array(r)
    return r / np.linalg.norm(r)
def get_database():
 
   # Provide the mongodb atlas url to connect python to mongodb using pymongo
   CONNECTION_STRING = "mongodb://localhost:27017"
 
   # Create a connection using MongoClient. You can import MongoClient or use pymongo.MongoClient
   client = MongoClient(CONNECTION_STRING)
 
   # Create the database for our example (we will use the same database throughout the tutorial
   return client['test']
  
# This is added so that many files can reuse the function get_database()
if __name__ == "__main__":   
  
   # Get the database
    dbname = get_database()
    collection= dbname["learningspaces"]
    encoding = get_encoding("Guitar Technique")
    details = collection.update_one({"title" : "Guitar Technique"}, {"$set": {"fml": encoding.tolist()[0]}})
    print(details)
    

   