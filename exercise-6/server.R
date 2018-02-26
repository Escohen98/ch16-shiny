library("shiny")
library("ggplot2")
library("dplyr")
library("rsconnect")
data(iris)

shinyServer(function(input, output){
  
output$plot <- renderPlot({
    p <- ggplot(iris, aes(x=eval(parse(text = paste0('iris$',input$x_axis))),
                          y=eval(parse(text = paste0('iris$',input$y_axis))))) +
      geom_point(aes(colour = factor(iris$Species))) +
      labs(x=input$x_axis, y=input$y_axis)
    
    print(p)
  })
})