# Scrapingclub.com

# SCRAPING FOR MULTIPLE PAGES!!!!!!!!!!!!!!!!!!!
import requests # source code to the website
from bs4 import BeautifulSoup # so split xml

url = 'https://scrapingclub.com/exercise/list_basic/?page=1'
response = requests.get(url)
soup = BeautifulSoup(response.text,'lxml')
items = soup.find_all('div',class_='col-lg-4 col-md-6 mb-4') # grab the card of 

# in the card that holds the item iterate through h4 and h5 items and print the iteration, card title and itme name
count = 1
for i in items:
    itemName = i.find('h4', class_ = 'card-title').text.strip('\n')
    itemPrice = i.find('h5').text
    print('%s ) Price: %s, Item Name: %s' % (count, itemName,itemName))
    count = count + 1

################################################################################################################################
################################################################################################################################
################################################################################################################################
# Now web scraping data on multiple pages 
pages = soup.find('ul',class_ = 'pagination')
urls = []
links = pages.find_all('a',class_='page-link') # grap page links
for link in links: # see if link text properties can be converted to digit if so keep
    pageNum = int(link.text) if link.text.isdigit() else None 
    if pageNum != None:
        x = link.get('href')
        urls.append(x)
print(urls) # now we can see the pages we can iterate through
count = 1  # move the counter outside forloop
for i in urls: # Now we need to add that at the end of our base url 
    newUrl = url + i  # take url and move on to next one
    response = requests.get(newUrl) # get that url 
    for i in items: # for items in that page now scrape all information 
        itemName = i.find('h4', class_ = 'card-title').text.strip('\n')
        itemPrice = i.find('h5').text
        print('%s ) Price: %s, Item Name: %s' % (count, itemPrice,itemName))
        count = count + 1

