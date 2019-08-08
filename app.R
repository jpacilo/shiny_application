# author : jpacilo
# date : 8/8/19

library(shiny)

ui <- fluidPage(pageWithSidebar(
        headerPanel('K-Means Clustering x 1974 Motor Trend US Dataset'),
        sidebarPanel(
                selectInput('xcol', 'x-variable?', names(mtcars)),
                selectInput('ycol', 'y-variable?', names(mtcars),
                            selected = names(mtcars)[[2]]),
                numericInput('clusters', 'how many clusters?', 3,
                             min = 1, max = 12)
        ),
        mainPanel(
                plotOutput('plot_me')
        )
))

server <- function(input, output, session) {
        
        selectedData <- reactive({
                mtcars[, c(input$xcol, input$ycol)]
        })
        
        clusters <- reactive({
                kmeans(selectedData(), input$clusters)
        })
        
        output$plot_me <- renderPlot({
                palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
                
                par(mar = c(5.1, 4.1, 0, 1))
                plot(selectedData(),
                     col = clusters()$cluster,
                     pch = 20, cex = 3)
                points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
        })
        
}

shinyApp(ui = ui, server = server)
