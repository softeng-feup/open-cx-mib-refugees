import requests
import json
from firebase import firebase

firebase = firebase.FirebaseApplication('https://esof-20d6f.firebaseio.com', None)

response = requests.get("https://2019.programming-conference.org/dataexport/810b23a0-737b-4f74-9170-75d515274859/confero.json?fbclid=IwAR0jR7psUtcCvVg3zL7KnseXUVqNY5DTeLzgM9xeL3E4h74RvWMkuBz94VY")
if response.status_code == 200:
    print('Success!')
elif response.status_code == 404:
    print('API not found.')

# Convert into JSON string
def jprint(obj):
    text = json.dumps(obj, sort_keys=True, indent=4)
    #print(text)

jprint(response.json())

Items=response.json()['Items']

Titles = []
Type=[]
Person=[]
Affiliation=[]
Abstract=[]

for d in Items:
    person=d['PersonsString']
    type=d['Type']
    
    if not (person=='' and type!='Talk'):
         title=d['Title']
         type=d['Type']
         person=d['PersonsString']
         affiliation=d['AffiliationsString']
         abstract=d['Abstract']
         
         Titles.append(title)
         Type.append(type)
         Person.append(person)
         Affiliation.append(affiliation)
         Abstract.append(abstract)
         
         data = {'Author': person,
                 'Title': title,
                 'Type': type
                 }
         result = firebase.post('/Program', data)
         print(result)