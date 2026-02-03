## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, error = FALSE, message = FALSE, warning = FALSE)
knitr::opts_knit$set(root.dir = "..")


## ----funcs--------------------------------------------------------------------
plot_time_series_day <- function(time_series, xlab = "Day", ylab = "Count", date_labels = "%Y-%m", date_breaks = "1 month") {
  ggplot2::ggplot(time_series, ggplot2::aes(x = day, y = count)) +
    ggplot2::geom_col() +
    ggplot2::scale_y_continuous(labels = scales::label_number(scale_cut = scales::cut_short_scale())) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(ylab) +
    ggplot2::scale_x_date(date_labels = date_labels, date_breaks = date_breaks) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))
}

plot_time_series_month <- function(time_series, xlab = "Month", ylab = "Count") {
  ggplot2::ggplot(time_series, ggplot2::aes(x = month, y = count)) +
    ggplot2::geom_col() +
    ggplot2::scale_y_continuous(labels = scales::label_number(scale_cut = scales::cut_short_scale())) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(ylab) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, hjust = 1))
}

decode_html <- function(value) {
  rvest::html_text(rvest::read_html(paste0("<html><body>", value, "</body></html>")))
}

parse_publisher <- function(values) {
  if (is.null(values)) {
    NA
  } else {
    value <- paste0(gsub("  *$", "", unlist(values)), collapse = " ; ")
    value <- decode_html(value)
    value
  }
}

parse_records <- function(records) {
  data.frame(
    id = unlist(lapply(records, function(x) x$id)),
    format = unlist(lapply(records, function(x) ifelse(is.null(x$record$format), NA, x$record$format))),
    title = unlist(lapply(records, function(x) ifelse(is.null(x$record$title), NA, decode_html(x$record$title)))),
    contributors = unlist(lapply(records, function(x) ifelse(is.null(x$record$contributor), NA, paste0(unlist(x$record$contributor), collapse = " ; ")))),
    publisher = unlist(lapply(records, function(x) parse_publisher(x$record$publisher)))
  )
}

parse_indexed <- function(records) {
  records_df <- parse_records(records)
  records_df$date <- unlist(lapply(records, function(x) gsub("T.*Z", "", unlist(x$nova))))
  records_df
}

parse_newitem <- function(records) {
  records_df <- parse_records(records)
  records_df$date <- unlist(lapply(records, function(x) gsub("T00:00:00Z", "", x$nova$newitem_date)))
  records_df
}

parse_purchase <- function(records) {
  records_df <- parse_records(records)
  records_df$date <- unlist(lapply(records, function(x) gsub("T00:00:00Z", "", x$nova$purchase_date)))
  records_df
}

print_record <- function(doc, date_label = "Veröffentlichungsdatum") {
  recordstr <- ""
  if ("title" %in% names(doc) && !is.na(doc$title) && !grepl("^$", doc$title)) {
    recordstr <- paste0("**Titel** ", doc$title)
  }
  if ("contributors" %in% names(doc) && !is.na(doc$contributors) && !grepl("^$", doc$contributors)) {
    recordstr <- paste0(recordstr, " **Beteiligte** ", doc$contributors)
  }
  recordstr <- paste0(recordstr, " **Medientyp** ", doc$format)
  if ("publisher" %in% names(doc) && !is.na(doc$publisher) && !grepl("^$", doc$publisher)) {
    recordstr <- paste0(recordstr, " **Erschienen** ", doc$publisher)
  }
  recordstr <- paste0(recordstr, " **", date_label, "** ", doc$date)
  recordstr <- paste0(recordstr, " **SLUB-Katalog** [", doc$id, "](https://katalog.slub-dresden.de/id/", doc$id, ")")
  recordstr <- paste0(recordstr, "\n")
  recordstr
}

print_n <- function(number) {
  format(number, big.mark = ".", decimal.mark = ",")
}


## ----indexed-records-input----------------------------------------------------
indexed_records_series_daily <- readRDS("data/indexed-records-series-daily.RDS")
indexed_records_series_monthly <- readRDS("data/indexed-records-series-monthly.RDS")
indexed_records_sample <- readRDS("data/indexed-records-sample-full.RDS")


## ----indexed-records-plot, eval=F---------------------------------------------
# plot_time_series_day(indexed_records_series_daily, xlab = "Indexierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y", date_breaks = "1 year")


## ----indexed-records-plot-monthly---------------------------------------------
plot_time_series_month(indexed_records_series_monthly, xlab = "Indexierungsdatum", ylab = "Anzahl Titel")


## ----indexed-records2022------------------------------------------------------
indexed_records_series_daily2022 <- indexed_records_series_daily[grepl("^2022", indexed_records_series_daily$day), ]
indexed_records_series_monthly2022 <- indexed_records_series_monthly[grepl("^2022", indexed_records_series_monthly$month), ]


