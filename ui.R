#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            # Action button
            actionButton("action", label = "Acción"),br(),br(),
            # Button link
            actionLink("alink", label = "Click me!"),br(),br(),
            #Checkbox group
            checkboxGroupInput("chkgrp", label = "Choose: ", choices = c("Tutti", "Frutti","Hola", "Hello")),br(),br(),
            #Checkbox input
            checkboxInput("chkbx", label = "Acepto", value = 1), br(),br(),
            numericInput("numeric", label = "Cuántos steps:", min = 0, max = 20, step = 0.1, value = 1),
            submitButton("Refresh")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textOutput("ActionB"),
            textOutput("output2"),
            textOutput("output3"),
            textOutput("output4"),
            textOutput("output5")
        )
    )
))
