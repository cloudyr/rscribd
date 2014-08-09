doc <- 
function(doc, 
         fmt = "original",
         url_only = TRUE,
         ...
){
    a <- list()
    a$doc_id <- doc
    stopifnot(fmt %in% c("pdf","txt","original"))
    a$doc_type <- fmt
    out <- 
    scribd_query(method = "docs.getDownloadUrl", 
                 args = a,
                 ...)
    if(!url_only) {
        if(!is.null(out$download_link[[1]])) {
            f <- GET(out$download_link[[1]])
            if(fmt == "txt")
                return(content(f, as="text"))
            else
                return(content(f, as="raw"))
        } else {
            stop("Download link is NULL")
        }
    } else
        return(out)
}

doc_thumbnail <-
function(doc,
         width = NULL,
         height = NULL,
         url_only = TRUE,
         ...){
    a <- list()
    a$doc_id <- doc
    if(!is.null(width))
        a$width <- width
    if(!is.null(height))
        a$heigh <- height
    out <- 
    scribd_query(method = "thumbnail.get", 
                 args = a,
                 ...)
    if(!url_only) {
        if(!is.null(out$thumbnail_url[[1]])) {
            f <- GET(out$thumbnail_url[[1]])
            return(content(f, as = "raw"))
        } else {
            stop("Download link is NULL")
        }
    } else
        return(out)
}

doc_stats <- 
function(doc, ...){
    a <- list()
    a$doc_id <- doc
    scribd_query(method = "docs.getStats", 
                 args = a,
                 ...)
}

doc_settings <-
function(doc, ...){
    a <- list()
    a$doc_id <- doc
    scribd_query(method = "docs.getSettings", 
                 args = a,
                 ...)
}

doc_change <- 
function(doc,
         isbn = NULL,
         title = NULL,
         description = NULL,
         access = NULL,
         license = NULL,
         category = NULL,
         tags = NULL,
         fmt = NULL,
         author = NULL,
         publisher = NULL,
         pub_date = NULL,
         edition = NULL,
         disable_select_text = NULL,
         disable_related = NULL,
         ...
){
    a <- list()
    a$doc_ids <- paste(doc, collapse=",")
    if(!is.null(isbn))
        a$isbn <- isbn
    if(!is.null(title))
        a$title <- title
    if(!is.null(description))
        a$description <- description
    if(!is.null(access)) {
        stopifnot(access %in% c("public", "private"))
        a$access <- access
    }
    if(!is.null(license)) {
        stopifnot(license %in% c("by", "by-nc", "by-nc-nd", 
                                 "by-nc-sa", "by-nd", "by-sa", 
                                 "c", "pd"))
        a$license <- license
    }
    if(!is.null(category))
        a$category_id <- category
    if(!is.null(tags))
        a$tags <- paste(tags, collapse=",")
    if(!is.null(fmt)) {
        stopifnot(any(!fmt %in% c("pdf", "text", "original")))
        a$download_formats <- paste(fmt, collapse=",")
    }
    if(!is.null(author))
        a$author <- author
    if(!is.null(publisher))
        a$publisher <- publisher
    if(!is.null(pub_date))
        a$when_published <- pub_date
    if(!is.null(edition))
        a$edition <- edition
    if(!is.null(disable_select_text))
        a$disable_select_text <- as.integer(disable_select_text)
    if(!is.null(disable_related))
        a$disable_related_docs <- as.integer(disable_related)
    
    scribd_query(method = "docs.changeSettings", 
                 args = a,
                 ...)

}

doc_delete <- 
function(doc, ...){
    a <- list()
    a$doc_id <- doc
    scribd_query(method = "docs.delete", 
                 args = a,
                 ...)

}
