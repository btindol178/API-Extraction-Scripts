#http://quotes.toscrape.com/

import requests # source code to the website
from bs4 import BeautifulSoup # so split xml
url = 'http://quotes.toscrape.com' # url to get source code
response = requests.get(url) # Get source code for the website..
soup = BeautifulSoup(response.text, 'lxml') # get all of source code in text form
#print(soup) # print it
quotes = soup.find_all('span',class_='text') # find all the spans with class text
#print(quotes)
# remove html now by printing each quote
# for quote in quotes:
#     print(quote.text)
authors = soup.find_all('small',class_='author') # find all corresponding authors to the text
# # Get the pages author and the quotes
# for i in range(0,len(quotes)):
#     print(quotes[i].text)
#     print(authors[i].text)
tags = soup.find_all('div',class_='tags')

# Get the pages author and the quotes and tags
for i in range(0,len(quotes)):
    print(quotes[i].text)
    print(authors[i].text)
    quoteTags = tags[i].find_all('a',class_='tag')
    for quoteTag in quoteTags:
        print(quoteTag.text)