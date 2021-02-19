# upcitembdd.com
import requests # to request the api
import json # helps convert json documents to dictionaries

#https://home.openweathermap.org/
# user btindol178
# pass S.....................
# Key 05105108f427c01fc7e76f8332f19ea9
######################################################################################################################
######################################################################################################################
# USE API
# go to https://openweathermap.org/forecast5
# and copy api.openweathermap.org/data/2.5/forecast as base url before ? this is base url 

baseUrl = 'https://api.openweathermap.org/data/2.5/forecast'
#baseUrl = 'https://openweathermap.org/forecast5'
parameters = {'APPID':'83eca1d854ff2c2761d29aea953fc35a','q':'Seattle,US'}
response = requests.get(baseUrl,params=parameters)
print(response.content)