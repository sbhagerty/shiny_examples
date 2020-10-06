library(shiny)

counterButton <- function(id, label = "Vote") {
    ns <- NS(id)
    tagList(
        
        actionButton(ns("button"), label = label),
        verbatimTextOutput(ns("out")),
        imageOutput(ns('myImage'))
    )
}

counterServer <- function(id, image) {
    moduleServer(
        id,
        function(input, output, session) {
            count <- reactiveVal(0)
            observeEvent(input$button, {
                count(count() + 1)
            })
            output$out <- renderText({
                count()
            })
            output$myImage <- renderImage({
                
                list(src = image,
                     contentType = 'image/png',
                     width = '200 px',
                     alt = "This is alternate text")
                
            })
            count
        }
    )
}

ui <- fluidPage(
    h1("This or that"),
    fluidRow(
    column(6, 
    counterButton("winter")),
    column(6,
    counterButton("summer"))
))

server <- function(input, output, session) {
    counterServer("winter", 'winter.png')
    counterServer("summer", 'summer.png')

}

shinyApp(ui, server)
