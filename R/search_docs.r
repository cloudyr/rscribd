docs_search <- 
function(query,
         category = NULL,
         language = NULL, # ISO 639-1 format
         simple = TRUE,
         num_start = 0,
         num_results = 10,
         ...
){
    a <- list()
    if(!is.null(category))
        a$category_id <- category
    if(!is.null(language))
        a$language <- language 
    a$simple <- as.integer(simple)
    stopifnot(num_start <= 1000)
    a$num_start <- num_start
    stopifnot(num_results <= 1000)
    a$num_results <- num_results
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
function(scope = "new",
         limit = NULL,
         offset = NULL,
         ...
){
    a <- list()
    stopifnot(scope %in% c("new","hot"))
    a$scope <- scope
    if(!is.null(limit))
        a$limit <- limit
    if(!is.null(offset))
        a$offset <- offset
    scribd_query(method = "docs.featured", 
                 args = a,
                 ...)
}

docs_browser <- 
function(sort = "popular",
         limit = NULL,
         offset = NULL,
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
