.filetypes <- c("pdf", "txt", "ps", "rtf", "epub", "key", "odt", 
                "odp", "ods", "odg", "odf", "sxw", "sxc", "sxi", 
                "sxd", "doc", "ppt", "pps", "xls", "docx", "pptx", 
                "ppsx", "xlsx")

doc_upload <-
function(file = NULL,
         url = NULL,
         doc = NULL,
         ext = NULL,
         access = "public",
         paid_content = FALSE,
         drm = NULL,
         wait = FALSE,
         ...
){
    a <- list()
    if(!is.null(access)) {
        stopifnot(access %in% c("public","private"))
        a$access <- access
    }
    if(!is.null(doc)){
        a$rev_id <- doc
    }
    a$paid_content <- as.integer(paid_content)
    if(paid_content){
        if(!is.null(drm)){
            stopifnot(drm %in% c("download-pdf","download-pdf-orig","view-only"))
            a$download_and_drm <- drm
        }
    }
    
    if(!is.null(file)){
        if(!is.null(ext)) {
            stopifnot(ext %in% .filetypes)
            a$doc_type <- ext
        } else {
            stopifnot(file_ext(file) %in% .filetypes)
            a$doc_type <- file_ext(file)
        }
        out <-
        scribd_query(method = "docs.upload", 
                     args = a,
                     verb = "POST",
                     body = list(file = upload_file(file)),
                     ...)
    } else if(!is.null(url)){
        if(!is.null(ext)) {
            stopifnot(ext %in% .filetypes)
            a$doc_type <- ext
        }
        a$url <- URLencode(URLencode(url), reserved = TRUE)
        out <-
        scribd_query(method = "docs.uploadFromUrl", 
                     args = a, ...)
    } else {
        stop("Must specify `file` or `url`")
    }
    if(wait){
        s <- "PROCESSSING"
        while(s == "PROCESSING") {
            s <- conversion_status(out$doc_id)
            Sys.sleep(1)
        }
        if(s %in% c("DISPLAYABLE","DONE"))
            message("Document is ", tolower(s))
        else if(s == "")
            warning("Document ", out$doc_id, " conversion failed!")
    }
    return(out)
}

upload_thumbnail <- function(file, doc, ...){
    a <- list(doc_id = doc)
    scribd_query(method = "docs.getConversionStatus", 
                 args = a,
                 verb = "POST",
                 body = list(file = upload_file(file)),
                 ...)
}

conversion_status <- function(doc, ...){
    a <- list(doc_id = doc)
    scribd_query(method = "docs.getConversionStatus", 
                 args = a,
                 ...)
}
