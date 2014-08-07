scribd_query <-
function(method, 
         args = NULL,
         verb = "GET",
         api_key = getOption("scribd_api_key"),
         session_key = getOption("scribd_session_key", NULL),
         my_user_id = getOption("scribd_user", NULL),
         secret_key = getOption("scribd_secret_key", NULL),
         base_url = "https://api.scribd.com/api", 
         ...)
{
    
    args$method <- method
    
    # if no session_key but api_key, allow the operation anonymously
    if(!is.null(session_key)) {
        if(is.null(api_key))
            stop("Must supply `api_key` and `session_key`")
        args$session_key <- session_key
    }
    if(!is.null(api_key)){
        args$api_key <- api_key
    } else
        stop("Must supply `api_key`")
    
    # request signing
    if(!is.null(secret_key)){
        # alphabetically sort args by arg name (exclude `file` arg, if applicable)
        a <- unlist(args)
        if('file' %in% names(a))
            a$file <- NULL
        # concatenate secret key and args without separators
        s <- paste0(secret_key,
                    names(a)[order(names(a))],
                    a[order(names(a))], collapse="")
        # md5 encode
        d <- digest(s, algo="md5")
        args$api_sig <- d
    }
    
    # execute request
    if(verb == "GET"){
        out <- GET(base_url, query = args, ...)
    } else if(verb == "POST") {
        out <- POST(base_url, query = args, ...)
    } else {
        stop("'verb' must be 'GET' or 'POST'")
    }
    stop_for_status(out)
    # perhaps this can be changed in the future when response is not `application/xml`
    x <- xmlToList(cnt <- content(out, as = 'text'))
    # need to parse errors here somehow
    return(x)
}
