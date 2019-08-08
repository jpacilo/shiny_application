# author : jpacilo
# date : 8/8/19

pageWithSidebar(
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
)