library(shiny)

shinyServer(function(input, output){
    
    values <- reactiveValues()
    observe({
        input$BMI
        values$bmi <- isolate({
            input$weight/((input$height/100) ** 2)
        })
    })

 output$resultText <- renderText({
        paste("You are a",
              strong(input$gender),
              "of age",
              strong(input$age),
              "years old, with a weight of",
              strong(input$weight),
              "kg and a height of",
              strong(input$height),
              "cm.")
    })

 output$BMIResult <- renderText({
     if(input$BMI == 0) ""
     else
         paste("Therefore, your current BMI value is", 
               strong(values$bmi))
 })
    
 output$BMIStatus <- renderText({
    
     if(input$BMI == 0) ""
     
     else {        
         if (values$bmi < 18.5)
         {
          values$BMIStatus = "Underweight"
         }
         else if (values$bmi < 24.9)
         {
         values$BMIStatus = "Healthy weight"
         }
         else if (values$bmi < 29.9)
         {
          values$BMIStatus = "Overweight"
         }
         else 
         {
        values$BMIStatus = "Obese"
         }
         
        paste("and your BMI category is", em(strong(values$BMIStatus)))
      }
   })
})