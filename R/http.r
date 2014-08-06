scribd_query <-
function(method, 
         base_url = "http://api.scribd.com/api", 
         verb = "GET",
         api_key,
         session_key = NULL,
         my_user_id = NULL,
         signature = FALSE,
         ...){
    # request signing
    if(signature){
        # alphabetically sort args by arg name (exclude `file` arg, if applicable)
        a <- list()
        # concatenate without separators
        s <- paste0(names(a), a, collapse="")
        # md5 encode
        d <- digest(s, algo="md5")
        a <- append(a, c(api_sig = d))
    }
    
    # if no session_key, then pass a session-specific `my_user_id` variable (stored/retrieved from `options`)
    # OR, if no session_key but api_key is not mine, allow the operation anonymously
    
    # execute request
    if(verb == "GET"){
        out <- GET(paste0(base_url, '?method=', urlEscape(method)), ...)
    } else if(verb == "POST") {
        out <- POST(paste0(base_url, '?method=', urlEscape(method)), ...)
    } else {
        stop("'verb' must be 'GET' or 'POST'")
    }    
}
