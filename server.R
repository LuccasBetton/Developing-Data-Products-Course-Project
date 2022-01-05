library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        
        #Filter data by selected cylinders and transimission
        data <- filter(mtcars,cyl %in% input$cyl)
        data <- filter(data,am %in% input$am)
        
        #Group By Cylinder
        if(input$gr == 1) {
            plot <- ggplot(data,aes(mpg,wt, colour = factor(cyl))) + geom_point() + xlab("Miles per Gallon") + ylab("Weigth") + xlim(input$XRange) + ylim(input$YRange)
            }

        #Group By Transmission
        else if(input$gr == 2) {
            data <- filter(data,cyl %in% input$cyl)
            plot <- ggplot(data,aes(mpg,wt, colour = factor(am))) + geom_point() + xlab("Miles per Gallon") + ylab("Weigth") + xlim(input$XRange) + ylim(input$YRange)}
        
        #No grouping
        else { 
            plot <- ggplot(data,aes(mpg,wt)) + geom_point() + xlab("Miles per Gallon") + ylab("Weigth") + xlim(input$XRange) + ylim(input$YRange)}
        
        #Show linear regression by group or all data
        if(input$lm == 1) {plot <- plot + geom_smooth(method = 'lm')}
        
        plot
    })

})
