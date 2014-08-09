\name{doc}
\alias{doc}
\alias{doc_thumbnail}
\title{Retrieve a document}
\description{Retrieve a document}
\usage{
doc(doc, fmt = "original", url_only = TRUE, ...)

doc_thumbnail(doc, width = NULL, height = NULL, url_only = TRUE, ...)
}
\arguments{
  \item{doc}{A document id to retrieve.}
  \item{fmt}{One of \dQuote{pdf}, \dQuote{txt}, or \dQuote{original} (the default).}
  \item{width}{For \code{doc_thumbnail}, the width of the thumbnail in pixels.}
  \item{height}{For \code{doc_thumbnail}, the height of the thumbnail in pixels.}
  \item{url_only}{A logical indicating whether to only return the document's URL (the default). If \code{FALSE}, the document is downloaded and returned as a raw vector.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{\code{doc} returns the URL from which a Scribd document can be downloaded. If \code{url_only=FALSE}, the document itself is downloaded from that URL and returned as a raw vector. \code{doc_thumbnail} does the same, but for the thumbnail \dQuote{cover image} for the document.
}
\value{Either a character string containing a URL or the document (or its thumbnail) as a raw vector.}
\references{
\href{http://www.scribd.com/developers/platform/api/docs_getdownloadurl}{API Reference: getDownloadUrl}
}
\author{Thomas J. Leeper}
\seealso{
\code{\link{doc_stats}}, \code{\link{doc_settings}}, \code{\link{doc_change}}, \code{\link{doc_delete}}

\code{\link{doc_upload}}, \code{\link{upload_thumbnail}}
}
%\examples{}
