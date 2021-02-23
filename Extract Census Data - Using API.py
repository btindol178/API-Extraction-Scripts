import pandas as pd #make API calls with python
import requests #allows us to store results of API call cleanly
import json #helps manipulate json
import csv # helps with csv files
import re #used to clean up cols at the end
import os
from bs4 import BeautifulSoup
os.chdir("S:/Strategic Analytics/Customer_Intelligence")
# Census API Key
# Go here https://api.census.gov/data/key_signup.html?message=need-terms
apiKey = "e3a3dbad3edfa4d96cb59f65931694b311565c63"

# Here you can find a complete list of variables for the census 
    #https://api.census.gov/data.html


def GetCensusMSAAgeGroupDemographics2015():
    indicators = requests.get("https://api.census.gov/data/2015/acs/acs1?get=NAME,group(B01001)&for=metropolitan%20statistical%20area/micropolitan%20statistical%20area:*&key=e3a3dbad3edfa4d96cb59f65931694b311565c63")
    indicatorsJSON = indicators.json()
    dfAll = pd.DataFrame(indicatorsJSON)
    headers = dfAll.iloc[0] # Get the column headers in the first row at index position 0 to make them column names
    new_df  = pd.DataFrame(dfAll.values[1:], columns=headers) # now start at row 0 through the whole dataframe and rename the column headers the variable you just instantiated above 
    new_df2 = new_df.loc[:, ~new_df.columns.str.endswith('EA')] # remove columns with names that end with EA
    new_df3 = new_df2.loc[:, ~new_df2.columns.str.endswith('MA')] # remove columns with names that end with MA
    new_df4 = new_df3.loc[:, ~new_df3.columns.str.endswith('M')] # remove columns with names that end with M
    variabledf = pd.read_html('https://api.census.gov/data/2015/acs/acs5/variables.html') # Grab the table of definitions of the variable names 
    variabledf = variabledf[0] # grab the first element of the html which is the actual table
    variablenamedf = pd.DataFrame(variabledf) # make it into a dataframe 
    filterRows = list(new_df4.columns) # take theMSA data and get the column names (AKA variable names) to filter rows in the variable definitions table
    filterRows2 =filterRows[2:51] # # exclude the MSA names  and geoid columns for the filtering of the rows
    filteredvariabledf = variablenamedf.Name.isin(filterRows2) # filter the rows of the variable name table with the msa column names
    filtered_df = variablenamedf[filteredvariabledf] # return a new filtered dataframe
    newColumnNames = list(filtered_df.Label) # Get the second column of the newly filtered variable definitions table (the actual description of the variale name) This helps in column understanding
    newColumnNames.insert(0,'NAME') # add the originoal column names back onto this list in the first position
    newColumnNames.append('GEO_ID') # add the originoal column names back onto this list in the last position
    newColumnNames.append('NAME') # add the originoal column names back onto this list in the last position
    newColumnNames.append('metropolitan statistical area/micropolitan statistical area')  # add the originoal column names back onto this list in the last position
    new_df4.columns = newColumnNames
    return new_df4 # Return the new dataframe 

