\name{createcollection}
\alias{coll_create}
\alias{coll_update}
\alias{coll_delete}
\title{Create/update/delete collection}
\description{Create, update details of, or delete a collection}
\usage{
coll_create(name, description, access = "public", ...)

coll_update(id, name = NULL, description = NULL, access = NULL, ...)

coll_delete(id, ...)
}
\arguments{
  \item{id}{A collection id (or object of class \dQuote{scribd_collection}) to either update or delete.}
  \item{name}{The name of the collection. This is optional for \code{coll_update}.}
  \item{description}{The description of the collection. This is optional for \code{coll_update}.}
  \item{access}{An access level for the collection; one of \dQuote{public} (the default) or \dQuote{private}. This is optional for \code{coll_update}.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{These functions create a collection or update the details of an already created collection, or to delete a collection. To add or remove documents to/from a collection, use \code{\link{coll_add}} and \code{\link{coll_remove}}, respectively. To delete a document entirely, use \code{\link{doc_delete}}.}
%\value{}
\references{
\href{http://www.scribd.com/developers/platform/api/collections_create}{API Reference: create}

\href{http://www.scribd.com/developers/platform/api/collections_update}{API Reference: update}

\href{http://www.scribd.com/developers/platform/api/collections_delete}{API Reference: delete}
}
\author{Thomas J. Leeper}
\seealso{
\code{\link{coll_list}}, \code{\link{coll_docs}}

\code{\link{coll_add}}, \code{\link{coll_remove}}
}
%\examples{}
