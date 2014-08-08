\name{doc_upload}
\alias{doc_upload}
\title{Upload document}
\description{Upload document to Scribd}
\usage{
doc_upload(file = NULL, url = NULL, doc = NULL, ext = NULL,
           access = "public", paid_content = FALSE, drm = NULL,
           wait = FALSE, ...)

upload_thumbnail(file, doc, ...)
}
\arguments{
  \item{file}{A character string containing a path to a local file to be uploaded. See Details on allowed file types.}
  \item{url}{A character string containing a remote URL from which to upload the file. See Details on allowed file types.}
  \item{doc}{For \code{doc_upload}: Optionally, a document id. If specified, the file upload is treated as a revision of the already existing document. For \code{upload_thumbnail}, a document id that the thumbnail will be attached to.}
  \item{ext}{Optionally, a file extension (without the period). This overrides the file extension of the file or, in the case of a URL without a file extension, makes the file type explicit. When possible, the extension will be inferred from \code{file} (but not from \code{url}).
  \item{access}{An access level for the document; one of \dQuote{public} (the default) or \dQuote{private}.}
  \item{paid_content}{A logical indicating whether should be uploaded as paid content (and thus given protected access and encryption). This cannot be changed after upload.}
  \item{drm}{If \code{paid_content = TRUE}, this option configures the download options for the document. Must be one of \dQuote{download-pdf} (the default), \dQuote{download-pdf-orig}, or \dQuote{view-only}.}
  \item{wait}{A logical indicating whether to wait for the document to finish conversion. This may take some time. This parameter simply causes \cod{doc_upload} to periodically check \code{\link{conversion_status}} until it is confirmed that the document converted successfully.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{
\code{doc_upload} uploads a document to Scribd either from a local file or from a remote URL. Image files are not allowed. Allowed file types are: pdf, txt, ps, rtf, epub, key, odt, odp, ods, odg, odf, sxw, sxc, sxi, sxd, doc, ppt, pps, xls, docx, pptx, ppsx, xlsx.

\code{upload_thumbnail} sends a thumbnail \dQuote{cover image} for the document to Scribd. This is, by default, just a small, fuzzy representation of the document itself.
}
%\value{}
\references{
\href{http://www.scribd.com/developers/platform/api/docs_upload}{API Reference: upload}

\href{http://www.scribd.com/developers/platform/api/docs_uploadfromurl}{API Reference: uploadFromUrl}

\href{http://www.scribd.com/developers/platform/api/docs_uploadthumb}{API Reference: uploadThumb}
}
\author{Thomas J. Leeper}
%\seealso{}
%\examples{}
