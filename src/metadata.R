# VuFind Solr : first_indexed

indexed_records_sample <- jsonlite::stream_in(file("data-raw/indexed-records-sample.jsonl"), verbose = FALSE)
indexed_records_sample_metadata <- lapply(indexed_records_sample$id, function(id) {
  response <- slubkat_doc_via_id(id)
  nova <- as.list(indexed_records_sample[grepl(paste0("^", id, "$"), indexed_records_sample$id), c("first_indexed")])
  if (is.list(response)) {
    response$nova <- nova
    response
  } else {
    list("id" = id, "nova" = nova)
  }
})

jsonlite::write_json(indexed_records_sample_metadata, "data-raw/indexed-records-sample-full.json", pretty = 2, auto_unbox = TRUE, null = "null", na = "null")
saveRDS(indexed_records_sample_metadata, "data/indexed-records-sample-full.RDS")

# Libero LMS : NewItemActDate

newitem_records_sample <- jsonlite::stream_in(file("data-raw/newitem-records-sample.jsonl"), verbose = FALSE)
newitem_records_sample_metadata <- lapply(newitem_records_sample$id, function(id) {
  response <- slubkat_doc_via_id(id)
  nova <- as.list(newitem_records_sample[grepl(paste0("^", id, "$"), newitem_records_sample$id), c("de14_new_item_act_date", "de14_new_item_act_date_mv")])
  names(nova) <- c("newitem_date", "newitem_dates")
  if (is.list(response)) {
    response$nova <- nova
    response
  } else {
    list("id" = id, "nova" = nova)
  }
})

jsonlite::write_json(newitem_records_sample_metadata, "data-raw/newitem-records-sample-full.json", pretty = 2, auto_unbox = TRUE, null = "null", na = "null")
saveRDS(newitem_records_sample_metadata, "data/newitem-records-sample-full.RDS")

# Libero LMS : DatePurchased

purchase_records_sample <- jsonlite::stream_in(file("data-raw/purchase-records-sample.jsonl"), verbose = FALSE)
purchase_records_sample_metadata <- lapply(purchase_records_sample$id, function(id) {
  response <- slubkat_doc_via_id(id)
  nova <- as.list(purchase_records_sample[grepl(paste0("^", id, "$"), purchase_records_sample$id), c("de14_purchase_date", "de14_purchase_date_mv")])
  names(nova) <- c("purchase_date", "purchase_dates")
  if (is.list(response)) {
    response$nova <- nova
    response
  } else {
    list("id" = id, "nova" = nova)
  }
})

jsonlite::write_json(purchase_records_sample_metadata, "data-raw/purchase-records-sample-full.json", pretty = 2, auto_unbox = TRUE, null = "null", na = "null")
saveRDS(purchase_records_sample_metadata, "data/purchase-records-sample-full.RDS")
