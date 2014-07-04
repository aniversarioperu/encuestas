library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <- 1:10000  
    
    zstar = qnorm(0.975)
    p = 0.50
    
    # margen de error 3%
    E = 3/100
    
    # n = 1067 personas
    y <- c()
    for( i in x) {
      E = zstar*sqrt(p*(1-p)/i)
      y <- c(y, E*100)
    }
    
    # draw the histogram with the specified number of bins
    plot(x, y, col = 'skyblue', log="x", axes=FALSE, xlab="Personas encuestadas (escala logarítmica)",
         ylab = "Margen de error en porcentaje", type="b")
    axis(2, las=1)
    axis(1, at=c(0,10,100,1000,10000))
    abline(h=input$bins[1])
    
    n = zstar^2*p*(1-p)/(input$bins[1]/100)^2
    abline(v=n)
})
})