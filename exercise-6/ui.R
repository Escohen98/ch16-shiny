library("shiny")
library(dplyr)
data(iris)

#Generate names for dropdown menu
y_colnames <- select(iris, -Species) %>% colnames()
x_colnames <- select(iris, -Species) %>% colnames()

# Creates UI part of page
shinyUI(fluidPage(
  titlePanel("Iris Dataset Information"),

  sidebarPanel(
    selectInput(inputId = 'x_axis', choices = x_colnames, label = "Select x axis variable", selected = 'Sepal.Length'),
    selectInput(inputId = 'y_axis', choices = y_colnames, label = "Select y axis variable", selected = 'Sepal.Width'),
    checkboxGroupInput("overplotting", "Avoid overplotting",
                       choices = list("Jitter data" = "jitter",
                                      "Semi-transparency" = "alpha"),
                       selected = NULL)
  ),
  mainPanel(
    plotOutput('plot')
  )
  
))
