library(datasets)
data(Titanic)

titanic.df <- as.data.frame(Titanic)

survival.odds <- function(class,sex,age) {
  
  available <- titanic.df
  survived <- titanic.df[titanic.df$Survived == "Yes",]
  
  if (class != "Any") {
    survived <- subset(survived,Class==class)
    available <- subset(available,Class==class)    
  }
  
  if (sex != "Any") {
    survived <- subset(survived,Sex==sex)
    available <- subset(available,Sex==sex)    
  }
  
  if (age != "Any") {
    survived <- subset(survived,Age==age)
    available <- subset(available,Age==age)    
  }
  
  survived.count <- sum(survived$Freq)
  total.count = sum(available$Freq)
  
  survivor_df <- data.frame(total.count, survived.count)
  colnames(survivor_df) = c('Total in Category','Total Survived in Category')
  
  survivorPlot <- barplot(as.matrix(survivor_df), main="Analysis of the Survivors of the Titanic Disaster",
          xlab="", col=c("darkblue"),
  )
  
}


shinyServer(
  function(input, output) {
    output$oid1 <- renderPrint({input$class})
    output$oid2 <- renderPrint({input$sex})
    output$oid3 <- renderPrint({input$age})
    output$survivorHist <- renderPlot({survival.odds(input$class,input$sex,input$age)})
  }
)