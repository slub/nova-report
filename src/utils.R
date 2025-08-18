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

eval_values <- function(field) {
  field_stats <- table(unlist(field))
  data.frame(value = names(field_stats), count = as.integer(field_stats))
}

eval_date_values <- function(field) {
  field_df <- eval_values(field)
  field_df$value <- gsub("T00:00:00Z", "", field_df$value)
  field_df[order(field_df$value), ]
  names(field_df) <- c("day", "count")
  field_df$day <- as.Date(field_df$day)
  field_df
}

eval_datetime_values <- function(field) {
  field <- gsub("T.*Z", "", field)
  field_df <- eval_values(field)
  field_df[order(field_df$value), ]
  names(field_df) <- c("day", "count")
  field_df$day <- as.Date(field_df$day)
  field_df
}
