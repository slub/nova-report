# VuFind Solr : first_indexed

indexed24_records <- read_zenodo_jsonl_gz_local("https://zenodo.org/records/16881662/files/slub-nova-2024-first-indexed.jsonl.gz?download=1")

indexed24_records_series_daily <- eval_datetime_values(indexed24_records$first_indexed)
readr::write_csv(indexed24_records_series_daily, "data-raw/indexed-records-2024-series-daily.csv")

indexed24_records_series_monthly <- eval_month_values(indexed24_records$first_indexed)
readr::write_csv(indexed24_records_series_monthly, "data-raw/indexed-records-2024-series-monthly.csv")

indexed24_records_sample <- indexed24_records[sample(nrow(indexed24_records), 10), ]
jsonlite::stream_out(indexed24_records_sample, file("data-raw/indexed-records-2024-sample.jsonl"), verbose = FALSE)

# Libero LMS : NewItemActDate

newitem24_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/16385159/files/slub-nova-2024-new-item-act-date.jsonl.gz?download=1")

newitem24_records_series_daily <- eval_date_values(newitem24_records$de14_new_item_act_date_mv)
readr::write_csv(newitem24_records_series_daily, "data-raw/newitem-records-2024-series-daily.csv")

newitem24_records_series_monthly <- eval_month_values(unlist(newitem24_records$de14_new_item_act_date_mv))
readr::write_csv(newitem24_records_series_monthly, "data-raw/newitem-records-2024-series-monthly.csv")

newitem24_records_sample <- newitem24_records[sample(nrow(newitem24_records), 10), ]
jsonlite::stream_out(newitem24_records_sample, file("data-raw/newitem-records-2024-sample.jsonl"), verbose = FALSE)

# Libero LMS : DatePurchased

purchase24_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/16385169/files/slub-nova-2024-purchase-date.jsonl.gz?download=1")

purchase24_acquisition_type <- read_zenodo_csv("https://zenodo.org/records/16385169/files/slub-nova-2024-acquisition-code.csv?download=1")
#readr::write_csv(purchase24_acquisition_type, "data-raw/purchase-acquisition-type-2024.csv")
purchase24_subject_category <- read_zenodo_csv("https://zenodo.org/records/16385169/files/slub-nova-2024-statistic-code.csv?download=1")
#readr::write_csv(purchase24_subject_category, "data-raw/purchase-subject-category-2024.csv")

purchase24_records_series_daily <- eval_date_values(purchase24_records$de14_purchase_date_mv)
readr::write_csv(purchase24_records_series_daily, "data-raw/purchase-records-2024-series-daily.csv")

purchase24_records_series_monthly <- eval_month_values(unlist(purchase24_records$de14_purchase_date_mv))
readr::write_csv(purchase24_records_series_monthly, "data-raw/purchase-records-2024-series-monthly.csv")

purchase24_records_sample <- purchase24_records[sample(nrow(purchase24_records), 10), ]
jsonlite::stream_out(purchase24_records_sample, file("data-raw/purchase-records-2024-sample.jsonl"), verbose = FALSE)
