# Workout Program Script
rm(list=ls())
setwd("C:/Users/blake/OneDrive/Workout Program")
exercises <- read.csv("WorkoutExercises.csv")
exercisesofday <- read.csv("ExerciseOfTheDay.csv");colnames(exercisesofday)[1] <- "Date"
# Make day of just full day exercises
exercisesofday <- exercisesofday[exercisesofday$Exercise == "Full",];nrow(exercisesofday)

# Make a cosine vector to multiply 10000 to for the volume of the exercise
t <- seq(from =0,to=17.7,by = .1) #177 days of the year are full body exercises
y=cos(t/2) # make the wave length shorter only 2 periods of max out during the year
plot(t,y,type="l", xlab="time", ylab="Sine wave")
y= as.vector(y)
y = y[-length(y)];length(y)
y
exercisesofday$volume <- c(abs(y*10000)); exercisesofday$volume <- round(exercisesofday$volume,digits = 0)
exercisesofday
# Change format of date column 
exercisesofday$Date  <- format(as.Date(exercisesofday$Date, format="%m/%d/%Y"),"%Y-%m-%d")




# Final Rep scheme funciton just put in exercise of the day or any dataframe with date and volume column 
{
# Make random Rep scheme and give new database based on column 
RepScheme <- function(x) {
  benchmax = 185
  squatmax = 265
  deadliftmax = 315
  
  if(x < 11000 & x > 8000){
    BenchMaxTimeIntensityMain <- benchmax * runif(1, min=.80, max=.85)
    BenchMaxTimeIntensitySecond <- benchmax * runif(1, min=.60, max=.675)
    RepsbenchMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepsbenchSecond <- floor(runif(length(exercisesofday$volume), min=8, max=12))
    SetsbenchMain <- floor(runif(length(exercisesofday$volume), min=1, max=4))
    SetsbenchSecond <- floor(runif(length(exercisesofday$volume), min=7, max=11))
    
    squatMaxTimeIntensityMain <- squatmax * runif(1, min=.80, max=.85)
    squatMaxTimeIntensitySecond <- squatmax * runif(1, min=.60, max=.675)
    RepssquatMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepssquatSecond <- floor(runif(length(exercisesofday$volume), min=8, max=12))
    SetssquatMain <- floor(runif(length(exercisesofday$volume), min=1, max=4))
    SetssquatSecond <- floor(runif(length(exercisesofday$volume), min=7, max=11))
    
    deadMaxTimeIntensityMain <- squatmax * runif(1, min=.80, max=.85)
    deadMaxTimeIntensitySecond <- squatmax * runif(1, min=.60, max=.675)
    RepsdeadMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepsdeadSecond <- floor(runif(length(exercisesofday$volume), min=8, max=12))
    SetsdeadhMain <- floor(runif(length(exercisesofday$volume), min=1, max=4))
    SetsdeadSecond <- floor(runif(length(exercisesofday$volume), min=7, max=11))
    
    BenchMainDf <- data.frame(BenchMaxTimeIntensityMain = BenchMaxTimeIntensityMain,
                              BenchMaxTimeIntensitySecond =BenchMaxTimeIntensitySecond,
                              BenchMainVolume =BenchMaxTimeIntensityMain * (RepsbenchMain * SetsbenchMain), 
                              BenchSecondVolume = BenchMaxTimeIntensitySecond * (RepsbenchSecond * SetsbenchSecond),
                              RepsbenchMain = RepsbenchMain,
                              RepsbenchSecond = RepsbenchSecond,
                              SetsbenchMain = SetsbenchMain,SetsbenchSecond = SetsbenchSecond,
                              squatMaxTimeIntensityMain = squatMaxTimeIntensityMain,
                              squatMaxTimeIntensityMain = squatMaxTimeIntensityMain,
                              squatMaxTimeIntensitySecond = squatMaxTimeIntensitySecond,
                              squatMainVolume =squatMaxTimeIntensityMain * (RepssquatMain * SetssquatMain), 
                              squatSecondVolume = squatMaxTimeIntensitySecond * (RepssquatSecond * SetssquatSecond),
                              RepssquatMain=RepssquatMain,
                              RepssquatSecond=RepssquatSecond,
                              SetssquatMain=SetssquatMain,
                              SetssquatSecond=SetssquatSecond,
                              deadMaxTimeIntensityMain=deadMaxTimeIntensityMain,
                              deadMaxTimeIntensitySecond = deadMaxTimeIntensitySecond,
                              deadMainVolume =deadMaxTimeIntensityMain * (SetsdeadhMain * RepsdeadMain), 
                              deadSecondVolume =deadMaxTimeIntensitySecond * (SetsdeadSecond * RepsdeadSecond), 
                              RepsdeadMain=RepsdeadMain,
                              RepsdeadSecond=RepsdeadSecond,
                              SetsdeadhMain=SetsdeadhMain,
                              SetsdeadSecond=SetsdeadSecond)
    
    

    
    } else if (x < 8000 & x > 6000){
      BenchMaxTimeIntensityMain <- benchmax * runif(1, min=.825, max=.9)
      BenchMaxTimeIntensitySecond <- benchmax * runif(1, min=.70, max=.75)
      RepsbenchMain <- floor(runif(length(exercisesofday$volume), min=2, max=4))
      RepsbenchSecond <- floor(runif(length(exercisesofday$volume), min=5, max=9))
      SetsbenchMain <- floor(runif(length(exercisesofday$volume), min=2, max=4))
      SetsbenchSecond <- floor(runif(length(exercisesofday$volume), min=6, max=9))
      
      squatMaxTimeIntensityMain <- squatmax * runif(1, min=.825, max=.9)
      squatMaxTimeIntensitySecond <- squatmax * runif(1, min=.70, max=.75)
      RepssquatMain <- floor(runif(length(exercisesofday$volume), min=2, max=4))
      RepssquatSecond <- floor(runif(length(exercisesofday$volume), min=5, max=9))
      SetssquatMain <- floor(runif(length(exercisesofday$volume), min=2, max=4))
      SetssquatSecond <- floor(runif(length(exercisesofday$volume), min=5, max=8))
      
      deadMaxTimeIntensityMain <- squatmax * runif(1, min=.825, max=.9)
      deadMaxTimeIntensitySecond <- squatmax * runif(1, min=.70, max=.75)
      RepsdeadMain <- floor(runif(length(exercisesofday$volume), min=2, max=4))
      RepsdeadSecond <- floor(runif(length(exercisesofday$volume), min=5, max=9))
      SetsdeadhMain <- floor(runif(length(exercisesofday$volume), min=2, max=4))
      SetsdeadSecond <- floor(runif(length(exercisesofday$volume), min=5, max=8))
      
      BenchMainDf <- data.frame(BenchMaxTimeIntensityMain = BenchMaxTimeIntensityMain,
                                BenchMaxTimeIntensitySecond =BenchMaxTimeIntensitySecond,
                                BenchMainVolume =BenchMaxTimeIntensityMain * (RepsbenchMain * SetsbenchMain), 
                                BenchSecondVolume = BenchMaxTimeIntensitySecond * (RepsbenchSecond * SetsbenchSecond),
                                RepsbenchMain = RepsbenchMain,
                                RepsbenchSecond = RepsbenchSecond,
                                SetsbenchMain = SetsbenchMain,SetsbenchSecond = SetsbenchSecond,
                                squatMaxTimeIntensityMain = squatMaxTimeIntensityMain,
                                squatMaxTimeIntensityMain = squatMaxTimeIntensityMain,
                                squatMaxTimeIntensitySecond = squatMaxTimeIntensitySecond,
                                squatMainVolume =squatMaxTimeIntensityMain * (RepssquatMain * SetssquatMain), 
                                squatSecondVolume = squatMaxTimeIntensitySecond * (RepssquatSecond * SetssquatSecond),
                                RepssquatMain=RepssquatMain,
                                RepssquatSecond=RepssquatSecond,
                                SetssquatMain=SetssquatMain,
                                SetssquatSecond=SetssquatSecond,
                                deadMaxTimeIntensityMain=deadMaxTimeIntensityMain,
                                deadMaxTimeIntensitySecond = deadMaxTimeIntensitySecond,
                                deadMainVolume =deadMaxTimeIntensityMain * (SetsdeadhMain * RepsdeadMain), 
                                deadSecondVolume =deadMaxTimeIntensitySecond * (SetsdeadSecond * RepsdeadSecond), 
                                RepsdeadMain=RepsdeadMain,
                                RepsdeadSecond=RepsdeadSecond,
                                SetsdeadhMain=SetsdeadhMain,
                                SetsdeadSecond=SetsdeadSecond)
    
  }else if (x < 6000 & x > 3500){
    BenchMaxTimeIntensityMain <- benchmax * runif(1, min=.85, max=.925)
    BenchMaxTimeIntensitySecond <- benchmax * runif(1, min=.75, max=.82)
    RepsbenchMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepsbenchSecond <- floor(runif(length(exercisesofday$volume), min=3, max=5))
    SetsbenchMain <- floor(runif(length(exercisesofday$volume), min=1, max=6))
    SetsbenchSecond <- floor(runif(length(exercisesofday$volume), min=6, max=9))
    
    squatMaxTimeIntensityMain <- squatmax * runif(1, min=.85, max=.925)
    squatMaxTimeIntensitySecond <- squatmax * runif(1, min=.75, max=.82)
    RepssquatMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepssquatSecond <- floor(runif(length(exercisesofday$volume), min=3, max=5))
    SetssquatMain <- floor(runif(length(exercisesofday$volume), min=1, max=6))
    SetssquatSecond <- floor(runif(length(exercisesofday$volume), min=6, max=9))
    
    deadMaxTimeIntensityMain <- squatmax * runif(1, min=.85, max=.925)
    deadMaxTimeIntensitySecond <- squatmax * runif(1, min=.75, max=.82)
    RepsdeadMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepsdeadSecond <- floor(runif(length(exercisesofday$volume), min=3, max=5))
    SetsdeadhMain <- floor(runif(length(exercisesofday$volume), min=1, max=6))
    SetsdeadSecond <- floor(runif(length(exercisesofday$volume), min=6, max=9))
    
    BenchMainDf <- data.frame(BenchMaxTimeIntensityMain = BenchMaxTimeIntensityMain,
                              BenchMaxTimeIntensitySecond =BenchMaxTimeIntensitySecond,
                              BenchMainVolume =BenchMaxTimeIntensityMain * (RepsbenchMain * SetsbenchMain), 
                              BenchSecondVolume = BenchMaxTimeIntensitySecond * (RepsbenchSecond * SetsbenchSecond),
                              RepsbenchMain = RepsbenchMain,
                              RepsbenchSecond = RepsbenchSecond,
                              SetsbenchMain = SetsbenchMain,SetsbenchSecond = SetsbenchSecond,
                              squatMaxTimeIntensityMain = squatMaxTimeIntensityMain,
                              squatMaxTimeIntensityMain = squatMaxTimeIntensityMain,
                              squatMaxTimeIntensitySecond = squatMaxTimeIntensitySecond,
                              squatMainVolume =squatMaxTimeIntensityMain * (RepssquatMain * SetssquatMain), 
                              squatSecondVolume = squatMaxTimeIntensitySecond * (RepssquatSecond * SetssquatSecond),
                              RepssquatMain=RepssquatMain,
                              RepssquatSecond=RepssquatSecond,
                              SetssquatMain=SetssquatMain,
                              SetssquatSecond=SetssquatSecond,
                              deadMaxTimeIntensityMain=deadMaxTimeIntensityMain,
                              deadMaxTimeIntensitySecond = deadMaxTimeIntensitySecond,
                              deadMainVolume =deadMaxTimeIntensityMain * (SetsdeadhMain * RepsdeadMain), 
                              deadSecondVolume =deadMaxTimeIntensitySecond * (SetsdeadSecond * RepsdeadSecond), 
                              RepsdeadMain=RepsdeadMain,
                              RepsdeadSecond=RepsdeadSecond,
                              SetsdeadhMain=SetsdeadhMain,
                              SetsdeadSecond=SetsdeadSecond)
  } else {
    BenchMaxTimeIntensityMain <- benchmax * runif(1, min=.85, max=.925)
    BenchMaxTimeIntensitySecond <- benchmax * runif(1, min=.75, max=.82)
    RepsbenchMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepsbenchSecond <- floor(runif(length(exercisesofday$volume), min=3, max=5))
    SetsbenchMain <- floor(runif(length(exercisesofday$volume), min=1, max=6))
    SetsbenchSecond <- floor(runif(length(exercisesofday$volume), min=6, max=9))
    
    squatMaxTimeIntensityMain <- squatmax * runif(1, min=.85, max=.925)
    squatMaxTimeIntensitySecond <- squatmax * runif(1, min=.75, max=.82)
    RepssquatMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepssquatSecond <- floor(runif(length(exercisesofday$volume), min=3, max=5))
    SetssquatMain <- floor(runif(length(exercisesofday$volume), min=1, max=6))
    SetssquatSecond <- floor(runif(length(exercisesofday$volume), min=6, max=9))
    
    deadMaxTimeIntensityMain <- squatmax * runif(1, min=.85, max=.925)
    deadMaxTimeIntensitySecond <- squatmax * runif(1, min=.75, max=.82)
    RepsdeadMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
    RepsdeadSecond <- floor(runif(length(exercisesofday$volume), min=3, max=5))
    SetsdeadhMain <- floor(runif(length(exercisesofday$volume), min=1, max=6))
    SetsdeadSecond <- floor(runif(length(exercisesofday$volume), min=6, max=9))
    
    BenchMainDf <- data.frame(BenchMaxTimeIntensityMain = BenchMaxTimeIntensityMain,
                              BenchMaxTimeIntensitySecond =BenchMaxTimeIntensitySecond,
                              BenchMainVolume =BenchMaxTimeIntensityMain * (RepsbenchMain * SetsbenchMain), 
                              BenchSecondVolume = BenchMaxTimeIntensitySecond * (RepsbenchSecond * SetsbenchSecond),
                              RepsbenchMain = RepsbenchMain,
                              RepsbenchSecond = RepsbenchSecond,
                              SetsbenchMain = SetsbenchMain,SetsbenchSecond = SetsbenchSecond,
                              squatMaxTimeIntensityMain = squatMaxTimeIntensityMain,
                              squatMaxTimeIntensitySecond = squatMaxTimeIntensitySecond,
                              squatMainVolume =squatMaxTimeIntensityMain * (RepssquatMain * SetssquatMain), 
                              squatSecondVolume = squatMaxTimeIntensitySecond * (RepssquatSecond * SetssquatSecond),
                              RepssquatMain=RepssquatMain,
                              RepssquatSecond=RepssquatSecond,
                              SetssquatMain=SetssquatMain,
                              SetssquatSecond=SetssquatSecond,
                              deadMaxTimeIntensityMain=deadMaxTimeIntensityMain,
                              deadMaxTimeIntensitySecond = deadMaxTimeIntensitySecond,
                              deadMainVolume =deadMaxTimeIntensityMain * (SetsdeadhMain * RepsdeadMain), 
                              deadSecondVolume =deadMaxTimeIntensitySecond * (SetsdeadSecond * RepsdeadSecond), 
                              RepsdeadMain=RepsdeadMain,
                              RepsdeadSecond=RepsdeadSecond,
                              SetsdeadhMain=SetsdeadhMain,
                              SetsdeadSecond=SetsdeadSecond)
    
  }
  exercisesofday <- cbind(exercisesofday,BenchMainDf)
    return(exercisesofday)
}
}

