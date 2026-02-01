# VuFind Solr : first_indexed

indexed24_records <- read_zenodo_jsonl_gz_local("https://zenodo.org/records/16881662/files/slub-nova-2024-first-indexed.jsonl.gz?download=1")
indexed23_records <- read_zenodo_jsonl_gz_local("https://zenodo.org/records/16881739/files/slub-nova-2023-first-indexed.jsonl.gz?download=1")
indexed22_records <- read_zenodo_jsonl_gz_local("https://zenodo.org/records/16858259/files/slub-nova-2022-first-indexed.jsonl.gz?download=1")

indexed_records <- rbind(indexed22_records, indexed23_records, indexed24_records)
indexed_records <- indexed_records[with(indexed_records, order(first_indexed, id)), ]

indexed_records_series <- eval_datetime_values(indexed_records$first_indexed)
readr::write_csv(indexed_records_series, "data-raw/indexed-records-series.csv")
saveRDS(indexed_records_series, "data/indexed-records-series.RDS")

indexed_records_series_monthly <- eval_month_values(indexed_records$first_indexed)
readr::write_csv(indexed_records_series_monthly, "data-raw/indexed-records-series-monthly.csv")
saveRDS(indexed_records_series_monthly, "data/indexed-records-series-monthly.RDS")

indexed_records_sample <- indexed_records[sample(nrow(indexed_records), 10), ]
jsonlite::stream_out(indexed_records_sample, file("data-raw/indexed-records-sample.jsonl"))
saveRDS(indexed_records_sample, "data/indexed-records-sample.RDS")

# Libero LMS : NewItemActDate

newitem24_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/16385159/files/slub-nova-2024-new-item-act-date.jsonl.gz?download=1")
newitem23_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10888494/files/slub-nova-2023-new-item-act-date.jsonl.gz?download=1")
newitem22_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10179459/files/slub-nova-2022-new-item-act-date.jsonl.gz?download=1")

newitem_records <- rbind(newitem23_records, newitem24_records)
newitem_records_legacy <- rbind(newitem22_records, newitem23_records[, -2], newitem24_records[, -2])  # drop field rsn_id_str_mv

newitem_records_series <- eval_date_values(newitem_records_legacy$de14_new_item_act_date_mv)
readr::write_csv(newitem_records_series, "data-raw/newitem-records-series.csv")
saveRDS(newitem_records_series, "data/newitem-records-series.RDS")

newitem_records_series_monthly <- eval_month_values(unlist(newitem_records_legacy$de14_new_item_act_date_mv))
readr::write_csv(newitem_records_series_monthly, "data-raw/newitem-records-series-monthly.csv")
saveRDS(newitem_records_series_monthly, "data/newitem-records-series-monthly.RDS")

newitem_records_sample <- newitem_records_legacy[sample(nrow(newitem_records_legacy), 10), ]
jsonlite::stream_out(newitem_records_sample, file("data-raw/newitem-records-sample.jsonl"))
saveRDS(newitem_records_sample, "data/newitem-records-sample.RDS")

# Libero LMS : DatePurchased

purchase24_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/16385169/files/slub-nova-2024-purchase-date.jsonl.gz?download=1")
purchase23_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10888524/files/slub-nova-2023-purchase-date.jsonl.gz?download=1")
purchase22_records <- read_zenodo_jsonl_gz("https://zenodo.org/records/10251277/files/slub-nova-2022-purchase-date.jsonl.gz?download=1")

purchase24_acquisition_type <- read_zenodo_csv("https://zenodo.org/records/16385169/files/slub-nova-2024-acquisition-code.csv?download=1")
purchase23_acquisition_type <- read_zenodo_csv("https://zenodo.org/records/10888524/files/slub-nova-2023-acquisition-code.csv?download=1")
purchase22_acquisition_type <- read_zenodo_csv("https://zenodo.org/records/10251277/files/slub-nova-2022-acquisition-code.csv?download=1")

purchase24_subject_category <- read_zenodo_csv("https://zenodo.org/records/16385169/files/slub-nova-2024-statistic-code.csv?download=1")
purchase23_subject_category <- read_zenodo_csv("https://zenodo.org/records/10888524/files/slub-nova-2023-statistic-code.csv?download=1")

purchase_records <- rbind(purchase23_records, purchase24_records)
purchase_records_legacy <- rbind(purchase22_records, purchase23_records[, -c(2, 3, 4, 8)], purchase24_records[, -c(2, 3, 4, 8)])

purchase_acquisition_type <- unique(rbind(purchase22_acquisition_type, purchase23_acquisition_type, purchase24_acquisition_type))
purchase_acquisition_type <- purchase_acquisition_type[with(purchase_acquisition_type, order(Code, Beschreibung)), ]
#readr::write_csv(purchase_acquisition_type, "data-raw/purchase-acquisition-type.csv")
#saveRDS(purchase_acquisition_type, "data/purchase-acquisition-type.RDS")

purchase_subject_category <- unique(rbind(purchase24_subject_category, purchase23_subject_category))
purchase_subject_category <- purchase_subject_category[with(purchase_subject_category, order(Code, Beschreibung)), ]
#readr::write_csv(purchase_subject_category, "data-raw/purchase-subject-category.csv")
#saveRDS(purchase_subject_category, "data/purchase-subject-category.RDS")

purchase_records_series <- eval_date_values(purchase_records_legacy$de14_purchase_date_mv)
readr::write_csv(purchase_records_series, "data-raw/purchase-records-series.csv")
saveRDS(purchase_records_series, "data/purchase-records-series.RDS")

purchase_records_series_monthly <- eval_month_values(unlist(purchase_records_legacy$de14_purchase_date_mv))
readr::write_csv(purchase_records_series_monthly, "data-raw/purchase-records-series-monthly.csv")
saveRDS(purchase_records_series_monthly, "data/purchase-records-series-monthly.RDS")

purchase_records_sample <- purchase_records_legacy[sample(nrow(purchase_records_legacy), 10), ]
jsonlite::stream_out(purchase_records_sample, file("data-raw/purchase-records-sample.jsonl"))
saveRDS(purchase_records_sample, "data/purchase-records-sample.RDS")
