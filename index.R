## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, error = FALSE, message = FALSE, warning = FALSE)
knitr::opts_knit$set(root.dir = "..")


## ----funcs--------------------------------------------------------------------
plot_time_series <- function(time_series, xlab = "Day", ylab = "Count", date_labels = "%Y-%m", date_breaks = "1 month") {
  ggplot2::ggplot(time_series, ggplot2::aes(x = day, y = count)) +
    ggplot2::geom_col() +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(ylab) +
    ggplot2::scale_x_date(date_labels = date_labels, date_breaks = date_breaks) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))
}


## ----indexed-records-input----------------------------------------------------
indexed_records_series <- readRDS("data/indexed-records-series.RDS")


## ----indexed-records-plot-----------------------------------------------------
plot_time_series(indexed_records_series, xlab = "Indexierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y", date_breaks = "1 year")


## ----indexed-records2022------------------------------------------------------
indexed_records_series2022 <- indexed_records_series[grepl("^2022", indexed_records_series$day), ]


## ----indexed-records2022-plot-------------------------------------------------
plot_time_series(indexed_records_series2022, xlab = "Indexierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----indexed-records2023------------------------------------------------------
indexed_records_series2023 <- indexed_records_series[grepl("^2023", indexed_records_series$day), ]


## ----indexed-records2023-plot-------------------------------------------------
plot_time_series(indexed_records_series2023, xlab = "Indexierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----indexed-records2024------------------------------------------------------
indexed_records_series2024 <- indexed_records_series[grepl("^2024", indexed_records_series$day), ]


## ----indexed-records2024-plot-------------------------------------------------
plot_time_series(indexed_records_series2024, xlab = "Indexeriungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----newitem-records-input----------------------------------------------------
newitem_records_series <- readRDS("data/newitem-records-series.RDS")


## ----newitem-records-plot-----------------------------------------------------
plot_time_series(newitem_records_series, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y", date_breaks = "1 year")


## ----newitem-records2022------------------------------------------------------
newitem_records_series2022 <- newitem_records_series[grepl("^2022", newitem_records_series$day), ]


## ----newitem-records2022-plot-------------------------------------------------
plot_time_series(newitem_records_series2022, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----newitem-records2023------------------------------------------------------
newitem_records_series2023 <- newitem_records_series[grepl("^2023", newitem_records_series$day), ]


## ----newitem-records2023-plot-------------------------------------------------
plot_time_series(newitem_records_series2023, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----newitem-records2024------------------------------------------------------
newitem_records_series2024 <- newitem_records_series[grepl("^2024", newitem_records_series$day), ]


## ----newitem-records2024-plot-------------------------------------------------
plot_time_series(newitem_records_series2024, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----purchase-records-input---------------------------------------------------
purchase_records_series <- readRDS("data/purchase-records-series.RDS")


## ----purchase-records-plot----------------------------------------------------
plot_time_series(purchase_records_series, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y", date_breaks = "1 year")


## ----purchase-records2022-----------------------------------------------------
purchase_records_series2022 <- purchase_records_series[grepl("^2022", purchase_records_series$day), ]


## ----purchase-records2022-plot------------------------------------------------
plot_time_series(purchase_records_series2022, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----purchase-records2023-----------------------------------------------------
purchase_records_series2023 <- purchase_records_series[grepl("^2023", purchase_records_series$day), ]


## ----purchase-records2023-plot------------------------------------------------
plot_time_series(purchase_records_series2023, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----purchase-records2024-----------------------------------------------------
purchase_records_series2024 <- purchase_records_series[grepl("^2024", purchase_records_series$day), ]


## ----purchase-records2024-plot------------------------------------------------
plot_time_series(purchase_records_series2024, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")

