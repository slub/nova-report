## ----setup, include=F---------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, error = FALSE, message = FALSE, warning = FALSE)
knitr::opts_knit$set(root.dir = "..")


## ----utils-input--------------------------------------------------------------
read_zenodo_jsonl_gz <- function(in_path) {
  jsonlite::stream_in(
    gzcon(url(in_path)),
    verbose = FALSE
  )
}

read_zenodo_jsonl_gz_local <- function(in_path) {
  jsonl_gz_file <- tempfile(fileext = ".jsonl.gz")
  curl::curl_download(
    in_path,
    jsonl_gz_file
  )
  record_data <- jsonlite::stream_in(
    file(jsonl_gz_file),
    verbose = FALSE
  )
  unlink(jsonl_gz_file)
  record_data
}

read_zenodo_csv <- function(in_path) {
  readr::read_csv(
    in_path,
    show_col_types = FALSE
  )
}

read_json_simple <- function(in_path) {
  jsonlite::read_json(
    in_path
  )
}


## ----utils-analysis-----------------------------------------------------------
eval_values <- function(field) {
  field_stats <- table(unlist(field))
  data.frame(value=names(field_stats), count=as.integer(field_stats))
}

eval_date_values <- function(field) {
  field_df <- eval_values(field)
  field_df$value <- gsub("T00:00:00Z", "", field_df$value)
  field_df[order(field_df$value), ]
  names(field_df) <- c("day", "count")
  field_df$day <- as.Date(field_df$day)
  field_df
}


## ----newitem-records----------------------------------------------------------
newitem24_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/16385159/files/slub-nova-2024-new-item-act-date.jsonl.gz?download=1")
newitem23_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10888494/files/slub-nova-2023-new-item-act-date.jsonl.gz?download=1")
newitem22_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10179459/files/slub-nova-2022-new-item-act-date.jsonl.gz?download=1")

newitem_records <- rbind(newitem23_records, newitem24_records)
newitem_records_legacy <- rbind(newitem22_records, newitem23_records[, -2], newitem24_records[, -2])


## ----plot-newitem-records-----------------------------------------------------
newitem_records_series <- eval_date_values(newitem_records_legacy$de14_new_item_act_date_mv)
ggplot2::ggplot(newitem_records_series, ggplot2::aes(x=day, y=count)) + ggplot2::geom_col() + ggplot2::xlab("") + ggplot2::ylab("Anzahl Neuerwerbungen") + ggplot2::theme(axis.text.x=ggplot2::element_text(angle=60, hjust=1))

