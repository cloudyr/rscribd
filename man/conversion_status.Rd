\name{conversion_status}
\alias{conversion_status}
\title{Check document upload}
\description{Check the upload and conversion status of a document}
\usage{
conversion_status(doc, ...)
}
\arguments{
  \item{doc}{A document id (or object of class \dQuote{scribd_doc}) to check the status of.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{After \code{\link{doc_upload}}, Scribd converts the document to a standard web-viewable format. This can be used to check whether that conversion was successfull. The \code{wait} argument to \code{doc_upload} enables a call to this function.}
%\value{}
\references{
\href{http://www.scribd.com/developers/platform/api/docs_getconversionstatus}{API Reference: getConversionStatus}
}
\author{Thomas J. Leeper}
%\seealso{}
%\examples{}