# Put the funciton around the dataframe and then 
finaldf <- RepScheme(exercisesofday)


TodaysWorkout <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
  cat(
  print("Your workout today is: "),
  print(paste0("Bench: ",finaldf$RepsbenchMain," Reps X ",finaldf$SetsbenchMain," Sets of ",round(finaldf$BenchMaxTimeIntensityMain,digits = 0)," lbs.")),
  print(paste0("Bench: ",finaldf$RepsbenchSecond," Reps X ",finaldf$SetsbenchSecond," Sets of ",round(finaldf$BenchMaxTimeIntensitySecond,digits = 0)," lbs.")),
  print(paste0("Squat: ",finaldf$RepssquatMain," Reps X ",finaldf$SetssquatMain," Sets of ",round(finaldf$squatMaxTimeIntensityMain,digits = 0)," lbs.")),
  print(paste0("Squat: ",finaldf$RepssquatSecond," Reps X ",finaldf$SetssquatSecond," Sets of ",round(finaldf$squatMaxTimeIntensitySecond,digits = 0)," lbs.")),
  print(paste0("Dead: ",finaldf$RepsdeadMain," Reps X ",finaldf$SetsdeadhMain," Sets of ",round(finaldf$deadMaxTimeIntensityMain,digits = 0)," lbs.")),
  print(paste0("Dead: ",finaldf$RepsdeadSecond," Reps X ",finaldf$SetsdeadSecond," Sets of ",round(finaldf$deadMaxTimeIntensitySecond,digits = 0)," lbs.")),
  sep = "\n")
  }

