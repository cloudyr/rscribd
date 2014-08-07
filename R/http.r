scribd_query <-
function(method, 
         base_url = "http://api.scribd.com/api", 
         verb = "GET",
         api_key = getOption("scribd_api_key"),
         session_key = getOption("scribd_session_key", NULL),
         my_user_id = getOption("scribd_user", NULL),
         secret_key = getOption("scribd_secret_key", NULL),
         ...){
    # request signing
    if(!is.null(secret_key)){
        # alphabetically sort args by arg name (exclude `file` arg, if applicable)
        a <- list()
        # concatenate secret key and args without separators
        s <- paste0(secret_key, names(a), a, collapse="")
        # md5 encode
        d <- digest(s, algo="md5")
        a <- append(a, c(api_sig = d))
    }
    
    # if no session_key, then pass a session-specific `my_user_id` variable (stored/retrieved from `options`)
    # OR, if no session_key but api_key, allow the operation anonymously
    
    # execute request
    if(verb == "GET"){
        out <- GET(paste0(base_url, '?method=', urlEscape(method)), ...)
    } else if(verb == "POST") {
        out <- POST(paste0(base_url, '?method=', urlEscape(method)), ...)
    } else {
        stop("'verb' must be 'GET' or 'POST'")
    }    
}
