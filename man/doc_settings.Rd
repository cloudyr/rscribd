\name{doc_settings}
\alias{doc_settings}
\alias{doc_change}
\title{Document metadata}
\description{Retrieve or update document metadata settings}
\usage{
doc_settings(doc, ...)

doc_change(doc, isbn = NULL, title = NULL, description = NULL,
           access = NULL, license = NULL,
           category = NULL, tags = NULL, fmt = NULL,
           author = NULL, publisher = NULL, 
           pub_date = NULL, edition = NULL,
           disable_select_text = NULL, disable_related = NULL, ...)
}
\arguments{
  \item{doc}{A document id (or object of class \dQuote{scribd_doc}) to retrieve.}
  \item{isbn}{Optionally, a character string containing an ISBN number.}
  \item{title}{Optionally, a character string containing a document title.}
  \item{description}{Optionally, a character string containing a document description.}
  \item{access}{Optionally, a character string containing one of \dQuote{public} or \dQuote{private}.}
  \item{license}{Optionally, a character string containing a license abbreviation. One of: \dQuote{by}, \dQuote{by-nc}, \dQuote{by-nc-nd}, \dQuote{by-nc-sa}, \dQuote{by-nd}, \dQuote{by-sa}, \dQuote{c} (copyright), or \dQuote{pd} (public domain).}
  \item{category}{Optionally, a document category (possibly retrieved from \code{|link{docs_categories}}).}
  \item{tags}{Optionally, a character string of comma-separated document tags or a character vector of tags.}
  \item{fmt}{Optionally, a character string of comma-separated formats or a character vector of formats. Only allowed formats are: \dQuote{pdf}, \dQuote{txt}, and \dQuote{original}.}
  \item{author}{Optionally, a character string containing an author name.}
  \item{publisher}{Optionally, a character string containing a publisher name.}
  \item{pub_date}{Optionally, a character string containing a publication date.}
  \item{edition}{Optionally, a character string containing an edition.}
  \item{disable_select_text}{Optionally, a boolean that, if \code{TRUE}, prevents users from selecting text in the document on Scribd. Default is \code{FALSE}.}
  \item{disable_related}{Optionally, a boolean that, if \code{TRUE}, hides the \dQuote{related documents} panel on Scribd. Default is \code{FALSE}.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{\code{doc_settings} returns document settings and metadata. \code{doc_change} updates those settings and metadata. To retrieve view and download statistics, use \code{\link{doc_stats}} and to download a document itself use \code{\link{doc}}.}
\value{A list object of class \dQuote{scribd_doc}.}
\references{
\href{http://www.scribd.com/developers/platform/api/docs_getsettings}{API Reference: getSettings}

\href{http://www.scribd.com/developers/platform/api/docs_changesettings}{API Reference: changeSettings}
}
\author{Thomas J. Leeper}
\seealso{
\code{\link{doc}}, \code{\link{doc_stats}}, \code{\link{doc_delete}}

\code{\link{doc_upload}}, \code{\link{upload_thumbnail}}
}
\examples{
\dontrun{
mydoc <- "document_id"
doc_settings(mydoc)
doc_change(mydoc, title = "New Title", edition = "2")
}
}
