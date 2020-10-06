library(shiny)
library(reactlog)

# tell shiny to log all reactivity
reactlog_enable()

# run a shiny app
runApp('kmeans')

# once app has closed, display reactlog from shiny
shiny::reactlogShow()
