## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, error = FALSE, message = FALSE, warning = FALSE)
knitr::opts_knit$set(root.dir = "..")


## ----indexed-records-input----------------------------------------------------
indexed_records_series <- readRDS("data/indexed-records-series.RDS")


## ----indexed-records-plot-----------------------------------------------------
ggplot2::ggplot(indexed_records_series, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Indexierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----indexed-records2022------------------------------------------------------
indexed_records_series2022 <- indexed_records_series[grepl("^2022", indexed_records_series$day), ]


## ----indexed-records2022-plot-------------------------------------------------
ggplot2::ggplot(indexed_records_series2022, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Indexierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----indexed-records2023------------------------------------------------------
indexed_records_series2023 <- indexed_records_series[grepl("^2023", indexed_records_series$day), ]


## ----indexed-records2023-plot-------------------------------------------------
ggplot2::ggplot(indexed_records_series2023, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Indexierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----indexed-records2024------------------------------------------------------
indexed_records_series2024 <- indexed_records_series[grepl("^2024", indexed_records_series$day), ]


## ----indexed-records2024-plot-------------------------------------------------
ggplot2::ggplot(indexed_records_series2024, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Indexierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----newitem-records-input----------------------------------------------------
newitem_records_series <- readRDS("data/newitem-records-series.RDS")


## ----newitem-records-plot-----------------------------------------------------
ggplot2::ggplot(newitem_records_series, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Aktivierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----newitem-records2022------------------------------------------------------
newitem_records_series2022 <- newitem_records_series[grepl("^2022", newitem_records_series$day), ]


## ----newitem-records2022-plot-------------------------------------------------
ggplot2::ggplot(newitem_records_series2022, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Aktivierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----newitem-records2023------------------------------------------------------
newitem_records_series2023 <- newitem_records_series[grepl("^2023", newitem_records_series$day), ]


## ----newitem-records2023-plot-------------------------------------------------
ggplot2::ggplot(newitem_records_series2023, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Aktivierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----newitem-records2024------------------------------------------------------
newitem_records_series2024 <- newitem_records_series[grepl("^2024", newitem_records_series$day), ]


## ----newitem-records2024-plot-------------------------------------------------
ggplot2::ggplot(newitem_records_series2024, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Aktivierungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----purchase-records-input---------------------------------------------------
purchase_records_series <- readRDS("data/purchase-records-series.RDS")


## ----purchase-records-plot----------------------------------------------------
ggplot2::ggplot(purchase_records_series, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Erwerbungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----purchase-records2022-----------------------------------------------------
purchase_records_series2022 <- purchase_records_series[grepl("^2022", purchase_records_series$day), ]


## ----purchase-records2022-plot------------------------------------------------
ggplot2::ggplot(purchase_records_series2022, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Erwerbungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----purchase-records2023-----------------------------------------------------
purchase_records_series2023 <- purchase_records_series[grepl("^2023", purchase_records_series$day), ]


## ----purchase-records2023-plot------------------------------------------------
ggplot2::ggplot(purchase_records_series2023, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Erwerbungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))


## ----purchase-records2024-----------------------------------------------------
purchase_records_series2024 <- purchase_records_series[grepl("^2024", purchase_records_series$day), ]


## ----purchase-records2024-plot------------------------------------------------
ggplot2::ggplot(purchase_records_series2024, ggplot2::aes(x = day, y = count)) +
  ggplot2::geom_col() +
  ggplot2::xlab("Erwerbungsdatum") +
  ggplot2::ylab("Anzahl Titel") +
  ggplot2::scale_x_date(date_labels = "%Y-%m", date_breaks = "1 month") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))

