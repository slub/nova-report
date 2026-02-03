# VuFind Solr : first_indexed

indexed22_records_series_daily <- readr::read_csv("data-raw/indexed-records-2022-series-daily.csv", col_types=c("ci"))
indexed23_records_series_daily <- readr::read_csv("data-raw/indexed-records-2023-series-daily.csv", col_types=c("ci"))
indexed24_records_series_daily <- readr::read_csv("data-raw/indexed-records-2024-series-daily.csv", col_types=c("ci"))
indexed25_records_series_daily <- readr::read_csv("data-raw/indexed-records-2025-series-daily.csv", col_types=c("ci"))
indexed_records_series_daily <- rbind(
  indexed22_records_series_daily,
  indexed23_records_series_daily,
  indexed24_records_series_daily,
  indexed25_records_series_daily
)
readr::write_csv(indexed_records_series_daily, "data-raw/indexed-records-series-daily.csv")
saveRDS(indexed_records_series_daily, "data/indexed-records-series-daily.RDS")

indexed22_records_series_monthly <- readr::read_csv("data-raw/indexed-records-2022-series-monthly.csv", col_types=c("ci"))
indexed23_records_series_monthly <- readr::read_csv("data-raw/indexed-records-2023-series-monthly.csv", col_types=c("ci"))
indexed24_records_series_monthly <- readr::read_csv("data-raw/indexed-records-2024-series-monthly.csv", col_types=c("ci"))
indexed25_records_series_monthly <- readr::read_csv("data-raw/indexed-records-2025-series-monthly.csv", col_types=c("ci"))
indexed_records_series_monthly <- rbind(
  indexed22_records_series_monthly,
  indexed23_records_series_monthly,
  indexed24_records_series_monthly,
  indexed25_records_series_monthly
)
readr::write_csv(indexed_records_series_monthly, "data-raw/indexed-records-series-monthly.csv")
saveRDS(indexed_records_series_monthly, "data/indexed-records-series-monthly.RDS")

indexed22_records_sample <- jsonlite::stream_in(file("data-raw/indexed-records-2022-sample.jsonl"), verbose = FALSE)
indexed23_records_sample <- jsonlite::stream_in(file("data-raw/indexed-records-2023-sample.jsonl"), verbose = FALSE)
indexed24_records_sample <- jsonlite::stream_in(file("data-raw/indexed-records-2024-sample.jsonl"), verbose = FALSE)
indexed25_records_sample <- jsonlite::stream_in(file("data-raw/indexed-records-2025-sample.jsonl"), verbose = FALSE)

indexed_records_sample_all <- rbind(indexed22_records_sample, indexed23_records_sample, indexed24_records_sample) #, indexed25_records_sample
indexed_records_sample <- indexed_records_sample_all[sample(nrow(indexed_records_sample_all), 10), ]
indexed_records_sample <- indexed_records_sample[with(indexed_records_sample, order(first_indexed, id)), ]
jsonlite::stream_out(indexed_records_sample, file("data-raw/indexed-records-sample.jsonl"), verbose = FALSE)
saveRDS(indexed_records_sample, "data/indexed-records-sample.RDS")

# Libero LMS : NewItemActDate

newitem22_records_series_daily <- readr::read_csv("data-raw/newitem-records-2022-series-daily.csv", col_types=c("ci"))
newitem23_records_series_daily <- readr::read_csv("data-raw/newitem-records-2023-series-daily.csv", col_types=c("ci"))
newitem24_records_series_daily <- readr::read_csv("data-raw/newitem-records-2024-series-daily.csv", col_types=c("ci"))
newitem25_records_series_daily <- readr::read_csv("data-raw/newitem-records-2025-series-daily.csv", col_types=c("ci"))
newitem_records_series_daily <- rbind(
  newitem22_records_series_daily,
  newitem23_records_series_daily,
  newitem24_records_series_daily,
  newitem25_records_series_daily
)
readr::write_csv(newitem_records_series_daily, "data-raw/newitem-records-series-daily.csv")
saveRDS(newitem_records_series_daily, "data/newitem-records-series-daily.RDS")

newitem22_records_series_monthly <- readr::read_csv("data-raw/newitem-records-2022-series-monthly.csv", col_types=c("ci"))
newitem23_records_series_monthly <- readr::read_csv("data-raw/newitem-records-2023-series-monthly.csv", col_types=c("ci"))
newitem24_records_series_monthly <- readr::read_csv("data-raw/newitem-records-2024-series-monthly.csv", col_types=c("ci"))
newitem25_records_series_monthly <- readr::read_csv("data-raw/newitem-records-2025-series-monthly.csv", col_types=c("ci"))
newitem_records_series_monthly <- rbind(
  newitem22_records_series_monthly,
  newitem23_records_series_monthly,
  newitem24_records_series_monthly,
  newitem25_records_series_monthly
)
readr::write_csv(newitem_records_series_monthly, "data-raw/newitem-records-series-monthly.csv")
saveRDS(newitem_records_series_monthly, "data/newitem-records-series-monthly.RDS")

