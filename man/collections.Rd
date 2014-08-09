\name{Collections}
\alias{coll_list}
\alias{coll_docs}
\title{Collections}
\description{View collections and documents in a collection}
\usage{
coll_list(access = NULL, ...)

coll_docs(id, limit = 20, offset = 0, ...)
}
\arguments{
  \item{access}{Restrict response to an access level for the collection; one of \dQuote{public} or \dQuote{private}.}
  \item{id}{A collection id, the documents from which you want to retrieve.}
  \item{limit}{For results pagination, a numeric value indicating the number of result to return. Must be less than 1000.}
  \item{offset}{For results pagination, a numeric value indicating the initial result to return. Must be less than 1000.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{
\code{coll_list} returns a list of collections available to the user.

\code{coll_docs} returns a list of documents contained in a collection. Results can be paginated using the \code{limit} (page size) and \code{offset} (page start) parameters. For example, a call with \code{limit = 20, offset = 0} returns the first 20 results. A subsequent call to \code{limit = 20, offset = 20} returns the next 20 results.
}
%\value{}
%\references{}
\author{Thomas J. Leeper}
\seealso{
\code{\link{coll_create}}, \code{\link{coll_update}}, \code{\link{coll_delete}}

\code{\link{coll_add}}, \code{\link{coll_remove}}
}
%\examples{}