TodaysWorkout() # This is the final function to read

# Because it can only send one line at a time i will use multiple funcitons
TodaysWorkout1 <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
    print("Your workout today is: ")
}
TodaysWorkout2 <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
  print(paste0("Bench: ",finaldf$RepsbenchMain," Reps X ",finaldf$SetsbenchMain," Sets of ",round(finaldf$BenchMaxTimeIntensityMain,digits = 0)," lbs."))
}
TodaysWorkout3 <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
  print(paste0("Bench: ",finaldf$RepsbenchSecond," Reps X ",finaldf$SetsbenchSecond," Sets of ",round(finaldf$BenchMaxTimeIntensitySecond,digits = 0)," lbs."))
}
TodaysWorkout4 <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
  print(paste0("Squat: ",finaldf$RepssquatMain," Reps X ",finaldf$SetssquatMain," Sets of ",round(finaldf$squatMaxTimeIntensityMain,digits = 0)," lbs."))
}
TodaysWorkout5 <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
  print(paste0("Squat: ",finaldf$RepssquatSecond," Reps X ",finaldf$SetssquatSecond," Sets of ",round(finaldf$squatMaxTimeIntensitySecond,digits = 0)," lbs."))
}
TodaysWorkout6 <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
  print(paste0("Dead: ",finaldf$RepsdeadMain," Reps X ",finaldf$SetsdeadhMain," Sets of ",round(finaldf$deadMaxTimeIntensityMain,digits = 0)," lbs."))
}
TodaysWorkout7 <- function(x){
  finaldf <- finaldf[finaldf$Date == Sys.Date(),]
  print(paste0("Dead: ",finaldf$RepsdeadSecond," Reps X ",finaldf$SetsdeadSecond," Sets of ",round(finaldf$deadMaxTimeIntensitySecond,digits = 0)," lbs."))
}



 #ACCOUNT SID Get new one
 #Authentication Token Get new one
 # Trial Number Get new one
 #+15674323743
 
 #a9F0cQpht0MlfV2B0sBXN1Ov-Vhp2v-AgFM49fg6

 install.packages("twilio")
 library(twilio)
 
 Sys.setenv(TWILIO_SID = "New one")
 Sys.setenv(TWILIO_TOKEN = "New one")
 usethis::edit_r_environ()
 
 from_number <- "+15674323743"
 to_number <-"+12695783791"

 # my_message <- tw_send_message(
 #   to = Sys.getenv("to_number"),
 #   from = Sys.getenv("from_number"),
 #   body = paste("I am sending this message from an R script!")
 # )
 # names(my_message)
 "+12697190436"
 tw_send_message(
   to = "+12695783791",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout1()))
 )
 tw_send_message(
   to = "+12695783791",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout2()))
 )
 tw_send_message(
   to = "+12695783791",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout3()))
 )
 tw_send_message(
   to = "+12695783791",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout4()))
 )
 tw_send_message(
   to = "+12695783791",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout5()))
 )
 tw_send_message(
   to = "+12695783791",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout6()))
 )
 tw_send_message(
   to = "+12695783791",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout7()))
 )
 
 
 
 tw_send_message(
   to =  "+12697190436",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout1()))
 )
 tw_send_message(
   to =  "+12697190436",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout2()))
 )
 tw_send_message(
   to =  "+12697190436",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout3()))
 )
 tw_send_message(
   to =  "+12697190436",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout4()))
 )
 tw_send_message(
   to =  "+12697190436",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout5()))
 )
 tw_send_message(
   to =  "+12697190436",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout6()))
 )
 tw_send_message(
   to =  "+12697190436",
   from = "+15674323743",
   body =   Reduce(paste, deparse(TodaysWorkout7()))
 )
# # Prototype rep scheme function
# #{
# RepScheme1 <- function(x) {
#   if(x < 11000 & x > 8000){
#     RepsMain <- floor(runif(length(exercisesofday$volume), min=3, max=6))
#     SetsMain <- floor(runif(length(exercisesofday$volume), min=1, max=3))
#     
#   }else if (x < 8000 & x > 0){
#     RepsMain <- floor(runif(length(exercisesofday$volume), min=1, max=4))
#     SetsMain <- floor(runif(length(exercisesofday$volume), min=1, max=6))
#     
#   }
#   exercisesofday <- cbind(exercisesofday,RepsMain,SetsMain)
#   return(exercisesofday)
# }
# }
