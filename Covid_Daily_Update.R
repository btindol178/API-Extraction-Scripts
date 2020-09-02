# Set Working Directory
setwd("C://Users//blake//Desktop//TaskScheduler")
##########################################################################################################################################################################################
##########################################################################################################################################################################################
##########################################################################################################################################################################################
# Load Librarys
x <- c("ggplot2","reshape2","lubridate","data.table","zoo","riem","dplyr","tidyr","countrycode","RCurl","stringr","tidyverse","shiny","miniUI","taskscheduleR","gtrendsR","tidycensus","sf","leaflet","mapview","viridis","tidyquant","tigris","tmap","sf","maps","tidycensus","scales","tmaptools","purrr","plotly","hrbrthemes","DT")
lapply(x, require, character.only = TRUE)

#install.packages("gmailr", lib = "C:/R/R-4.0.2/library")
require(gmailr)
library(gmailr)
setwd("C://Users//blake//Desktop//TaskScheduler")

gm_auth_configure(path = "C:\\Users\\blake\\Desktop\\TaskScheduler\\gmail.json")

google_app <- httr::oauth_app(
  "my-awesome-google-api-wrapping-package",
  key = "822157200512-i348fn96tu7a407m6d74esgre438m8qr.apps.googleusercontent.com",
  secret = "cayOdCEJlXGTBtOJFftR8L36"
)

# 822157200512-i348fn96tu7a407m6d74esgre438m8qr.apps.googleusercontent.com 
# cayOdCEJlXGTBtOJFftR8L36

#options(gargle_oauth_cache = ".secrets")
#use_secret_file("gmail.json")

##########################################################################################################################################################################################
##########################################################################################################################################################################################
##########################################################################################################################################################################################
# EXTRACT COVID INFORMATION 
download <- getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv")
download1 <- getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv")
# download2 <- getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")

# Make raw data in to csv
confirmed <- read.csv (text = download)
deaths <- read.csv (text = download1)
#recovered <- read.csv (text = download2)

# Reshape dataframe from wide to long
# change the X6.30.20 to the most recent datae
df1 <- confirmed %>% gather(date, confirmed, X1.22.20:ncol(confirmed)) # This makes sure it updates to the newest day..
df2 <- deaths %>% gather(date, deaths, X1.22.20:ncol(deaths))
#df3 <- recovered %>% gather(date, recovered, X1.22.20:ncol(recovered))

df1 <- as.data.frame(df1)
df2 <- as.data.frame(df2)
#df3 <- as.data.frame(df3)

#remove X with " " and . with /
df1$date <- gsub("X","",df1$date)
df2$date <- gsub("X","",df2$date)
#df3$date <- gsub("X","",df3$date)
df1$date <- gsub("\\.","/",df1$date)
df2$date <- gsub("\\.","/",df2$date)
#df3$date <- gsub("\\.","/",df3$date)


# ADD 20 to the end of the date to make it 2020
n = 2;
df1$date = paste(df1$date,rep(2, n), sep = "")
df1$date = paste(df1$date,rep(0, n), sep = "")
df2$date = paste(df2$date,rep(2, n), sep = "")
df2$date = paste(df2$date,rep(0, n), sep = "")
#df3$date = paste(df3$date,rep(2, n), sep = "")
#df3$date = paste(df3$date,rep(0, n), sep = "")

# make date into same format
df1$date <- as.Date(df1$date, format = "%m/%d/%Y")
df2$date <- as.Date(df2$date, format = "%m/%d/%Y")

# merge by city and date
covidusa2<- merge(df1,df2, by = c("UID","date"), all.x = TRUE)
covidusa2 <- covidusa2[c(6,2,8,18,10,11,13,25)]


# change columnnames
colnames(covidusa2)[1] <- "GEOID"
colnames(covidusa2)[2] <- "date"
colnames(covidusa2)[3] <- "state"
colnames(covidusa2)[4] <- "county"
colnames(covidusa2)[5] <- "lat"
colnames(covidusa2)[6] <- "lon"
colnames(covidusa2)[7] <- "confirmed"
colnames(covidusa2)[8] <- "deaths"

