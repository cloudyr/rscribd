doc_embed <- 
function(doc, 
         div.id = "embedded_doc", 
         onDocReady = NULL, 
         addParam = NULL,
         beforewrite = NULL,
         afterwrite = NULL,
         ...
){
    paste("<script type=\"text/javascript\" src=\"http://www.scribd.com/javascripts/scribd_api.js\"></script>",
        paste0("<div id=\"", div.id, "\"><a href=\"http://www.scribd.com\">Scribd</a></div>"),
        "<script type=\"text/javascript\">",
        paste0("var scribd_doc = scribd.Document.getDoc(", doc$doc_id, ", '", doc$access_key, "');"),
        
        ifelse(!is.null(onDocReady), 
               paste("var onDocReady = function(e){", onDocReady, "}",),
               ""),
        "scribd_doc.addParam(\"jsapi_version\", 2);",
        ifelse(!is.null(addParam),
               paste0("scribd_doc.addParam(\"",
                      names(addParam),
                      "\",",
                      addParam,
                      ");",
                      collapse="\n"),
               ""),
        ifelse(!is.null(onDocReady), "scribd_doc.addEventListener(\"docReady\", onDocReady);", ""),
        ifelse(!is.null(afterwrite), beforewrite, ""),
        "scribd_doc.write('embedded_doc');",
        ifelse(!is.null(afterwrite), afterwrite, ""),
        "</script>",
        sep="\n")
}
