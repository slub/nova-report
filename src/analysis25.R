# VuFind Solr : first_indexed

indexed25_records <- read_zenodo_jsonl_gz_local("https://zenodo.org/records/18443593/files/slub-nova-2025-first-indexed.jsonl.gz?download=1")

indexed25_records_series_daily <- eval_datetime_values(indexed25_records$first_indexed)
readr::write_csv(indexed25_records_series_daily, "data-raw/indexed-records-2025-series-daily.csv")

indexed25_records_series_monthly <- eval_month_values(indexed25_records$first_indexed)
readr::write_csv(indexed25_records_series_monthly, "data-raw/indexed-records-2025-series-monthly.csv")

indexed25_records_sample <- indexed25_records[sample(nrow(indexed25_records), 10), ]
jsonlite::stream_out(indexed25_records_sample, file("data-raw/indexed-records-2025-sample.jsonl"), verbose = FALSE)

# Libero LMS : NewItemActDate

newitem25_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/18461714/files/slub-nova-2025-new-item-act-date.jsonl.gz?download=1")

newitem25_records_series_daily <- eval_date_values(newitem25_records$de14_new_item_act_date_mv)
readr::write_csv(newitem25_records_series_daily, "data-raw/newitem-records-2025-series-daily.csv")

newitem25_records_series_monthly <- eval_month_values(unlist(newitem25_records$de14_new_item_act_date_mv))
readr::write_csv(newitem25_records_series_monthly, "data-raw/newitem-records-2025-series-monthly.csv")

newitem25_records_sample <- newitem25_records[sample(nrow(newitem25_records), 10), ]
jsonlite::stream_out(newitem25_records_sample, file("data-raw/newitem-records-2025-sample.jsonl"), verbose = FALSE)

# Libero LMS : DatePurchased

purchase25_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/18462141/files/slub-nova-2025-purchase-date.jsonl.gz?download=1")

purchase25_acquisition_type <- read_zenodo_csv("https://zenodo.org/records/18462141/files/slub-nova-2025-acquisition-code.csv?download=1")
#readr::write_csv(purchase25_acquisition_type, "data-raw/purchase-acquisition-type-2025.csv")
purchase25_subject_category <- read_zenodo_csv("https://zenodo.org/records/18462141/files/slub-nova-2025-statistic-code.csv?download=1")
#readr::write_csv(purchase24_subject_category, "data-raw/purchase-subject-category-2025.csv")

purchase25_records_series_daily <- eval_date_values(purchase25_records$de14_purchase_date_mv)
readr::write_csv(purchase25_records_series_daily, "data-raw/purchase-records-2025-series-daily.csv")

purchase25_records_series_monthly <- eval_month_values(unlist(purchase25_records$de14_purchase_date_mv))
readr::write_csv(purchase25_records_series_monthly, "data-raw/purchase-records-2025-series-monthly.csv")

purchase25_records_sample <- purchase25_records[sample(nrow(purchase25_records), 10), ]
jsonlite::stream_out(purchase25_records_sample, file("data-raw/purchase-records-2025-sample.jsonl"), verbose = FALSE)
