# -*- coding: utf-8 -*-
"""
Created on Fri Nov  8 21:53:35 2019

@author: Maria Ribeiro
"""

#%% Ranking letures preference 

from firebase import firebase

firebase = firebase.FirebaseApplication('https://esof-20d6f.firebaseio.com', None)

db=firebase.get('/Program', None)

survey_answers=[1,3,4,1,4,4,5,1,4,1,3] #list that python receive from fluter

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
for i in db:
    if db.get(i).get('Category')==12:
        rank_lectures.append("n/d")
    for a in range(0, len(index_list_1)):
        if db.get(i).get('Category')==index_list_1[a]:
            rank_lectures.append(0)
    for b in range(0, len(index_list_2)):
        if db.get(i).get('Category')==index_list_2[b]:
            rank_lectures.append(0.25)
    for c in range(0, len(index_list_3)):
        if db.get(i).get('Category')==index_list_3[c]:
            rank_lectures.append(0.50)
    for d in range(0, len(index_list_4)):
        if db.get(i).get('Category')==index_list_4[d]:
            rank_lectures.append(0.75)
    for e in range(0, len(index_list_5)):
        if db.get(i).get('Category')==index_list_5[e]:
            rank_lectures.append(1)
            
    