# ui.R

library(shiny)

shinyUI(fluidPage(
  # Documentation (Tài liệu hướng dẫn)
  titlePanel("Predicting Mileage (MPG) from Horsepower (mtcars data)"),
  p("This application predicts a car's Miles per Gallon (MPG) based on its Horsepower (HP) using a linear regression model derived from the 'mtcars' dataset."),
  p("Instructions: Use the slider on the left to select the desired HP value. The predicted MPG will update below, and the corresponding point will be highlighted in red on the plot."),
  hr(), # Horizontal line separator
  
  # Sidebar with a slider input for Horsepower
  sidebarLayout(
    sidebarPanel(
      sliderInput("inputHP",
                  "1. Select Horsepower (HP):",
                  # Dữ liệu mtcars có HP từ 52 đến 335
                  min = 50,
                  max = 350,
                  value = 150)
    ),
    
    # Show the predicted MPG and a plot
    mainPanel(
      h3("2. Results and Visualization"),
      
      # Reactive output: Predicted MPG
      h4("Predicted MPG:"),
      verbatimTextOutput("predMPG"),
      
      # Reactive output: Plot
      h4("Relationship between HP and MPG:"),
      plotOutput("mpgPlot")
    )
  )
))