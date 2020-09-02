install.packages("gmailr", lib = "C:/R/R-4.0.2/library")
library(gmailr)
setwd("C://Users//blake//Desktop//TaskScheduler")

gm_auth_configure(  path = "C:\\Users\\blake\\Desktop\\TaskScheduler\\gmail.json")

google_app <- httr::oauth_app(
  "my-awesome-google-api-wrapping-package",
  key = "822157200512-i348fn96tu7a407m6d74esgre438m8qr.apps.googleusercontent.com",
  secret = "cayOdCEJlXGTBtOJFftR8L36"
)

# 822157200512-i348fn96tu7a407m6d74esgre438m8qr.apps.googleusercontent.com
# cayOdCEJlXGTBtOJFftR8L36
options(gargle_oauth_cache = ".secrets")
use_secret_file("gmail.json")

last_message <- "Hello Blake, this is the Covid confirmed cases for the last 10 days!"
my_email_message <- gm_mime() %>%
  gm_to("blaketindol@gmail.com") %>%
  gm_from("balketindol@gmail.com")%>%
  gm_text_body(last_message) %>% 
  gm_attach_file("C://Users//blake//Desktop//TaskScheduler//CovidinCalhounLast10Days.pdf")

gm_create_draft(my_email_message)

gm_send_message(my_email_message)

