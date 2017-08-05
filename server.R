#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data(diamonds)

# Define server logic required to draw gg plot
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot(
    
    
    ggplot(data=subset(diamonds, price >= input$Faixa + 1)) + geom_histogram(binwidth=100, aes(x=price, color=cut))
    + ggtitle("Diamond Price Distribution by Cut") + xlab("Diamond Price U$") +
            ylab("Frequency") + theme_update() + facet_wrap(~cut)
    )
  #output$Correl<-renderPrint(cor.test(diamonds$price, diamonds$carat))})
  output$Correl<-renderPrint(with(subset(diamonds, price >= input$Faixa), cor.test(price, carat)))})
  #cor.test(diamonds$price, diamonds$carat) #<-  
  