docs_list <-
function(limit = 20,
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
    out <- 
    scribd_query(method = "docs.getList", 
                 args = a,
                 ...)
    r <- as.list(out$resultset[".attrs"])
    out <- 
    lapply(out$resultset[names(out$resultset) == "result"], 
           `class<-`, "scribd_doc")
    attr(out, "results") <- r
    out
}

docs_search <- 
function(query,
         category = NULL,
         language = NULL,
         simple = TRUE,
         limit = 10,
         offset = 0,
         ...
){
    a <- list()
    a$query <- query
    if(!is.null(category))
        a$category_id <- category
    if(!is.null(language))
        a$language <- language 
    a$simple <- as.integer(simple)
    stopifnot(offset <= 1000)
    a$num_start <- offset
    stopifnot(limit <= 1000)
    a$num_results <- limit
    out <- 
    scribd_query(method = "docs.search", 
                 args = a,
                 ...)
    r <- as.list(out$resultset[".attrs"])
    out <- 
    lapply(out$resultset[names(out$resultset) == "result"], 
           `class<-`, "scribd_doc")
    attr(out, "results") <- r
    out
}

docs_categories <- 
function(category = NULL,
         subs = FALSE,
         ...
){
    a <- list()
    if(!is.null(category)) {
        a$category_id <- category
        if(!is.null(subs))
            a$with_subcategories <- as.integer(subs)
    }
    scribd_query(method = "docs.getCategories", 
                 args = a,
                 ...)
}

docs_featured <- 
function(scope = "hot",
         limit = 20,
         offset = 0,
         ...
){
    a <- list()
    stopifnot(scope %in% c("new","hot"))
    a$scope <- scope
    stopifnot(offset <= 1000)
    a$offset <- offset
    stopifnot(limit <= 1000)
    a$limit <- limit
    out <- 
    scribd_query(method = "docs.featured", 
                 args = a,
                 ...)
    r <- as.list(out$result_set[".attrs"])
    out <- 
    lapply(out$result_set[names(out$result_set) == "result"], 
           `class<-`, "scribd_doc")
    attr(out, "results") <- r
    out
}

docs_browse <- 
function(sort = "popular",
         limit = 20,
         offset = 0,
         ...
){
    a <- list()
    stopifnot(sort %in% c("popular", "views", "newest"))
    a$sort <- sort
    if(!is.null(limit))
        a$limit <- limit
    if(!is.null(offset))
        a$offset <- offset
    out <- 
    scribd_query(method = "docs.browse", 
                 args = a,
                 ...)
    r <- as.list(out$result_set[".attrs"])
    out <- 
    lapply(out$result_set[names(out$result_set) == "result"], 
           `class<-`, "scribd_doc")
    attr(out, "results") <- r
    out
}