def GetCensusMSAAgeGroupDemographics2016():
    indicators = requests.get("https://api.census.gov/data/2016/acs/acs1?get=NAME,group(B01001)&for=metropolitan%20statistical%20area/micropolitan%20statistical%20area:*&key=e3a3dbad3edfa4d96cb59f65931694b311565c63")
    indicatorsJSON = indicators.json()
    dfAll = pd.DataFrame(indicatorsJSON)
    headers = dfAll.iloc[0] # Get the column headers in the first row at index position 0 to make them column names
    new_df  = pd.DataFrame(dfAll.values[1:], columns=headers) # now start at row 0 through the whole dataframe and rename the column headers the variable you just instantiated above 
    new_df2 = new_df.loc[:, ~new_df.columns.str.endswith('EA')] # remove columns with names that end with EA
    new_df3 = new_df2.loc[:, ~new_df2.columns.str.endswith('MA')] # remove columns with names that end with MA
    new_df4 = new_df3.loc[:, ~new_df3.columns.str.endswith('M')] # remove columns with names that end with M
    variabledf = pd.read_html('https://api.census.gov/data/2016/acs/acs5/variables.html') # Grab the table of definitions of the variable names 
    variabledf = variabledf[0] # grab the first element of the html which is the actual table
    variablenamedf = pd.DataFrame(variabledf) # make it into a dataframe 
    filterRows = list(new_df4.columns) # take theMSA data and get the column names (AKA variable names) to filter rows in the variable definitions table
    filterRows2 =filterRows[1:50] # # exclude the MSA names  and geoid columns for the filtering of the rows
    filteredvariabledf = variablenamedf.Name.isin(filterRows2) # filter the rows of the variable name table with the msa column names
    filtered_df = variablenamedf[filteredvariabledf] # return a new filtered dataframe
    newColumnNames = list(filtered_df.Label) # Get the second column of the newly filtered variable definitions table (the actual description of the variale name) This helps in column understanding
    newColumnNames.insert(0,'NAME') # add the originoal column names back onto this list in the first position
    # newColumnNames.append('GEO_ID') # add the originoal column names back onto this list in the last position
    # newColumnNames.append('NAME') # add the originoal column names back onto this list in the last position
    newColumnNames.append('metropolitan statistical area/micropolitan statistical area')  # add the originoal column names back onto this list in the last position
    new_df4.columns = newColumnNames
    return new_df4 # Return the new dataframe 

def GetCensusMSAAgeGroupDemographics2017():
    indicators = requests.get("https://api.census.gov/data/2017/acs/acs1?get=NAME,group(B01001)&for=metropolitan%20statistical%20area/micropolitan%20statistical%20area:*&key=e3a3dbad3edfa4d96cb59f65931694b311565c63")
    indicatorsJSON = indicators.json()
    dfAll = pd.DataFrame(indicatorsJSON)
    headers = dfAll.iloc[0] # Get the column headers in the first row at index position 0 to make them column names
    new_df  = pd.DataFrame(dfAll.values[1:], columns=headers) # now start at row 0 through the whole dataframe and rename the column headers the variable you just instantiated above 
    new_df2 = new_df.loc[:, ~new_df.columns.str.endswith('EA')] # remove columns with names that end with EA
    new_df3 = new_df2.loc[:, ~new_df2.columns.str.endswith('MA')] # remove columns with names that end with MA
    new_df4 = new_df3.loc[:, ~new_df3.columns.str.endswith('M')] # remove columns with names that end with M
    variabledf = pd.read_html('https://api.census.gov/data/2017/acs/acs5/variables.html') # Grab the table of definitions of the variable names 
    variabledf = variabledf[0] # grab the first element of the html which is the actual table
    variablenamedf = pd.DataFrame(variabledf) # make it into a dataframe 
    filterRows = list(new_df4.columns) # take theMSA data and get the column names (AKA variable names) to filter rows in the variable definitions table
    filterRows2 =filterRows[2:51] # # exclude the MSA names  and geoid columns for the filtering of the rows
    filteredvariabledf = variablenamedf.Name.isin(filterRows2) # filter the rows of the variable name table with the msa column names
    filtered_df = variablenamedf[filteredvariabledf] # return a new filtered dataframe
    newColumnNames = list(filtered_df.Label) # Get the second column of the newly filtered variable definitions table (the actual description of the variale name) This helps in column understanding
    newColumnNames.insert(0,'NAME') # add the originoal column names back onto this list in the first position
    newColumnNames.append('GEO_ID') # add the originoal column names back onto this list in the last position
    newColumnNames.append('NAME') # add the originoal column names back onto this list in the last position
    newColumnNames.append('metropolitan statistical area/micropolitan statistical area')  # add the originoal column names back onto this list in the last position
    new_df4.columns = newColumnNames
    return new_df4 # Return the new dataframe 

