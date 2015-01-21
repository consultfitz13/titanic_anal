library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Make selections in the dropdown boxes to the left below and click the Submit button 
              to see how many people in that group survived the Titanic Disaster compared to the total number in that group aboard"),
  sidebarPanel(

    selectInput(inputId = "class",
                label = "Passenger Class:",
                choices = c("Any", "1st", "2nd", "3rd","Crew"),
                selected = "Any"),
    
    selectInput(inputId = "sex",
                label = "Sex:",
                choices = c("Any", "Male", "Female"),
                selected = "Any"),

    selectInput(inputId = "age",
                label = "Age:",
                choices = c("Any", "Adult", "Child"),
                selected = "Any"),
    
    submitButton('Submit')
    
    ),
  mainPanel(
    h3('Your selections'),
    h4('You entered'),
    verbatimTextOutput("oid1"),
    h4('You entered'),
    verbatimTextOutput("oid2"),
    h4('You entered'),
    verbatimTextOutput("oid3"),
    h4('Comparison of total survivors vs. select survivors'),
    plotOutput('survivorHist')
  )
))
