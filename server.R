library(datasets)
data(Titanic)

titanic.df <- as.data.frame(Titanic)

survival.odds <- function(class,sex,age) {
  
  survived <- titanic.df[titanic.df$Survived == "Yes",]
  
  if (class != "Any") {
    survived <- subset(survived,Class==class)
  }
  
  if (sex != "Any") {
    survived <- subset(survived,Sex==sex)
  }
  
  if (age != "Any") {
    survived <- subset(survived,Age==age)
  }
  
  survived.count <- sum(survived$Freq)
  total.count = sum(titanic.df[titanic.df$Survived == "Yes",c("Freq")])
  
  survivor_df <- data.frame(total.count, survived.count)
  colnames(survivor_df) = c('Total Survivors','Selected Survivors')
  
  survivorPlot <- barplot(as.matrix(survivor_df), main="Survivors of the Titanic Disaster",
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