def GetCensusMSAAgeGroupDemographics2018():
    indicators = requests.get("https://api.census.gov/data/2017/acs/acs1?get=NAME,group(B01001)&for=metropolitan%20statistical%20area/micropolitan%20statistical%20area:*&key=e3a3dbad3edfa4d96cb59f65931694b311565c63")
    indicatorsJSON = indicators.json()
    dfAll = pd.DataFrame(indicatorsJSON)
    headers = dfAll.iloc[0] # Get the column headers in the first row at index position 0 to make them column names
    new_df  = pd.DataFrame(dfAll.values[1:], columns=headers) # now start at row 0 through the whole dataframe and rename the column headers the variable you just instantiated above 
    new_df2 = new_df.loc[:, ~new_df.columns.str.endswith('EA')] # remove columns with names that end with EA
    new_df3 = new_df2.loc[:, ~new_df2.columns.str.endswith('MA')] # remove columns with names that end with MA
    new_df4 = new_df3.loc[:, ~new_df3.columns.str.endswith('M')] # remove columns with names that end with M
    variabledf = pd.read_html('https://api.census.gov/data/2017/acs/acs5/variables.html') # Grab the table of definitions of the variable names 
    variabledf = variabledf[0] # grab the first element of the html which is the actual table
    variablenamedf = pd.DataFrame(variabledf) # make it into a dataframe 
    filterRows = list(new_df4.columns) # take theMSA data and get the column names (AKA variable names) to filter rows in the variable definitions table
    filterRows2 =filterRows[2:51] # # exclude the MSA names  and geoid columns for the filtering of the rows
    filteredvariabledf = variablenamedf.Name.isin(filterRows2) # filter the rows of the variable name table with the msa column names
    filtered_df = variablenamedf[filteredvariabledf] # return a new filtered dataframe
    newColumnNames = list(filtered_df.Label) # Get the second column of the newly filtered variable definitions table (the actual description of the variale name) This helps in column understanding
    newColumnNames.insert(0,'NAME') # add the originoal column names back onto this list in the first position
    newColumnNames.append('GEO_ID') # add the originoal column names back onto this list in the last position
    newColumnNames.append('NAME') # add the originoal column names back onto this list in the last position
    newColumnNames.append('metropolitan statistical area/micropolitan statistical area')  # add the originoal column names back onto this list in the last position
    new_df4.columns = newColumnNames
    return new_df4 # Return the new dataframe 

def GetCensusMSAAgeGroupDemographics2019():
    indicators = requests.get("https://api.census.gov/data/2019/acs/acs1?get=NAME,group(B01001)&for=metropolitan%20statistical%20area/micropolitan%20statistical%20area:*&key=e3a3dbad3edfa4d96cb59f65931694b311565c63")
    indicatorsJSON = indicators.json()
    dfAll = pd.DataFrame(indicatorsJSON)
    headers = dfAll.iloc[0] # Get the column headers in the first row at index position 0 to make them column names
    new_df  = pd.DataFrame(dfAll.values[1:], columns=headers) # now start at row 0 through the whole dataframe and rename the column headers the variable you just instantiated above 
    new_df2 = new_df.loc[:, ~new_df.columns.str.endswith('EA')] # remove columns with names that end with EA
    new_df3 = new_df2.loc[:, ~new_df2.columns.str.endswith('MA')] # remove columns with names that end with MA
    new_df4 = new_df3.loc[:, ~new_df3.columns.str.endswith('M')] # remove columns with names that end with M
    new_df4 = new_df4[[
"NAME", "B01001_001E", "B01001_002E", "B01001_003E", "B01001_004E", "B01001_005E", "B01001_006E", "B01001_007E", "B01001_008E",
 "B01001_009E", "B01001_010E", "B01001_011E", "B01001_012E", "B01001_013E", "B01001_014E", "B01001_015E", "B01001_016E",
 "B01001_017E", "B01001_018E", "B01001_019E", "B01001_020E", "B01001_021E", "B01001_022E", "B01001_023E", "B01001_024E",
 "B01001_025E", "B01001_026E", "B01001_027E", "B01001_028E", "B01001_029E", "B01001_030E", "B01001_031E", "B01001_032E",
 "B01001_033E", "B01001_034E", "B01001_035E", "B01001_036E", "B01001_037E", "B01001_038E", "B01001_039E", "B01001_040E",
 "B01001_041E", "B01001_042E", "B01001_043E", "B01001_044E", "B01001_045E", "B01001_046E", "B01001_047E", "B01001_048E",
 "B01001_049E", "metropolitan statistical area/micropolitan statistical area"]]
    variabledf = pd.read_html('https://api.census.gov/data/2019/acs/acs5/variables.html') # Grab the table of definitions of the variable names 
    variabledf = variabledf[0] # grab the first element of the html which is the actual table
    variablenamedf = pd.DataFrame(variabledf) # make it into a dataframe 
    filterRows = list(new_df4.columns) # take theMSA data and get the column names (AKA variable names) to filter rows in the variable definitions table
    filterRows2 =filterRows[2:51] # # exclude the MSA names  and geoid columns for the filtering of the rows
    filteredvariabledf = variablenamedf.Name.isin(filterRows2) # filter the rows of the variable name table with the msa column names
    filtered_df = variablenamedf[filteredvariabledf] # return a new filtered dataframe
    newColumnNames = list(filtered_df.Label) # Get the second column of the newly filtered variable definitions table (the actual description of the variale name) This helps in column understanding
    newColumnNames.insert(0,'NAME') # add the originoal column names back onto this list in the first position
    newColumnNames.insert(0,'NAME')
    newColumnNames.append('metropolitan statistical area/micropolitan statistical area')  # add the originoal column names back onto this list in the last position
    new_df4.columns = newColumnNames # Replace the column names of the MSA Variable names with the actual descrition of the variable 
    return new_df4 # Return the new dataframe 

