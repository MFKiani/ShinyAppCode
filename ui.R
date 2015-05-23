library(shiny)

# Define UI for Normal Distributions- standard deviation explained
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Normal Distributions"),
    
    # Sidebar to speciy the vaule of mean and standard deviation
    sidebarPanel(
      numericInput("mean1", "Mean of normal distribution in red: (range: -8 to 8)", 0 , min=-8, max=8, step=.25),
      numericInput("sd1", "Standard deviation of normal distribution in red: (range: 1 to 4)", 1 , min=1, max=4, step=.25),
      numericInput("mean2", "Mean of normal distribution in blue: (range: -8 to 8)", 1 , min=-8, max=8, step=.25), 
      numericInput("sd2", "Standard deviation of normal distribution in blue: (range: 1 to 4)", 1 , min=1, max=4, step=.25) 
    ),
    
    # Show the caption and plot of the requested variable against mpg
    mainPanel(
        h3(textOutput("caption1")),
        plotOutput("normalPlot1")
    )
))