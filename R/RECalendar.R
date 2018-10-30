#' RECalendar
#'
#'
#'
#' @import htmlwidgets
#'
#' @export
RECalendar <- function(option=NULL, width = NULL, height = NULL, theme = "light",elementId = NULL) {

  # forward options using x
  x = list(
    option=option,
    theme = theme
  )
  x <- jsonlite::toJSON(x,auto_unbox = TRUE)
  # create widget
  htmlwidgets::createWidget(
    name = 'RECalendar',
    x,
    width = width,
    height = height,
    package = 'RECalendar',
    elementId = elementId
  )
}

#' Shiny bindings for RECalendar
#'
#' Output and render functions for using RECalendar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a RECalendar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name RECalendar-shiny
#'
#' @export
RECalendarOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'RECalendar', width, height, package = 'RECalendar')
}

#' @rdname RECalendar-shiny
#' @export
renderRECalendar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, RECalendarOutput, env, quoted = TRUE)
}