# Needed for years 2018 2017 2015
def mergeprep(dfnew4):
    dfnew4 = pd.DataFrame(dfnew4)
    dfnew4.drop(dfnew4.iloc[:, 49:51], inplace = True, axis = 1) 
    return dfnew4

# Realsituation 
def getformat(dfnew4):
    dfnew4 = pd.DataFrame(dfnew4)
    dfnew4.drop(dfnew4.iloc[:, 50:51], inplace = True, axis = 1)
    return dfnew4

def getformat2(dfnew4):
    dfnew4 = pd.DataFrame(dfnew4)
    dfnew4 =dfnew4[['NAME',
 'Estimate!!Total',
 'Estimate!!Total!!Male',
 'Estimate!!Total!!Male!!Under 5 years',
 'Estimate!!Total!!Male!!5 to 9 years',
 'Estimate!!Total!!Male!!10 to 14 years',
 'Estimate!!Total!!Male!!15 to 17 years',
 'Estimate!!Total!!Male!!18 and 19 years',
 'Estimate!!Total!!Male!!20 years',
 'Estimate!!Total!!Male!!21 years',
 'Estimate!!Total!!Male!!22 to 24 years',
 'Estimate!!Total!!Male!!25 to 29 years',
 'Estimate!!Total!!Male!!30 to 34 years',
 'Estimate!!Total!!Male!!35 to 39 years',
 'Estimate!!Total!!Male!!40 to 44 years',
 'Estimate!!Total!!Male!!45 to 49 years',
 'Estimate!!Total!!Male!!50 to 54 years',
 'Estimate!!Total!!Male!!55 to 59 years',
 'Estimate!!Total!!Male!!60 and 61 years',
 'Estimate!!Total!!Male!!62 to 64 years',
 'Estimate!!Total!!Male!!65 and 66 years',
 'Estimate!!Total!!Male!!67 to 69 years',
 'Estimate!!Total!!Male!!70 to 74 years',
 'Estimate!!Total!!Male!!75 to 79 years',
 'Estimate!!Total!!Male!!80 to 84 years',
 'Estimate!!Total!!Male!!85 years and over',
 'Estimate!!Total!!Female',
 'Estimate!!Total!!Female!!Under 5 years',
 'Estimate!!Total!!Female!!5 to 9 years',
 'Estimate!!Total!!Female!!10 to 14 years',
 'Estimate!!Total!!Female!!15 to 17 years',
 'Estimate!!Total!!Female!!18 and 19 years',
 'Estimate!!Total!!Female!!20 years',
 'Estimate!!Total!!Female!!21 years',
 'Estimate!!Total!!Female!!22 to 24 years',
 'Estimate!!Total!!Female!!25 to 29 years',
 'Estimate!!Total!!Female!!30 to 34 years',
 'Estimate!!Total!!Female!!35 to 39 years',
 'Estimate!!Total!!Female!!40 to 44 years',
 'Estimate!!Total!!Female!!45 to 49 years',
 'Estimate!!Total!!Female!!50 to 54 years',
 'Estimate!!Total!!Female!!55 to 59 years',
 'Estimate!!Total!!Female!!60 and 61 years',
 'Estimate!!Total!!Female!!62 to 64 years',
 'Estimate!!Total!!Female!!65 and 66 years',
 'Estimate!!Total!!Female!!67 to 69 years',
 'Estimate!!Total!!Female!!70 to 74 years',
 'Estimate!!Total!!Female!!75 to 79 years',
 'Estimate!!Total!!Female!!80 to 84 years',
 'Estimate!!Total!!Female!!85 years and over',
 'metropolitan statistical area/micropolitan statistical area']]
    return dfnew4


