#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws the mtcars plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Developing Data Prodcuts - Assigment 4"),
    
    h5("This Application shows the miles per galon by weight from the dataset mtcars"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("YRange",
                        "Y Axis Range - Weight",
                        min = 1.0,
                        max = 4.5,
                        value = c(1.0,4.5),
                        step = 0.5
                        ),
            sliderInput("XRange",
                        "X Axis Range - Miles per Gallon",
                        min = 10.0,
                        max = 34.0,
                        value = c(10.0,34.0)),
            checkboxGroupInput("cyl","Cylinders Selections",choices = list("Cylinder - 4" = 4,"Cylinder - 6" = 6, "Cylinder - 8" = 8),selected = c(4,6,8)),
            checkboxGroupInput("am","Transmission",choices = list("Automatic" = 1,"Manual" = 0),selected = c(0,1)),
            radioButtons("lm","Linear Regression",choices = list("No" = 0,"Yes" = 1),selected = 0),
        radioButtons("gr","Group By",choices = list("Cylinder" = 1,"Transmission" = 2,"None" = 0),selected = 1)
    ),
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
