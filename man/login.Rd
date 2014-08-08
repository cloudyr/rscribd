\name{signing}
\alias{scribd_login}
\alias{scribd_signup}
\title{Login to Scribd}
\description{Login or signup for Scribd}
\usage{
scribd_login(username, password, ...)

scribd_signup(username, password, email, name = NULL, ...)
}
\arguments{
  \item{username}{A character string containing a Scribd username to log in with, or one to create. In \code{scribd_signup}, a duplicate username will result in an error.}
  \item{password}{A character string containing a password associated with Scribd username (or, in \code{scribd_signup}, a new password to associate with the account).}
  \item{email}{A character string containing a working email address to register to the new account.}
  \item{name}{Optionally a character string containing your full name.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{These two functions can be used to signup for and/or login to a Scribd user account. Both functions have the side effect of registering \code{options('scribd_session_key')}, which allows all rscribd functions to be performed on this specific user account (rather than the account associated with the API key stored in \code{options('scribd_api_key')}. These are really only useful if you are developing an application that wraps rscribd for use by multiple users.

Be aware that \code{username} and \code{password} are passed to the Scribd API via unencoded URL query string parameters. While SSL is used for all API calls, one may want to avoid using these functions for reasons of security.
}
\value{A list containing details of the user account.}
\references{
\href{http://www.scribd.com/developers/platform/api/user_login}{API Reference: user.login}

\href{http://www.scribd.com/developers/platform/api/user_signup}{API Reference: user.signup}
}
\author{Thomas J. Leeper}
%\seealso{}
\examples{
\dontrun{
options("scribd_session_key")
scribd_signup("newuser", "password", "email@example.com", "First Last")
options("scribd_session_key")
scribd_signup("newuser", "password")
options("scribd_session_key")
}
}
