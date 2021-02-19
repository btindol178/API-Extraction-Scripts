# upcitembdd.com
import requests # to request the api
import json # helps convert json documents to dictionaries

baseUrl = 'https://api.upcitemdb.com/prod/trial/lookup'
parameters = {'upc':'012993441012'}
response = requests.get(baseUrl,params = parameters) # get api request...
print(response.url) # print the responses url 

# Acess content 
content = response.content
info = json.loads(content)
#print(type(info))
#print(info)

item = info['items']
itemInfo = item[0]
title=itemInfo['title']
brand = itemInfo['brand']
print(title)
print(brand) # works!

#########################################################################################################################
#########################################################################################################################