newitem22_records_sample <- jsonlite::stream_in(file("data-raw/newitem-records-2022-sample.jsonl"), verbose = FALSE)
newitem23_records_sample <- jsonlite::stream_in(file("data-raw/newitem-records-2023-sample.jsonl"), verbose = FALSE)
newitem24_records_sample <- jsonlite::stream_in(file("data-raw/newitem-records-2024-sample.jsonl"), verbose = FALSE)
newitem25_records_sample <- jsonlite::stream_in(file("data-raw/newitem-records-2025-sample.jsonl"), verbose = FALSE)

newitem_records_sample_all <- rbind(newitem22_records_sample, newitem23_records_sample[, -2], newitem24_records_sample[, -2], newitem25_records_sample[, -2])
newitem_records_sample <- newitem_records_sample_all[sample(nrow(newitem_records_sample_all), 10), ]
newitem_records_sample <- newitem_records_sample[with(newitem_records_sample, order(de14_new_item_act_date, id)), ]
jsonlite::stream_out(newitem_records_sample, file("data-raw/newitem-records-sample.jsonl"), verbose = FALSE)
saveRDS(newitem_records_sample, "data/newitem-records-sample.RDS")

# Libero LMS : DatePurchased

purchase22_records_series_daily <- readr::read_csv("data-raw/purchase-records-2022-series-daily.csv", col_types=c("ci"))
purchase23_records_series_daily <- readr::read_csv("data-raw/purchase-records-2023-series-daily.csv", col_types=c("ci"))
purchase24_records_series_daily <- readr::read_csv("data-raw/purchase-records-2024-series-daily.csv", col_types=c("ci"))
purchase25_records_series_daily <- readr::read_csv("data-raw/purchase-records-2025-series-daily.csv", col_types=c("ci"))
purchase_records_series_daily <- rbind(
  purchase22_records_series_daily,
  purchase23_records_series_daily,
  purchase24_records_series_daily,
  purchase25_records_series_daily
)
readr::write_csv(purchase_records_series_daily, "data-raw/purchase-records-series-daily.csv")
saveRDS(purchase_records_series_daily, "data/purchase-records-series-daily.RDS")

purchase22_records_series_monthly <- readr::read_csv("data-raw/purchase-records-2022-series-monthly.csv", col_types=c("ci"))
purchase23_records_series_monthly <- readr::read_csv("data-raw/purchase-records-2023-series-monthly.csv", col_types=c("ci"))
purchase24_records_series_monthly <- readr::read_csv("data-raw/purchase-records-2024-series-monthly.csv", col_types=c("ci"))
purchase25_records_series_monthly <- readr::read_csv("data-raw/purchase-records-2025-series-monthly.csv", col_types=c("ci"))
purchase_records_series_monthly <- rbind(
  purchase22_records_series_monthly,
  purchase23_records_series_monthly,
  purchase24_records_series_monthly,
  purchase25_records_series_monthly
)
readr::write_csv(purchase_records_series_monthly, "data-raw/purchase-records-series-monthly.csv")
saveRDS(purchase_records_series_monthly, "data/purchase-records-series-monthly.RDS")

purchase22_records_sample <- jsonlite::stream_in(file("data-raw/purchase-records-2022-sample.jsonl"), verbose = FALSE)
purchase23_records_sample <- jsonlite::stream_in(file("data-raw/purchase-records-2023-sample.jsonl"), verbose = FALSE)
purchase24_records_sample <- jsonlite::stream_in(file("data-raw/purchase-records-2024-sample.jsonl"), verbose = FALSE)
purchase25_records_sample <- jsonlite::stream_in(file("data-raw/purchase-records-2025-sample.jsonl"), verbose = FALSE)

purchase_records_sample_all <- rbind(purchase22_records_sample, purchase23_records_sample[, -c(2, 3, 4, 8)], purchase24_records_sample[, -c(2, 3, 4, 8)], purchase25_records_sample[, -c(2, 3, 4, 8)])
purchase_records_sample <- purchase_records_sample_all[sample(nrow(purchase_records_sample_all), 10), ]
purchase_records_sample <- purchase_records_sample[with(purchase_records_sample, order(de14_purchase_date, id)), ]
jsonlite::stream_out(purchase_records_sample, file("data-raw/purchase-records-sample.jsonl"), verbose = FALSE)
saveRDS(purchase_records_sample, "data/purchase-records-sample.RDS")
