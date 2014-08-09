\name{doc_delete}
\alias{doc_delete}
\title{Delete a document}
\description{Delete a document}
\usage{
doc_delete(doc, ...)
}
\arguments{
  \item{doc}{A document id (or object of class \dQuote{scribd_doc}) to delete.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{This deletes a document from Scribd. To simply remove a document from a collection, use \code{\link{coll_remove}}. To delete a collection, use \code{\link{coll_delete}}.}
\value{A logical.}
\references{
\href{http://www.scribd.com/developers/platform/api/docs_delete}{API Reference: delete}
}
\author{Thomas J. Leeper}
\seealso{
\code{\link{doc}}, \code{\link{doc_stats}}, \code{\link{doc_settings}}, \code{\link{doc_change}}

\code{\link{doc_upload}}, \code{\link{upload_thumbnail}}

\code{\link{coll_add}}, \code{\link{coll_remove}}
}
%\examples{}
