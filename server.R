#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(MASS)
library(dplyr)
library(ggplot2)
library(plotly)
require(googleVis)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({

    data <- road %>% select(xn=input$x, deaths=deaths) %>% mutate(state=row.names(road))

    # generate bins based on input$bins from ui.R
    ggplot(data, aes(x=xn, y=deaths)) + geom_point() + geom_smooth(method='lm') + xlab(input$x)

  })
  output$distPlot2 <- renderPlot({
      
      data1 <- road %>% select(value=deaths) %>% mutate(state=row.names(road), type="deaths")
      data2 <- road %>% select(value=input$x) %>% mutate(state=row.names(road), type=as.character(input$x))
      
      data <- rbind(data1,data2)
      
      # generate bins based on input$bins from ui.R
      ggplot(data, aes(x=reorder(state,value), y=value, fill=type)) + geom_bar(stat='identity') + coord_flip()
      
  })
  output$gvis <- renderGvis({
      data <- road %>% select(xn=input$x, deaths=deaths) %>% mutate(state=row.names(road), info=paste0(input$x,": ",as.character(xn)))
      gvisGeoChart(data, "state", "deaths",hovervar = "info",
                   options=list(region="US", 
                                displayMode="regions", 
                                resolution="provinces",
                                width=900, height=600))
      
  })

})