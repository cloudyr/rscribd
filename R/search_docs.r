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
    scribd_query(method = "docs.getList", 
                 args = a,
                 ...)
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
    if(!is.null(category))
        a$category_id <- category
    if(!is.null(language))
        a$language <- language 
    a$simple <- as.integer(simple)
    stopifnot(offset <= 1000)
    a$num_start <- offset
    stopifnot(limit <= 1000)
    a$num_results <- limit
    scribd_query(method = "docs.search", 
                 args = a,
                 ...)
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
    scribd_query(method = "docs.featured", 
                 args = a,
                 ...)
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
    scribd_query(method = "docs.browse", 
                 args = a,
                 ...)
}
