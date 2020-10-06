library(shiny)

counterButton <- function(id, label = "Vote") {
    ns <- NS(id)
    tagList(
        actionButton(ns("button"), label = label),
        verbatimTextOutput(ns("out"))
    )
}

counterServer <- function(id) {
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
            count
        }
    )
}

ui <- fluidPage(
    h1("Choose a counter"),
    column(6,
    counterButton("winter")
    ),
    column(6,
           counterButton("summer")
           )
)

server <- function(input, output, session) {
    counterServer("winter")
    counterServer("summer")
}

shinyApp(ui, server)