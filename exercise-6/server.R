library("shiny")
library("ggplot2")
library("dplyr")
library("rsconnect")
data(iris)

shinyServer(function(input, output){
  
   output$plot <- renderPlot({
      ## Do we want semi-transparency?
      if("alpha" %in% input$overplotting)
         alpha <- 0.4
      else
         alpha <- 1
      ## Do we want jittering?
      if("jitter" %in% input$overplotting)
         position <- "jitter"
      else
         position <- "identity"
    p <- ggplot(iris, aes(x=eval(parse(text = paste0('iris$',input$x_axis))),
                          y=eval(parse(text = paste0('iris$',input$y_axis))))) +
      geom_point(aes(colour = factor(iris$Species)), alpha=alpha, position=position) +
      labs(x=input$x_axis, y=input$y_axis)
    
    print(p)
  })
})