## ----indexed-records2022-plot, eval=F-----------------------------------------
# plot_time_series_day(indexed_records_series_daily2022, xlab = "Indexierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----indexed-records2022-plot-monthly-----------------------------------------
plot_time_series_month(indexed_records_series_monthly2022, xlab = "Indexierungsdatum", ylab = "Anzahl Titel")


## ----indexed-records2023------------------------------------------------------
indexed_records_series_daily2023 <- indexed_records_series_daily[grepl("^2023", indexed_records_series_daily$day), ]
indexed_records_series_monthly2023 <- indexed_records_series_monthly[grepl("^2023", indexed_records_series_monthly$month), ]


## ----indexed-records2023-plot, eval=F-----------------------------------------
# plot_time_series_day(indexed_records_series_daily2023, xlab = "Indexierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----indexed-records2023-plot-monthly-----------------------------------------
plot_time_series_month(indexed_records_series_monthly2023, xlab = "Indexierungsdatum", ylab = "Anzahl Titel")


## ----indexed-records2024------------------------------------------------------
indexed_records_series_daily2024 <- indexed_records_series_daily[grepl("^2024", indexed_records_series_daily$day), ]
indexed_records_series_monthly2024 <- indexed_records_series_monthly[grepl("^2024", indexed_records_series_monthly$month), ]


## ----indexed-records2024-plot, eval=F-----------------------------------------
# plot_time_series_day(indexed_records_series_daily2024, xlab = "Indexierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----indexed-records2024-plot-monthly-----------------------------------------
plot_time_series_month(indexed_records_series_monthly2024, xlab = "Indexierungsdatum", ylab = "Anzahl Titel")


## ----indexed-records-sample---------------------------------------------------
indexed_records_sample_df <- parse_indexed(indexed_records_sample)
indexed_records_sample_df <- indexed_records_sample_df[with(indexed_records_sample_df, order(date, id)), ]
indexed_records_sample_df <- indexed_records_sample_df[!is.na(indexed_records_sample_df$title), ]


## ----indexed-records-sample-print, results="asis"-----------------------------
for (i in seq_len(nrow(indexed_records_sample_df))) {
  doc <- indexed_records_sample_df[i, ]
  cat(print_record(doc, date_label = "Indexierungsdatum"), sep = "")
  cat("\n", sep = "")
}


## ----newitem-records-input----------------------------------------------------
newitem_records_series_daily <- readRDS("data/newitem-records-series-daily.RDS")
newitem_records_series_monthly <- readRDS("data/newitem-records-series-monthly.RDS")
newitem_records_sample <- readRDS("data/newitem-records-sample-full.RDS")


## ----newitem-records-plot, eval=F---------------------------------------------
# plot_time_series_day(newitem_records_series_daily, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y", date_breaks = "1 year")


