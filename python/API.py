## Python code for CORE
# Import dataset and create database with important parameters

import requests
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

Titles=[]
Type=[]
Person=[]
number = 0

for d in Items:
    person=d['PersonsString']
    type=d['Type']
    if not (person=='' and type!='Talk'):
         number += 1
         if number<=20:
              title=d['Title']
              type=d['Type']
              person=d['PersonsString']
              
              Titles.append(title)
              Type.append(type)
              Person.append(person)
         else:
               break
                  
'''
Categories // lectures 

1. Coding dojo // 14,16
2. Web // 7,11,13
3. Cybersecurity // 5
4. Artificial Intelligence // 8,9
5. Internet of Things // 6,20
6. UI/UX
7. Cryptocurrency
8. Virtual Machines // 15
9. Other // 1,2,3,4,10,12,17,18,19

''' 
  
categories = [9, 9, 9, 9, 3, 5, 2, 4, 4, 9, 2, 9, 2, 1, 8, 1, 9, 9, 9, 5]

n=0
while n < len(categories):
    person=Person[n]
    category=categories[n]
    title=Titles[n]
    type=Type[n]
    data = {'Author': person,
            'Category': category,
            'Title': title,
            'Type': type
            }
    firebase.post('/Program', data)
    n += 1


db=firebase.get('/Program', None)

#%% Ranking letures preference 

survey_answers=[1,3,4,1,4,4,5,1] #list that python receive from fluter

# preference of each lecture category
index_list_1 = [] 
index_list_2 = [] 
index_list_3 = [] 
index_list_4 = [] 
index_list_5 = [] 
for i in range(0, len(survey_answers)) : 
    if survey_answers[i] == 1 : 
        index_list_1.append(i+1)
    elif survey_answers[i] == 2 : 
        index_list_2.append(i+1)
    elif survey_answers[i] == 3 : 
        index_list_3.append(i+1)
    elif survey_answers[i] == 4 : 
        index_list_4.append(i+1)
    else :
        index_list_5.append(i+1)

#rank_lectures has the information of preference from 20 first lectures (0 to 1 or n/d)
rank_lectures=[]
for i in range(0, len(categories)):
    if categories[i]==9:
        rank_lectures.append("n/d")
    for a in range(0, len(index_list_1)):
        if categories[i]==index_list_1[a]:
            rank_lectures.append(0)
    for b in range(0, len(index_list_2)):
        if categories[i]==index_list_2[b]:
            rank_lectures.append(0.25)
    for c in range(0, len(index_list_3)):
        if categories[i]==index_list_3[c]:
            rank_lectures.append(0.50)
    for d in range(0, len(index_list_4)):
        if categories[i]==index_list_4[d]:
            rank_lectures.append(0.75)
    for e in range(0, len(index_list_5)):
        if categories[i]==index_list_5[e]:
            rank_lectures.append(1)
            
    