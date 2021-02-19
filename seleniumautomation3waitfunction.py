# pip install selenium
#C:\Users\btindol\Downloads\chromedriver_win32.zip


# If an element loads on webpage 4 seconds after you get on page you need a wait function to wait to have selenium click
import selenium
from selenium import webdriver 
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

url = 'https://www.google.com/earth/'
driver = webdriver.Chrome('C:/Users/btindol/OneDrive - Stryker/ChromeDriver/chromedriver.exe')
driver.get(url)
wait = WebDriverWait(driver,14) # wait 10 seconds to click
launchEarthButton = wait.until(EC.element_to_be_clickable((By.XPATH,'/html/body/header/div/nav[1]/ul[2]/li[2]/a/span/span')))
launchEarthButton.click()