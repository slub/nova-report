# VuFind Solr : first_indexed

indexed23_records <- read_zenodo_jsonl_gz_local("https://zenodo.org/records/16881739/files/slub-nova-2023-first-indexed.jsonl.gz?download=1")

indexed23_records_series_daily <- eval_datetime_values(indexed23_records$first_indexed)
readr::write_csv(indexed23_records_series_daily, "data-raw/indexed-records-2023-series-daily.csv")

indexed23_records_series_monthly <- eval_month_values(indexed23_records$first_indexed)
readr::write_csv(indexed23_records_series_monthly, "data-raw/indexed-records-2023-series-monthly.csv")

indexed23_records_sample <- indexed23_records[sample(nrow(indexed23_records), 10), ]
jsonlite::stream_out(indexed23_records_sample, file("data-raw/indexed-records-2023-sample.jsonl"), verbose = FALSE)

# Libero LMS : NewItemActDate

newitem23_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10888494/files/slub-nova-2023-new-item-act-date.jsonl.gz?download=1")

newitem23_records_series_daily <- eval_date_values(newitem23_records$de14_new_item_act_date_mv)
readr::write_csv(newitem23_records_series_daily, "data-raw/newitem-records-2023-series-daily.csv")

newitem23_records_series_monthly <- eval_month_values(unlist(newitem23_records$de14_new_item_act_date_mv))
readr::write_csv(newitem23_records_series_monthly, "data-raw/newitem-records-2023-series-monthly.csv")

newitem23_records_sample <- newitem23_records[sample(nrow(newitem23_records), 10), ]
jsonlite::stream_out(newitem23_records_sample, file("data-raw/newitem-records-2023-sample.jsonl"), verbose = FALSE)

# Libero LMS : DatePurchased

purchase23_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10888524/files/slub-nova-2023-purchase-date.jsonl.gz?download=1")

purchase23_acquisition_type <- read_zenodo_csv("https://zenodo.org/records/10888524/files/slub-nova-2023-acquisition-code.csv?download=1")
#readr::write_csv(purchase23_acquisition_type, "data-raw/purchase-acquisition-type-2023.csv")
purchase23_subject_category <- read_zenodo_csv("https://zenodo.org/records/10888524/files/slub-nova-2023-statistic-code.csv?download=1")
#readr::write_csv(purchase23_subject_category, "data-raw/purchase-subject-category-2023.csv")

purchase23_records_series_daily <- eval_date_values(purchase23_records$de14_purchase_date_mv)
readr::write_csv(purchase23_records_series_daily, "data-raw/purchase-records-2023-series-daily.csv")

purchase23_records_series_monthly <- eval_month_values(unlist(purchase23_records$de14_purchase_date_mv))
readr::write_csv(purchase23_records_series_monthly, "data-raw/purchase-records-2023-series-monthly.csv")

purchase23_records_sample <- purchase23_records[sample(nrow(purchase23_records), 10), ]
jsonlite::stream_out(purchase23_records_sample, file("data-raw/purchase-records-2023-sample.jsonl"), verbose = FALSE)
