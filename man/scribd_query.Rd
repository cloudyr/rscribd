\name{scribd_query}
\alias{scribd_query}
\title{Workhorse function}
\description{Execute a Sribd API query}
\usage{
scribd_query(method, args = NULL, verb = "GET",
             api_key = Sys.getenv("SCRIBD_API_KEY"),
             session_key = Sys.getenv("SCRIBD_SESSION_KEY", NULL),
             my_user_id = Sys.getenv("SCRIBD_USER", NULL),
             secret_key = Sys.getenv("SCRIBD_SECRET_KEY", NULL),
             base_url = "https://api.scribd.com/api", 
             ...)
}
\arguments{
  \item{method}{A character string containing an API endpoint.}
  \item{args}{A list containing named arguments to pass as query string parameters to the API endpoint.}
  \item{verb}{A character string containing an API verb. One of \dQuote{GET} or \dQuote{POST}.}
  \item{api_key}{A character string containing a Scribd API key. This is required for all requests.}
  \item{session_key}{Optionally, a character string containing a Scribd sesion key. If supplied, requests are performed on the user account associated with the session key rather than the account associated with the API key.}
  \item{my_user_id}{Optionally, a character string containing a \dQuote{phantom user account} with which to perform the API operation. This allows, for example, for a single developer's account to contain information for numerous users without requiring them to register an account with Scribd.}
  \item{secret_key}{Optionally, a character string containing an API secret key. If supplied, API requests are made with an additional MD5 hash of the request to prevent unauthorized use of an API key. This setup must also be configured in the \href{http://www.scribd.com/account-settings/api}{Scribd API account settings} by setting the \dQuote{Require API Signature} option to \dQuote{Require signature}.}
  \item{base_url}{A character string containing the base URL for API endpoints. Provided for forward compatibility in the event of a URL change.}
  \item{...}{Other arguments passed to \code{GET} or \code{POST}.}
}
\details{This is the basic workhorse function that performs API requests. It is exposed for advanced users for purposes of troubleshooting or custom requests not provided in the rscribd wrapper functions. All arguments to this function can be passed via \code{...} to any other rscribd function, allowing varying levels of request authentication.}
\value{A list containing the parsed XML response from the Scribd API.}
\references{
\href{http://www.scribd.com/developers/platform}{Using the API}

\href{http://www.scribd.com/developers/platform/api}{API Endpoints}
}
\author{Thomas J. Leeper}
%\seealso{}
%\examples{}
