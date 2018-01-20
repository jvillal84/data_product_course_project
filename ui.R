#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

require(shiny)
require(rmarkdown)

# Define UI for application that draws a histogram
# shinyUI(fluidPage(
#   
#   # Application title
#   headerPanel("Annual deaths in road accidents for half the US states"),
# 
#   # Sidebar with a slider input for number of bins 
#   sidebarLayout(
#     sidebarPanel(
#         selectInput("x", label = h3("Compare # of deaths with:"), 
#                     choices = list("Number of drivers (in 10000s)"="drivers",
#                                    "Population density in people per square mile"="popden",
#                                    "Length of rural roads (in 1000s of miles)"="rural",
#                                    "Average daily maximum temperature in January"="temp",
#                                    "Fuel consumption (in 10M US gallons per year)"="fuel"),
#                     selected="drivers"),
#         hr(),
#         fluidRow(column(2, verbatimTextOutput("value")))
#     ),
#     
#     # Show a plot of the generated distribution
#     mainPanel(
#         tabsetPanel(
#             tabPanel("Scatterplot", plotOutput("distPlot")), 
#             tabPanel("Bar", plotOutput("distPlot2")), 
#             tabPanel("Map", htmlOutput("gvis"))
#         )
#     )
#   )
# ))
shinyUI(
    navbarPage("Annual deaths in road accidents for half the US states",
        tabPanel(p(icon("navicon"),"Main"),
        # Sidebar with a slider input for number of bins 
            sidebarPanel(
                selectInput("x", label = h3("Compare # of deaths with:"), 
                        choices = list("Number of drivers (in 10000s)"="drivers",
                                       "Population density in people per square mile"="popden",
                                       "Length of rural roads (in 1000s of miles)"="rural",
                                       "Average daily maximum temperature in January"="temp",
                                       "Fuel consumption (in 10M US gallons per year)"="fuel"),
                        selected="drivers"),
                hr(),
                fluidRow(column(2, verbatimTextOutput("value")))
            ),
        
            # Show a plot of the generated distribution
            mainPanel(
                tabsetPanel(
                    tabPanel("Scatterplot", plotOutput("distPlot")), 
                    tabPanel("Bar", plotOutput("distPlot2")),
                    tabPanel("Map", htmlOutput("gvis"))
                    
                )
            )
        ),
        tabPanel(p(icon("question-circle"), "Documentation"),
                 mainPanel(
                     includeMarkdown("doc.Rmd"))
        )
    )
    
)
