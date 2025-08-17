## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, error = FALSE, message = FALSE, warning = FALSE)
knitr::opts_knit$set(root.dir = "..")


## ----newitem-records-input----------------------------------------------------
newitem_records_series <- readRDS("data/newitem-records-series.RDS")


## ----newitem-records-plot, eval=F---------------------------------------------
# ggplot2::ggplot(newitem_records_series, ggplot2::aes(x = day, y = count)) +
#   ggplot2::geom_col() +
#   ggplot2::xlab("") +
#   ggplot2::ylab("Anzahl Neuerwerbungen") +
#   ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))

