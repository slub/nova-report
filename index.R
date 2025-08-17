## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, error = FALSE, message = FALSE, warning = FALSE)
knitr::opts_knit$set(root.dir = "..")


## ----indexed-records-input----------------------------------------------------
indexed_records_series <- readRDS("data/indexed-records-series.RDS")


## ----indexed-records-plot, eval=F---------------------------------------------
# ggplot2::ggplot(indexed_records_series, ggplot2::aes(x = day, y = count)) +
#   ggplot2::geom_col() +
#   ggplot2::xlab("Erstindexierungsdatum") +
#   ggplot2::ylab("Anzahl Titel") +
#   ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----newitem-records-input----------------------------------------------------
newitem_records_series <- readRDS("data/newitem-records-series.RDS")


## ----newitem-records-plot-----------------------------------------------------
ggplot2::ggplot(newitem_records_series, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Aktivierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----purchase-records-input---------------------------------------------------
purchase_records_series <- readRDS("data/purchase-records-series.RDS")


## ----purchase-records-plot----------------------------------------------------
ggplot2::ggplot(purchase_records_series, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Erwerbungsdatum") +
  ggplot2::ylab("Anzahl Exemplare") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))

