print.scribd_doc <-
function(x, ...){
    if("doc_id" %in% names(x))
        cat("Document: ", x$doc_id, "\n")
    str(x, give.attr = FALSE)
    invisible(x)
}

print.scribd_collection <-
function(x, ...){
    if("collection_id" %in% names(x))
        cat("Collection: ", x$collection_id, "\n")
    str(x, give.attr = FALSE)
    invisible(x)
}