covidusa2$GEOID <-ifelse(covidusa2$state == " Alabama",paste("0",covidusa2$GEOID,sep =""),covidusa2$GEOID)
covidusa2$GEOID <-ifelse(covidusa2$state == " Arkansas",paste("0",covidusa2$GEOID,sep =""),covidusa2$GEOID)
covidusa2$GEOID <-ifelse(covidusa2$state == " California",paste("0",covidusa2$GEOID,sep =""),covidusa2$GEOID)
covidusa2$GEOID <-ifelse(covidusa2$state == " Arizona",paste("0",covidusa2$GEOID,sep =""),covidusa2$GEOID)
covidusa2$GEOID <-ifelse(covidusa2$state == " Colorado",paste("0",covidusa2$GEOID,sep =""),covidusa2$GEOID)
covidusa2$GEOID <-ifelse(covidusa2$state == " Connecticut",paste("0",covidusa2$GEOID,sep =""),covidusa2$GEOID)
covidusa2$GEOID <-ifelse(covidusa2$state == " Alaska",paste("0",covidusa2$GEOID,sep =""),covidusa2$GEOID)
# # # 
final_covidz <- covidusa2

write.csv(final_covidz,file="C://Users//blake//Desktop//TaskScheduler//final_covid.csv")

final_covid_calhoun <- final_covidz[final_covidz$state == "Michigan" & final_covidz$county == "Calhoun",c("date","confirmed","deaths")]
# 
# 
 meltdf <- melt(final_covid_calhoun,id="date")
pd <- ggplot(meltdf, aes(x=date, y=value, col=variable)) + geom_line()
ggsave(pd, filename = "C://Users//blake//Desktop//TaskScheduler//my_daily_plot.png")

last_message <- "Hello Blake, this is the Covid confirmed cases for the last 10 days!"
my_email_message <- gm_mime() %>%
  gm_to("blaketindol@gmail.com") %>%
  gm_from("balketindol@gmail.com")%>%
  gm_text_body(last_message) %>% 
  gm_attach_file("C://Users//blake//Desktop//TaskScheduler//my_daily_plot.png")

gm_create_draft(my_email_message)

gm_send_message(my_email_message)

#final_covid_calhoun$date <- as.character(final_covid_calhoun$date)

# Create a lag column for daily covid
  temp = final_covid_calhoun
  var = "deaths"
  var2 = "confirmed"
  lag = 1
  temp1 <- NULL;
  
  for(j in 1:length(temp))
  {
    temp[,paste("l",lag,var,sep = "")] <- NA;
    temp[,paste("l",lag,var2,sep = "")] <- NA;
    temp[(1+lag):nrow(temp),paste("l",lag,var,sep = "")] <- temp[1:(nrow(temp)-lag),var]; 
    temp[(1+lag):nrow(temp),paste("l",lag,var2,sep = "")] <- temp[1:(nrow(temp)-lag),var2]; 
    temp1 <- rbind(temp1,temp)
    print(paste(i,"------",j));
  }
  
final_covid <- temp1
final_covid$daily_confirmed <- final_covid$confirmed - final_covid$l1confirmed
final_covid$daily_deaths <- final_covid$deaths - final_covid$l1deaths
final_covid$daily_covid_confirmed_f <-ifelse(final_covid$daily_confirmed < 0,0,final_covid$daily_confirmed)
final_covid$daily_covid_deaths_f <-ifelse(final_covid$daily_deaths < 0,0,final_covid$daily_deaths)
final_covid <- final_covid %>% distinct()
final_covid <- final_covid[c(1,8,9)]
final_covid[is.na(final_covid)] <-0
colnames(final_covid) <- c("date","confirmed","deaths")
final_covid2 <- tail(final_covid,n = 10)
final_covid2$date <- as.Date(final_covid2$date)

# Make plot and save it
pdf("CovidinCalhounLast10Days.pdf") 
covid_update <- plot(final_covid2$date,final_covid2$confirmed, type="l",col= "green",lwd=5, xlab="date", ylab="confirmed vs deaths")
lines(final_covid2$date,final_covid2$deaths, col="red", lwd=2)
title("Daily Covid in Calhoun last 10 days")

# Add a legend
legend("topleft", 
       legend = c("confirmed", "deaths"), 
       col = c("green", "red"), 
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 1, 
       cex = 1.2, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

dev.off() 


