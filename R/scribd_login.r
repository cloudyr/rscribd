scribd_login <-
function(username, # or email address
         password,
         ...
){
    a <- list()
    a$username <- username
    a$password <- password
    out <- 
    scribd_query(method = "user.login", 
                 args = a,
                 ...)
    Sys.setenv('SCRIBD_SESSION_KEY' = out$session_key)
    return(out)
}

scribd_signup <-
function(username,
         password,
         email,
         name = NULL, # real name
         ...
){
    a <- list()
    a$username <- username
    a$password <- password
    a$email <- email
    if(!is.null(name))
        a$name <- name
    out <- 
    scribd_query(method = "user.signup", 
                 args = a,
                 ...)
    options('SCRIBD_SESSION_KEY' = out$session_key)
    return(out)
}
