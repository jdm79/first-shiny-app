install.packages('rsconnect')
library(shiny)

ui <- fluidPage(
  
  actionButton(
    inputId = "clicks",
    label = "Create Word Cloud"
  ),
  
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
    hist(data(), main = isolate(input$title))
  })
  output$stats <- renderPrint({
    summary(data())
  })
  observeEvent(input$clicks, {
    print(as.numeric(input$clicks))
  })
}

shinyApp(ui = ui, server = server)


