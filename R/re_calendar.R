#' plot Calendar heatmap using echarts
#'
#' A R interface to Calendar heatmap in echarts
#'@param data a data.frame with two columns,the fisrt column is date the second is value
#'@param title the title of the plot
#'@param theme the theme of the plot ,it can be c("light","dark"),default is theme="light"
#'@rdname re_calendar
#'
#'@examples library(RECalendar)
#'data = data.frame(date=Sys.Date()+1:400,n=sample(400))
#'re_calendar(data,title="Calendar Heatmap")
#'@references
#' Baidu Echars : http://www.echartsjs.com
#' @export
re_calendar <- function(data,title="",theme="light",width=NULL,height=NULL,cellSize=20,elementId=NULL){
  data <- as.data.frame(data)
  data <- data [,1:2]
  colnames(data) <- c("date","num")
  data$date <- as.Date(data$date)
  data$year = substr(data$date,1,4)
  years = unique(data$year)
  calendar <- list()
  series <- list()
  for (i in 1:length(years)){
    tmp_d <- subset(data,year==years[i],c("date","num"))
    tmp_d <- as.matrix(tmp_d)
    calendar[[i]] = list(range=years[i],
                       cellSize = c("auto",cellSize),
                       top = 70+(i-1)*190,
                       dayLabel = list(nameMap = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))
                       )
    series[[i]] = list(
      type="heatmap",
      coordinateSystem= 'calendar',
      calendarIndex= i-1,
      data = tmp_d
    )
  option = list(
    title = list(
      text=title
    ),
    tooltip = list(
      position = "top"
    ),
    visualMap = list(
      min = min(data$num),
      max = max(data$num),
      calculable = "true",
      orient = 'horizontal',
      left ='center',
      top =  'top'
    ),
    calendar = calendar,
    series = series
  )
  }
  r = RECalendar (option=option,
                 width = width,
                 height = height,
                 theme = theme,
                 elementId=elementId
                 )
  return(r)
}
