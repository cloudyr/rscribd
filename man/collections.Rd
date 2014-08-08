\name{Collections}
\alias{coll_list}
\alias{coll_docs}
\title{Collections}
\description{View collections and documents in a collection}
\usage{
coll_list(access = NULL, ...)

coll_docs(id, ...)
}
\arguments{
  \item{access}{Restrict response to an access level for the collection; one of \dQuote{public} or \dQuote{private}.}
  \item{id}{A collection id, the documents from which you want to retrieve.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{
\code{coll_list} returns a list of collections available to the user.

\code{coll_docs} returns a list of documents contained in a collection.
}
%\value{}
%\references{}
\author{Thomas J. Leeper}
\seealso{
\code{\link{coll_create}}, \code{\link{coll_update}}, \code{\link{coll_delete}}

\code{\link{coll_add}}, \code{\link{coll_remove}}
}
%\examples{}
