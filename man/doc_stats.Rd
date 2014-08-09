\name{doc_stats}
\alias{doc_stats}
\title{Document statistics}
\description{Retrieve document view and download statistics}
\usage{
doc_stats(doc, ...)
}
\arguments{
  \item{doc}{A document id (or object of class \dQuote{scribd_doc}).}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{This retrieves statistics about a document from Scribd. To retrieve document metadata, instead use \code{\link{doc_settings}}.}
\value{A list.}
\references{
\href{http://www.scribd.com/developers/platform/api/docs_getstats}{API Reference: getStats}
}
\author{Thomas J. Leeper}
\seealso{
\code{\link{doc}}, \code{\link{doc_settings}}, \code{\link{doc_change}}, \code{\link{doc_delete}}

\code{\link{doc_upload}}, \code{\link{upload_thumbnail}}
}
%\examples{}
