#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  r <- reactiveValues(
    HTTP_USER_AGENT = NULL
  )

  observe({
    r$HTTP_USER_AGENT <- session$request$HTTP_USER_AGENT
  })

  output$HTTP_USER_AGENT <- renderText({
    req(r$HTTP_USER_AGENT)
    sprintf("Hello %s", r$HTTP_USER_AGENT)
  })
}
