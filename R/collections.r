coll_list <- 
function(access = NULL, ...){
    a <- list()
    if(!is.null(access)) {
        stopifnot(access %in% c("public","private"))
        a$scope <- access
    }
    out <- 
    scribd_query(method = "collections.getlist", 
                 args = a,
                 ...)
    lapply(out$resultset[names(out$resultset) == "result"], 
           `class<-`, "scribd_collection")
}

coll_create <- 
function(name,
         description,
         access = "public",
         ...
){
    a <- list()
    a$name <- name
    a$description <- description
    if(!is.null(access)) {
        stopifnot(access %in% c("public","private"))
        a$privacy_type <- access
    }
    out <- 
    scribd_query(method = "collections.create", 
                 args = a,
                 ...)
    class(out) <- "scribd_collection"
    out
}

coll_update <- 
function(id,
         name = NULL,
         description = NULL,
         access = NULL,
         ...
){
    a <- list()
    if(inherits(id, "scribd_collection"))
        id <- id$collection_id
    a$collection_id <- id
    if(!is.null(name))
        a$name <- name
    if(!is.null(description))
        a$description <- description
    if(!is.null(access)) {
        stopifnot(access %in% c("public","private"))
        a$privacy_type <- access
    }
    out <- 
    scribd_query(method = "collections.update", 
                 args = a,
                 ...)
    class(out) <- "scribd_collection"
    out
}

coll_delete <- 
function(id, ...){
    a <- list()
    if(inherits(id, "scribd_collection"))
        id <- id$collection_id
    a$collection_id <- id
    scribd_query(method = "collections.delete", 
                 args = a,
                 ...)
}

coll_docs <- 
function(id,
         limit = 20,
         offset = 0,
         ...
){
    a <- list()
    if(!is.null(limit)) {
        stopifnot(limit <= 1000)
        a$limit <- limit
    }
    if(!is.null(offset)) {
        stopifnot(offset <= 1000)
        a$offset <- offset
    }
    if(inherits(id, "scribd_collection"))
        id <- id$collection_id
    a$collection_id <- id
    out <- 
    scribd_query(method = "collections.listDocs", 
                 args = a,
                 ...)
    lapply(out$result_set[names(out$result_set) == "result"], 
           `class<-`, "scribd_doc")
}

coll_add <- 
function(id, 
         doc, 
         ...){
    a <- list()
    if(inherits(id, "scribd_collection"))
        id <- id$collection_id
    a$collection_id <- id
    if(inherits(doc, "scribd_doc"))
        doc <- doc$doc_id
    a$doc_id <- doc
    scribd_query(method = "collections.addDoc", 
                 args = a,
                 ...)
}

coll_remove <- 
function(id, 
         doc, 
         ...){
    a <- list()
    if(inherits(id, "scribd_collection"))
        id <- id$collection_id
    a$collection_id <- id
    if(inherits(doc, "scribd_doc"))
        doc <- doc$doc_id
    a$doc_id <- doc
    scribd_query(method = "collections.removeDoc", 
                 args = a,
                 ...)
}
