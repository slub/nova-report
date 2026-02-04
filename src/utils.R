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

eval_month_values <- function(field) {
  field <- gsub("-[0123][[:digit:]]T.*Z", "", field)
  field_df <- eval_values(field)
  field_df[order(field_df$value), ]
  names(field_df) <- c("month", "count")
  field_df
}

get_sid_via_id <- function(field) {
  gsub("ai-|finc-", "", gsub("(?<!finc)(?<!ai)-.*", "", field, perl = TRUE))
}

get_sid_unique_via_id <- function(field) {
  sids <- unique(gsub("(?<!finc)(?<!ai)-.*", "", field, perl = TRUE))
  sids <- unique(gsub("ai-|finc-", "", sids))
  sids[order(as.integer(sids))]
}

get_ignored_acquisition_types <- function() {
  c(
    "A",   # Bestellung abgelegt
    "DP",  # Depositum
    "FL",  # Fernleihe
    "R",   # Retrokatalogisierung
    "RV",  # Restitutionsverfahren
    "X",   # Altdaten
    "Y"    # EFRE-Retro
  )
}

pat_ignored_acquisition_types <- function() {
  acquisition_types <- get_ignored_acquisition_types()
  paste0("^", acquisition_types, "$", collapse = "|")
}

slubkat_get_id_url <- function(id) {
  paste0(
    "https://katalog.slub-dresden.de/id/", id,
    "?tx_find_find%5Bformat%5D=data&tx_find_find%5Bdata-format%5D=app&type=1369315142"
  )
}

slubkat_doc_via_id <- function(id) {
  url <- slubkat_get_id_url(id)
  res <- tryCatch(
    {
      jsonlite::read_json(url, simplifyVector = TRUE)
    },
    error = function(cond) {
      cat(paste0("Got error while fetching ID ", id, "!\n"), sep = "")
      cat(paste0("Reason: ", cond, collapse = "\n"), sep = "")
      cat("\n", sep = "")
      data.frame()
    },
    warning = function(cond) {
      cat(paste0("Got warning while fetching ID ", id, "!\n"), sep = "")
      cat(paste0("Reason: ", cond, collapse = "\n"), sep = "")
      cat("\n", sep = "")
      data.frame()
    }
  )
  if ("id" %in% names(res)) {
    if (nchar(res$id) > 0) {
      res
    } else {
      cat(paste0("Record with ID ", id, " was not found!\n"), sep = "")
    }
  }
}
