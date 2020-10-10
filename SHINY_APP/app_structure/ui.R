library(shiny)
library(colourpicker)

# Define UI for application that draws a histogram
shinyUI(
  # navbarPage
  navbarPage("Second app",
             
             # First tab Data
             tabPanel("Data", 
                      # table
                      dataTableOutput("table"),
                      # summary
                      verbatimTextOutput("summary")
             ), 
             
             # Second tab Visualization
             tabPanel("Visualization", 
                      
                      # Sidebar with a slider input for number of bins 
                      sidebarLayout(
                        sidebarPanel(
                          sliderInput("bins",
                                      "Number of bins:",
                                      min = 1,
                                      max = 50,
                                      value = 30),
                          
                          # input for the color
                          colourInput(inputId = "color", label = "Color :", value = "purple"),
                          
                          # title of the graph
                          textInput(inputId = "titre", label = "Title :", value = "Histogram"),
                          
                          # selection of the variable
                          radioButtons(inputId = "var", label = "Variable : ", choices = colnames(faithful))
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                          plotOutput("distPlot"),
                          # classes (div centrée)
                          div(textOutput("n_bins"), align = "center")
                        )
                      )
             )
  )
)