def format3(df):
    df.insert (0, "NAME2",  demographicsMSA2016['NAME'])
    df = df.rename({'NAME2': 'NAME'}, axis=1) 
    return df



demographicsMSA2019 = GetCensusMSAAgeGroupDemographics2019()
demographicsMSA2018 = GetCensusMSAAgeGroupDemographics2018() # good 
demographicsMSA2017 = GetCensusMSAAgeGroupDemographics2017() # good 
demographicsMSA2016 = GetCensusMSAAgeGroupDemographics2016() # Good name naem 
demographicsMSA2015 = GetCensusMSAAgeGroupDemographics2015() # good 


demographicsMSA2016 =format3(demographicsMSA2016) # like this good name name
demographicsMSA2015 =getformat2(demographicsMSA2015) # Like this good! name name 
demographicsMSA2017 =getformat2(demographicsMSA2017) # Like this good! name name 
demographicsMSA2018 =getformat2(demographicsMSA2018) # Like this good! name name 
#demographicsMSA2019 # Like this good! name name 

demographicsMSA2019['Year'] = 2019
demographicsMSA2018['Year'] = 2018
demographicsMSA2017['Year'] = 2017
demographicsMSA2016['Year'] = 2016
demographicsMSA2015['Year'] = 2015

demographicsMSA2019 = demographicsMSA2019.loc[:,~demographicsMSA2019.columns.duplicated()]
demographicsMSA2018 = demographicsMSA2018.loc[:,~demographicsMSA2018.columns.duplicated()]
demographicsMSA2017 = demographicsMSA2017.loc[:,~demographicsMSA2017.columns.duplicated()]
demographicsMSA2016 = demographicsMSA2016.loc[:,~demographicsMSA2016.columns.duplicated()]
demographicsMSA2015 = demographicsMSA2015.loc[:,~demographicsMSA2015.columns.duplicated()]

#clean up the names (this also removes a few differences with the column names that was causing issues w concatenation)
def colname_cleanup(data):
    data_new = data.copy() #copy into a new pandas dataframe so that it's easier to test
    colnames = data_new.columns.values.tolist()
    colnames = [col.replace(":","") for col in colnames]
    colnames = [col.replace("Estimate!!Total!!","") for col in colnames]
    colnames = [col.replace("!!"," ") for col in colnames]
    colnames = [col.replace("Estimate!!Total:","Population Total") for col in colnames]
    colnames = [col.replace("NAME","MSA Name") for col in colnames]
    colnames = [col.replace("metropolitan statistical area/micropolitan statistical area","MSA Code") for col in colnames]
    colnames = ["Population " + col if "male" in col.lower() else col for col in colnames]
    data_new.columns = colnames
    return data_new


#need to see whats different for the different df's
demographicsMSA2019_f = colname_cleanup(demographicsMSA2019)
demographicsMSA2018_f = colname_cleanup(demographicsMSA2018)
demographicsMSA2017_f = colname_cleanup(demographicsMSA2017)
demographicsMSA2016_f = colname_cleanup(demographicsMSA2016)
demographicsMSA2015_f = colname_cleanup(demographicsMSA2015)

#make the final data
final_data = ( demographicsMSA2015_f.append(demographicsMSA2016_f).append(demographicsMSA2017_f).
              append(demographicsMSA2018_f).append(demographicsMSA2019_f) )

#write to an excel file (reads into PBI slightly better)
final_data.to_excel("Geographical_Data/MSA Census Data PowerBI.xlsx")

