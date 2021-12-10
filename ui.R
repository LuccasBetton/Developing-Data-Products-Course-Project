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
            sliderInput("Min",
                        "Minimum Weight - Y Axis Minium Value",
                        min = 1,
                        max = 5,
                        value = 1),
            sliderInput("Max",
                        "Maximum Weight  - Y Axis Maximum Value",
                        min = 2,
                        max = 5,
                        value = 5),
            checkboxGroupInput("cyl","Cylinders Selections",choices = list("Cylinder - 4" = 4,"Cylinder - 6" = 6, "Cylinder - 8" = 8),selected = 4)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
