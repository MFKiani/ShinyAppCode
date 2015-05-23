library(shiny)


# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application



# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
    
    # Compute the forumla text in a reactive expression since it is 
    # shared by the output$caption and output$mpgPlot expressions
    formulaText <- reactive({
        paste("Normal distributions with mean", input$mean1, "and standard deviation", input$sd1,
              "(in red) and mean",input$mean2, "and standard deviation", input$sd2, "(in blue)")
    })
    
    # Return the formula text for printing as a caption
    output$caption1 <- renderText({
        formulaText()
    })
    
    # Generate a plot of the requested variable against mpg and only 
    # include outliers if requested
    output$normalPlot1 <- renderPlot({
        x=seq(-10,10,length=200)
        y1=dnorm(x,mean=input$mean1,sd=input$sd1)
        plot(x,y1,type="l",lwd=2,col="red")
        par(new = TRUE)
        y2=dnorm(x,mean=input$mean2,sd=input$sd2)
        plot(x,y2,type="l",lwd=2,col="blue")
    })
})