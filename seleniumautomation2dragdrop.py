# pip install selenium
#C:\Users\btindol\Downloads\chromedriver_win32.zip
        # brew cask install chromedriver # this is for mac?
#http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html (to learn how to use selenium to drag and drop!)
# Drag and drop with selenium!

import selenium
from selenium import webdriver 
from selenium.webdriver.common.action_chains import ActionChains # allows drag and drop
#######################################################################################
########################################################################################

driver = webdriver.Chrome('C:/Users/btindol/OneDrive - Stryker/ChromeDriver/chromedriver.exe')
driver.maximize_window() # for viewing purposes
driver.get('http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html')
source = driver.find_element_by_xpath('//*[@id="box3"]') # from draging destination
dest = driver.find_element_by_xpath('//*[@id="box103"]') # to destination
actions = ActionChains(driver)
actions.drag_and_drop(source,dest).perform()