## ----newitem-records-plot-monthly---------------------------------------------
plot_time_series_month(newitem_records_series_monthly, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel")


## ----newitem-records2022------------------------------------------------------
newitem_records_series_daily2022 <- newitem_records_series_daily[grepl("^2022", newitem_records_series_daily$day), ]
newitem_records_series_monthly2022 <- newitem_records_series_monthly[grepl("^2022", newitem_records_series_monthly$month), ]


## ----newitem-records2022-plot, eval=F-----------------------------------------
# plot_time_series_day(newitem_records_series_daily2022, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----newitem-records2022-monthly-plot-----------------------------------------
plot_time_series_month(newitem_records_series_monthly2022, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel")


## ----newitem-records2023------------------------------------------------------
newitem_records_series_daily2023 <- newitem_records_series_daily[grepl("^2023", newitem_records_series_daily$day), ]
newitem_records_series_monthly2023 <- newitem_records_series_monthly[grepl("^2023", newitem_records_series_monthly$month), ]


## ----newitem-records2023-plot, eval=F-----------------------------------------
# plot_time_series_day(newitem_records_series_daily2023, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----newitem-records2023-monthly-plot-----------------------------------------
plot_time_series_month(newitem_records_series_monthly2023, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel")


## ----newitem-records2024------------------------------------------------------
newitem_records_series_daily2024 <- newitem_records_series_daily[grepl("^2024", newitem_records_series_daily$day), ]
newitem_records_series_monthly2024 <- newitem_records_series_monthly[grepl("^2024", newitem_records_series_monthly$month), ]


## ----newitem-records2024-plot, eval=F-----------------------------------------
# plot_time_series_day(newitem_records_series_daily2024, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----newitem-records2024-monthly-plot-----------------------------------------
plot_time_series_month(newitem_records_series_monthly2024, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel")


## ----newitem-records2025------------------------------------------------------
newitem_records_series_daily2025 <- newitem_records_series_daily[grepl("^2025", newitem_records_series_daily$day), ]
newitem_records_series_monthly2025 <- newitem_records_series_monthly[grepl("^2025", newitem_records_series_monthly$month), ]


## ----newitem-records2025-plot, eval=F-----------------------------------------
# plot_time_series_day(newitem_records_series_daily2025, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----newitem-records2025-monthly-plot-----------------------------------------
plot_time_series_month(newitem_records_series_monthly2025, xlab = "Aktivierungsdatum", ylab = "Anzahl Titel")


## ----newitem-records-sample---------------------------------------------------
newitem_records_sample_df <- parse_newitem(newitem_records_sample)
newitem_records_sample_df <- newitem_records_sample_df[with(newitem_records_sample_df, order(date, id)), ]
newitem_records_sample_df <- newitem_records_sample_df[!is.na(newitem_records_sample_df$title), ]


## ----newitem-records-sample-print, results="asis"-----------------------------
for (i in seq_len(nrow(newitem_records_sample_df))) {
  doc <- newitem_records_sample_df[i, ]
  cat(print_record(doc, date_label = "Aktivierungsdatum"), sep = "")
  cat("\n", sep = "")
}


## ----purchase-records-input---------------------------------------------------
purchase_records_series_daily <- readRDS("data/purchase-records-series-daily.RDS")
purchase_records_series_monthly <- readRDS("data/purchase-records-series-monthly.RDS")
purchase_records_sample <- readRDS("data/purchase-records-sample-full.RDS")


## ----purchase-records-plot, eval=F--------------------------------------------
# plot_time_series_day(purchase_records_series_daily, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y", date_breaks = "1 year")


## ----purchase-records-plot-monthly--------------------------------------------
plot_time_series_month(purchase_records_series_monthly, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel")


## ----purchase-records2022-----------------------------------------------------
purchase_records_series_daily2022 <- purchase_records_series_daily[grepl("^2022", purchase_records_series_daily$day), ]
purchase_records_series_monthly2022 <- purchase_records_series_monthly[grepl("^2022", purchase_records_series_monthly$month), ]


## ----purchase-records2022-plot, eval=F----------------------------------------
# plot_time_series_day(purchase_records_series_daily2022, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----purchase-records2022-plot-monthly----------------------------------------
plot_time_series_month(purchase_records_series_monthly2022, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel")


## ----purchase-records2023-----------------------------------------------------
purchase_records_series_daily2023 <- purchase_records_series_daily[grepl("^2023", purchase_records_series_daily$day), ]
purchase_records_series_monthly2023 <- purchase_records_series_monthly[grepl("^2023", purchase_records_series_monthly$month), ]


## ----purchase-records2023-plot, eval=F----------------------------------------
# plot_time_series_day(purchase_records_series_daily2023, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----purchase-records2023-plot-monthly----------------------------------------
plot_time_series_month(purchase_records_series_monthly2023, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel")


## ----purchase-records2024-----------------------------------------------------
purchase_records_series_daily2024 <- purchase_records_series_daily[grepl("^2024", purchase_records_series_daily$day), ]
purchase_records_series_monthly2024 <- purchase_records_series_monthly[grepl("^2024", purchase_records_series_monthly$month), ]


## ----purchase-records2024-plot, eval=F----------------------------------------
# plot_time_series_day(purchase_records_series_daily2024, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----purchase-records2024-plot-monthly----------------------------------------
plot_time_series_month(purchase_records_series_monthly2024, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel")


## ----purchase-records2025-----------------------------------------------------
purchase_records_series_daily2025 <- purchase_records_series_daily[grepl("^2025", purchase_records_series_daily$day), ]
purchase_records_series_monthly2025 <- purchase_records_series_monthly[grepl("^2025", purchase_records_series_monthly$month), ]


## ----purchase-records2025-plot, eval=F----------------------------------------
# plot_time_series_day(purchase_records_series_daily2025, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel", date_labels = "%Y-%m", date_breaks = "1 month")


## ----purchase-records2025-plot-monthly----------------------------------------
plot_time_series_month(purchase_records_series_monthly2025, xlab = "Erwerbungsdatum", ylab = "Anzahl Titel")


## ----purchase-records-sample--------------------------------------------------
purchase_records_sample_df <- parse_purchase(purchase_records_sample)
purchase_records_sample_df <- purchase_records_sample_df[with(purchase_records_sample_df, order(date, id)), ]
purchase_records_sample_df <- purchase_records_sample_df[!is.na(purchase_records_sample_df$title), ]


## ----purchase-records-sample-print, results="asis"----------------------------
for (i in seq_len(nrow(purchase_records_sample_df))) {
  doc <- purchase_records_sample_df[i, ]
  cat(print_record(doc, date_label = "Erwerbungsdatum"), sep = "")
  cat("\n", sep = "")
}

