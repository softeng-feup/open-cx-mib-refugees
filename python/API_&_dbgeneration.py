## Python code for CORE
# Import dataset and create database with important parameters as given category

import requests
import re
#import json
from firebase import firebase

firebase = firebase.FirebaseApplication('https://esof-20d6f.firebaseio.com', None)

firebase.delete('/Program', None)

response = requests.get("https://2019.programming-conference.org/dataexport/810b23a0-737b-4f74-9170-75d515274859/confero.json?fbclid=IwAR0jR7psUtcCvVg3zL7KnseXUVqNY5DTeLzgM9xeL3E4h74RvWMkuBz94VY")
if response.status_code == 200:
    print('Success!')
elif response.status_code == 404:
    print('API not found.')

# Convert into JSON string
#def jprint(obj):
    #text = json.dumps(obj, sort_keys=True, indent=4)
    #print(text)

#jprint(response.json())

Items=response.json()['Items']
Sessions=response.json()['Sessions']

Titles=[]
Type=[]
Person=[]
Abstract=[]
Key=[]
S_key=[]
Day=[]
Time=[]
Num_itens=[]
number = 0

# define search string
pattern1 = re.compile("Critique presentation ")
pattern2 = re.compile("Panel Discussion ") 
pattern3 = re.compile("Lightning Talks ")


for d in Items:
    person=d['PersonsString']
    type=d['Type']
    if (type=='Talk' or type=='Research paper' or type=='Tutorial' or type=='Short-paper' or type=='Poster'):
         title=d['Title']
         if not (pattern1.search(title) or pattern2.search(title) or pattern3.search(title) or title[-20:]=="(short presentation)"):
             number += 1
             type=d['Type']
             Type.append(type)
             person=d['PersonsString']
             Titles.append(title)
             Person.append(person)
             abstract=d['Abstract']
             Abstract.append(abstract)
             key=d['Key']
             Key.append(key)
             for s in Sessions:
                 if "Items" in s:
                     for a in s['Items']:
                         if key==a:
                             session_key=s['Key']
                             S_key.append(session_key)
                             day=s['Day']
                             Day.append(day)

    
for s in Sessions:
    if "Items" in s:
        if s['Key'] in S_key:
            num_items=len(s['Items'])
            Num_itens.append(num_items)    
                       
'''
Categories // lectures 

1. Live Software Development
2. Web 
3. Cybersecurity 
4. Artificial Intelligence
5. Internet of Things
6. UI/UX
7. Haskell language
8. Virtual Machine
9. Lisp language
10. Software checking, debugging and improvement
11. Meta-programming and Parsing
12. Other
''' 
  
categories = [11, 11, 11, 11, 3, 5, 2, 6, 2, 4, 2, 4, 10, 1, 1, 10, 12, 10, 8, 5, 3, 12, 10, 8, 12, 5, 12, 12, 6, 8, 10, 5, 10, 3, 8, 3, 8, 8, 12, 8, 11, 8, 12, 4, 10, 12, 12, 8, 12, 9, 12, 12, 9, 9, 9, 9, 9, 9, 9, 10, 9, 9, 9, 9, 1, 5, 7, 10, 12, 12, 12, 2, 9, 10, 10, 4, 4, 12, 10, 7, 12, 5, 12, 10, 7, 10, 12, 12, 8, 4, 4, 2, 2, 12, 12, 1, 1, 11, 10, 1, 4]

n=0
while n < len(categories):
    person=Person[n]
    category=categories[n]
    title=Titles[n]
    type=Type[n]
    abstract=Abstract[n]
    day=Day[n]
    selected=bool(False)
    data = {'id': n+1,
            'speaker': person,
            'category': category,
            'title': title,
            'type': type,
            'abstract': abstract,
            'selected': selected,
            'date': day
            }
    firebase.post('/Program', data)
    n += 1

db=firebase.get('/Program', None)

