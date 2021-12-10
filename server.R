#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        
        #Filter by selected cylinders
        data <- filter(mtcars,cyl %in% input$cyl)
        
        # draw the plot considering y minimum and maximum inputs 
        plot(data$mpg,data$wt,xlab = "Miles per Galon", ylab = "Weight", ylim = c(input$Min,input$Max))

    })

})
