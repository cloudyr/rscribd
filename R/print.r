print.scribd_doc <-
function(x, ...){
    cat("Document: ", x$doc_id, "\n")
    str(x, give.attr = FALSE)
    invisible(x)
}

print.scribd_collection <-
function(x, ...){
    cat("Collection: ", x$collection_id, "\n")
    str(x, give.attr = FALSE)
    invisible(x)
}
