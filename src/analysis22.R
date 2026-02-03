# VuFind Solr : first_indexed

indexed22_records <- read_zenodo_jsonl_gz_local("https://zenodo.org/records/16858259/files/slub-nova-2022-first-indexed.jsonl.gz?download=1")

indexed22_records_series_daily <- eval_datetime_values(indexed22_records$first_indexed)
readr::write_csv(indexed22_records_series_daily, "data-raw/indexed-records-2022-series-daily.csv")

indexed22_records_series_monthly <- eval_month_values(indexed22_records$first_indexed)
readr::write_csv(indexed22_records_series_monthly, "data-raw/indexed-records-2022-series-monthly.csv")

indexed22_records_sample <- indexed22_records[sample(nrow(indexed22_records), 10), ]
jsonlite::stream_out(indexed22_records_sample, file("data-raw/indexed-records-2022-sample.jsonl"), verbose = FALSE)

# Libero LMS : NewItemActDate

newitem22_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10179459/files/slub-nova-2022-new-item-act-date.jsonl.gz?download=1")

newitem22_records_series_daily <- eval_date_values(newitem22_records$de14_new_item_act_date_mv)
readr::write_csv(newitem22_records_series_daily, "data-raw/newitem-records-2022-series-daily.csv")

newitem22_records_series_monthly <- eval_month_values(unlist(newitem22_records$de14_new_item_act_date_mv))
readr::write_csv(newitem22_records_series_monthly, "data-raw/newitem-records-2022-series-monthly.csv")

newitem22_records_sample <- newitem22_records[sample(nrow(newitem22_records), 10), ]
jsonlite::stream_out(newitem22_records_sample, file("data-raw/newitem-records-2022-sample.jsonl"), verbose = FALSE)

# Libero LMS : DatePurchased

purchase22_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10251277/files/slub-nova-2022-purchase-date.jsonl.gz?download=1")

purchase22_acquisition_type <- read_zenodo_csv("https://zenodo.org/records/10251277/files/slub-nova-2022-acquisition-code.csv?download=1")
#readr::write_csv(purchase22_acquisition_type, "data-raw/purchase-2022-acquisition-type.csv")

purchase22_records_series_daily <- eval_date_values(purchase22_records$de14_purchase_date_mv)
readr::write_csv(purchase22_records_series_daily, "data-raw/purchase-records-2022-series-daily.csv")

purchase22_records_series_monthly <- eval_month_values(unlist(purchase22_records$de14_purchase_date_mv))
readr::write_csv(purchase22_records_series_monthly, "data-raw/purchase-records-2022-series-monthly.csv")

purchase22_records_sample <- purchase22_records[sample(nrow(purchase22_records), 10), ]
jsonlite::stream_out(purchase22_records_sample, file("data-raw/purchase-records-2022-sample.jsonl"), verbose = FALSE)
