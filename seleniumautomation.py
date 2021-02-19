# pip install selenium
#C:\Users\btindol\Downloads\chromedriver_win32.zip
        # brew cask install chromedriver # this is for mac?
# Website to test the selenium package!
# seleniumeasy.com

import selenium
from selenium import webdriver 
#######################################################################################
########################################################################################

driver = webdriver.Chrome('C:/Users/btindol/OneDrive - Stryker/ChromeDriver/chromedriver.exe')
driver.get('https://www.seleniumeasy.com/test/basic-first-form-demo.html')
messageField= driver.find_element_by_xpath('//*[@id="user-message"]')# Try to input message into field Find element right click and copy xpath so we can use find element by xpath function
messageField.send_keys('Hello World') # Fill the input box with this
showMessageButton = driver.find_element_by_xpath('//*[@id="get-input"]/button') # get the submitt button xpath
showMessageButton.click() # submit it
additionField1 =driver.find_element_by_xpath('//*[@id="sum1"]')
additionField1.send_keys('10') # fill 10 in this box
additionField2 =driver.find_element_by_xpath('//*[@id="sum2"]')
additionField2.send_keys('20') # fill 10 in this box
getTotalButton = driver.find_element_by_xpath('//*[@id="gettotal"]/button')
getTotalButton.click()

