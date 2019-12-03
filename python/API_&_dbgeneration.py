## Python code for CORE
# Import dataset and create database with important parameters as given category

import requests
import re
from firebase import firebase
from dateutil.parser import parse

firebase = firebase.FirebaseApplication('https://esof-20d6f.firebaseio.com', None)

firebase.delete('/Program', None)

response = requests.get("https://2019.programming-conference.org/dataexport/810b23a0-737b-4f74-9170-75d515274859/confero.json?fbclid=IwAR0jR7psUtcCvVg3zL7KnseXUVqNY5DTeLzgM9xeL3E4h74RvWMkuBz94VY")
if response.status_code == 200:
    print('Success!')
elif response.status_code == 404:
    print('API not found.')

Items=response.json()['Items']
Sessions=response.json()['Sessions']


my={}
My_Items=[]
number = 0

# define search string
pattern1 = re.compile("Critique presentation ")
pattern2 = re.compile("Panel Discussion ") 
pattern3 = re.compile("Lightning Talks ")

#fetch import item data from global Itens
for d in Items:
    person=d['PersonsString']
    type=d['Type']
    if (type=='Talk' or type=='Research paper' or type=='Tutorial' or type=='Short-paper' or type=='Poster'):
         title=d['Title']
         if not (pattern1.search(title) or pattern2.search(title) or pattern3.search(title) or title[-20:]=="(short presentation)"):
             number += 1
             my["Type"]=d['Type']
             my['Person']=d['PersonsString']
             my['Title']=title
             my['Abstract']=d['Abstract']
             my['Key']=d['Key']
             for s in Sessions:
                 if "Items" in s:
                     for a in s['Items']:
                         if d['Key']==a:
                             my['S_key']=s['Key']
                             my['location']=s['Location']
                             my['Day']=s['Day']
                             my['start_time']=parse(s['Time'][:5])
                             my['end_time']=parse(s['Time'][-5:]) 
                             my['duration']=my['end_time']-my['start_time']
             My_Items.append(my)
             my={}
             
#start time correction (exclude day opening)
My_Items[21]['start_time']=parse('09:00')
My_Items[26]['start_time']=parse('09:00')
My_Items[33]['start_time']=parse('09:00')
My_Items[40]['start_time']=parse('09:00')
My_Items[21]['duration']=My_Items[21]['end_time']-My_Items[21]['start_time']
My_Items[26]['duration']=My_Items[26]['end_time']-My_Items[26]['start_time']
My_Items[33]['duration']=My_Items[33]['end_time']-My_Items[33]['start_time']
My_Items[40]['duration']=My_Items[40]['end_time']-My_Items[40]['start_time']

#end time correction (exclude day closing)
My_Items[39]['end_time']=parse('17:00')
My_Items[30]['end_time']=parse('17:00')
My_Items[32]['end_time']=parse('17:00')
My_Items[32]['duration']=My_Items[32]['end_time']-My_Items[32]['start_time']
My_Items[39]['duration']=My_Items[39]['end_time']-My_Items[39]['start_time']
My_Items[30]['duration']=My_Items[30]['end_time']-My_Items[30]['start_time']

#session number of items
my_Sessions=[]          
for s in Sessions:
    if "Items" in s:
        my_s={}
        num=0
        for ss in s['Items']:
            for xx in My_Items:
                if ss == xx['Key']:
                   num+=1
        if num !=0:
            my_s['key']=s['Key']
            my_s['number']=num
            my_s['position']=0
            my_Sessions.append(my_s)
        num=0
        my_s={}

#order of the item on session
for p in My_Items:
    for t in my_Sessions:
        if p['S_key']==t['key']:
            t['position']+=1
            p['position']=t['position']
            p['number_itens_session']=t['number']

#single start, end time and duration
for p in My_Items:
    #All poster present at same time on Session
    if (p['Type']!="Poster" and p['number_itens_session']!=1):
        p['single_duration']=p['duration']/p['number_itens_session']
        if p['position']==1:
            p['single_start']=p['start_time']
            p['single_end']=p['start_time']+p['single_duration']
        elif p['position']==2:
            p['single_start']=p['start_time']+p['single_duration']
            p['single_end']=p['start_time']+2*p['single_duration']
        elif p['position']==3:
            p['single_start']=p['start_time']+2*p['single_duration']
            p['single_end']=p['start_time']+3*p['single_duration']
        else:
            p['single_start']=p['start_time']+3*p['single_duration']
            p['single_end']=p['start_time']+4*p['single_duration']
    else:
         p['single_duration']=p['duration']
         p['single_start']=p['start_time']
         p['single_end']=(p['end_time'])
    
#single start, end time and duration corrections
My_Items[30]['single_end']=parse('16:30')
My_Items[30]['single_duration']=My_Items[30]['single_end']-My_Items[30]['single_start']
My_Items[32]['single_start']=parse('16:30')
My_Items[32]['single_end']=parse('16:45')
My_Items[32]['single_duration']=My_Items[32]['single_end']-My_Items[32]['single_start']
My_Items[39]['single_start']=parse('16:45')
My_Items[39]['single_duration']=My_Items[39]['single_end']-My_Items[39]['single_start']

My_Items[71]['single_end']=parse('14:15')
My_Items[71]['single_duration']=My_Items[71]['single_end']-My_Items[71]['single_start']
My_Items[92]['single_start']=parse('14:15')
My_Items[92]['single_end']=parse('14:45')
My_Items[92]['single_duration']=My_Items[92]['single_end']-My_Items[92]['single_start']
My_Items[98]['single_start']=parse('14:45')
My_Items[98]['single_duration']=My_Items[98]['single_end']-My_Items[98]['single_start']

for p in My_Items:
    p['start_time']=p['start_time'].strftime("%H:%M")
    p['end_time']=(p['end_time']).strftime("%H:%M")
    p['single_start']=p['single_start'].strftime("%H:%M")
    p['single_end']=(p['single_end']).strftime("%H:%M")
   
    
#%%
                       
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
    category=categories[n]
    data = {'id': n,
            'speaker': My_Items[n]['Person'],
            'category': category,
            'title': My_Items[n]['Title'],
            'type': My_Items[n]['Type'],
            'abstract': My_Items[n]['Abstract'],
            'date': My_Items[n]['Day'],
            'duration': str(My_Items[n]['single_duration']),
            'start': My_Items[n]['single_start'],
            'end': My_Items[n]['single_end']
            }
    firebase.post('/Program', data)
    n += 1

db=firebase.get('/Program', None)