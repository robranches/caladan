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
  titlePanel("Shine on You Diamond"),
  
  # Sidebar with a slider i)nput for price
  sidebarLayout(
    sidebarPanel(
       sliderInput("Faixa",
                   "Price Range, select minimum Price, all prices in U$",
                   min = 335,
                   max = 18710,
                   value = 100), 
       h4('Instructions'), 
       h4('1- Select the Value of Diamond'),
       h4('2-Wait and check the Plot, Diamond Price x Cut'),
       h4('3-Observe Correlation with minimum Diamond Price and Carat')
     
           ),
       
       mainPanel(  
       plotOutput('distPlot'), verbatimTextOutput("Correl"))
       
    )
  )
)