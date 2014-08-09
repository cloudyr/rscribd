\name{AddRemoveDocs}
\alias{coll_add}
\alias{coll_remove}
\title{Add/remove docs}
\description{Add or remove documents from a collection}
\usage{
coll_add(id, doc, ...)

coll_remove(id, doc, ...)

}
\arguments{
  \item{id}{A collection id (or object of class \dQuote{scribd_collection}) to add documents to (or remove documents from).}
  \item{doc}{A document id  (or object of class \dQuote{scribd_doc}) to add to (or remove from) the collection.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{These functions add documents to a collection or remove documents from a collection.}
%\value{}
\references{
\href{http://www.scribd.com/developers/platform/api/collections_adddoc}{API Reference: addDoc}

\href{http://www.scribd.com/developers/platform/api/collections_removedoc}{API Reference: removeDoc}
}
\author{Thomas J. Leeper}
\seealso{
\code{\link{coll_list}}, \code{\link{coll_docs}}

\code{\link{coll_create}}, \code{\link{coll_update}}, \code{\link{coll_delete}}
}
\examples{
\dontrun{
colls <- coll_list()
docs <- docs_list()
coll_add(colls[[1]], docs[[1]])
coll_remove(colls[[1]], docs[[1]])
}
}
