# RECalendar
RECalendar

A R interface of Calendar heatmap by echars.

## install 

```
devtools::install("lengyuyeke/RECalendar")
```

## Examples 
```
library(RECalendar)
data = data.frame(date=Sys.Date()+1:400,n=sample(400))
re_calendar(data,title="Calendar Heatmap")
```
