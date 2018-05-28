library(shiny)

shinyUI(fluidPage(
  
  titlePanel(em("Body Mass Index Calculation")),
  sidebarLayout(
    sidebarPanel(
       radioButtons("gender",
                     label = h4("What is your gender?"),
                     choices = c("Female", "Male"),
                     inline = TRUE),
        numericInput("age", label = h4("What is your age?"), min = 0, max = 100, 0),
        br(),
        numericInput("weight", label = h4("What is your weight in kg?"), min = 0, max = 200, 0),
        br(),
        numericInput("height", label = h4("What is your height in cm?"), min = 0, max = 300, 0),
        br(),   
        actionButton("BMI", label = "See my BMI Result") 
        ),
    
    mainPanel(
      h2("Result:"),
      br(),
      htmlOutput("resultText"),
      br(),
      htmlOutput("BMIResult"),
      htmlOutput("BMIStatus")
            )
        )
    )
)

