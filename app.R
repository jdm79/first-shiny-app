install.packages('rsconnect')
library(shiny)

ui <- fluidPage(
  
  sliderInput(
    inputId = "num",
    label = "Choose a number",
    value = 25, min = 1, max = 100
  ),
  
  textInput(
    inputId = "title",
    label = "Enter title here",
    value = "Default title"
  ),
  plotOutput("hist"),
  verbatimTextOutput("stats")
  
)

server <- function(input, output, session) {
  data <- reactive({ rnorm(input$num)})

  output$hist <- renderPlot({
    hist(data(), main = input$title)
  })
  output$stats <- renderPrint({
    summary(data())
  })
}

shinyApp(ui = ui, server = server)


