library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("My first application"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       
       # input for the color
       colourInput(inputId = "color", label = "Color:", value = "purple"),
#       selectInput(inputId = "color", label = "Couleur :",
#                   choices = c("Red" = "red", "Green" = "green", "Blue" = "blue")),
       
       # Title of the chart
       textInput(inputId = "titre", label = "Title:", value = "Histogram"),
       
       
       # Selection of the variable
       radioButtons(inputId = "var", label = "Variable : ", choices = colnames(faithful)),
       
       # Export
       downloadLink('download_plot', 'Download the graph')
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       # Number of bins (div centrée)
       div(textOutput("n_bins"), align = "center"),
       # An horizontal line
       tags$hr(),
       # summary
       verbatimTextOutput("summary"),
       # table
       dataTableOutput("table")
    )
  )
))
