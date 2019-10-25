import requests
import json
from firebase import firebase

firebase = firebase.FirebaseApplication('https://esof-20d6f.firebaseio.com', None)

firebase.delete('/Program', None)
'''
Sempre que o códiogo corre são acrescentadas as mesmas informaçoes a base de dados.
Pelo menos para já estou a fazer assim, eliminar sempre tudo antes de carregar. 
Eventualmente vamos ter de fazer ficheros de codigo separados para carregar a
a base de dados uma vez só e o resto do codigo noutro ficheiro
'''


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
number = 0 #para recolher apenas as primeiras 20

for d in Items:
    person=d['PersonsString']
    type=d['Type']
    if not (person=='' and type!='Talk'):
         number += 1
         if number<=20:
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
         else:
               break
                  
'''
Categorias e respetivas lectures atribuidas
1.Coding dojo-14,16
2.Web-7,11,13,
3.Cybersecurity-5
4.Artificial Intelligence-8,9
5.Internet of Things-6,20
6.UI/UX
7.Criptocurrency
8.Virtual Machines- 15
9.Computational optimization-10,18,
10.Object-oriented programming-1,17
11.Other-2,3,4,12,19

*rever as outras, porque nao sei onde as por
''' 
  
Cat = [10, 11, 11, 11, 3, 5, 2, 4, 4, 9, 2, 11, 2, 1, 8, 1, 10, 9, 11, 5]

n=0
while n < len(Cat):
    person=Person[n]
    title=Titles[n]
    type=Type[n]
    cat=Cat[n]
    data = {'Author': person,
                 'Title': title,
                 'Type': type,
                 'Category': cat
                 }
    firebase.post('/Program', data)
    n += 1

#verificar que a base de dados tem a informação desejada
db=firebase.get('/Program', None)