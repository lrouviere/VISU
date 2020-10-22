
# Define UI for application that draws a histogram
shinyUI(
  # navbarPage
  navbarPage("Third app",
             
             # theme css
             theme = "css/bootstrap2.min.css",
             
             # First tab Data
             tabPanel("Data", 
                      navlistPanel(
                        widths = c(2, 10), 
                        tabPanel("Table", 
                                 # titre avec css
                                 h1("Dataset", style = "color : #0099ff;text-align:center"),
                                 # table
                                 dataTableOutput("table")),
                        tabPanel("Summary",verbatimTextOutput("summary"))
                      )
             ), 
             
             # second tab Visualization
             tabPanel("Visualization", 
                      
                      fluidRow(
                        # first column
                        column(width = 3, 
                               # wellPanel for grey background
                               wellPanel(
                                 sliderInput("bins",
                                             "Number of bins:",
                                             min = 1,
                                             max = 50,
                                             value = 30),
                                 
                                 # input for color
                                 colourInput(inputId = "color", label = "Couleur :", value = "purple"),
                                 
                                 # title
                                 textInput(inputId = "titre", label = "Titre :", value = "Histogram"),
                                 
                                 # variable choice
                                 radioButtons(inputId = "var", label = "Variable : ", choices = colnames(faithful)),
                                 
                                 # button
                                 actionButton("go", "GO!!!")
                               )
                        ), 
                        # second column
                        column(width = 9, 
                               tabsetPanel(id = "viz", 
                                 tabPanel("Histogram", 
                                          # plotOutput -> amChartsOutput
                                          amChartsOutput("distPlot"),
                                          # classes (div centrée)
                                          div(textOutput("n_bins"), align = "center")
                                 ),
                                 tabPanel("Boxplot", amChartsOutput("boxplot"))
                               )
                        )
                      )
             ),
             # Tab for Ensai
             tabPanel("About",
                      # add an image with img()
                      # it should be in www
                      img(src = "img/logoEnsai.png", width = 200),
                      tags$hr(),
#                      "En tant que filiale du GENES, ", 
                      a(href = "ensai.fr/2-cursus/msc-statistics-for-smart-data/", "Master Smart Data"), 
                      ": the Master in Statistics for Smart Data at ENSAI is a unique and innovative program..."
             )
  )
)