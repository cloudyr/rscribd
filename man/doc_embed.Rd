\name{doc_embed}
\alias{doc_embed}
\title{Embed document}
\description{Write code to embed Scribd document in an HTML page}
\usage{
doc_embed(doc, div.id = "embedded_doc", 
          onDocReady = NULL, addParam = NULL,
          beforewrite = NULL, afterwrite = NULL, ...)

}
\arguments{
  \item{doc}{A document id (or object of class \dQuote{scribd_doc}) to embed.}
  \item{div.id}{A name to use as the \code{id} attribute of an HTML \code{<div>}, in which the document will be embedded. This is useful if you plan to embed multiple documents in a single HTML page.}
  \item{onDocReady}{A character string containing the body of a javscript function called \code{onDocReady} that will be called once the document is embedded in the page.}
  \item{addParam}{A named list of parameters to add to the javascript before writing the embedded document to the page. See \href{http://www.scribd.com/developers/javascript_api}{here} for further details.}
  \item{beforewrite}{A character string containing valid javascript code to write to the script prior to the document being written to the page.}
  \item{afterwrite}{A character string containing valid javascript code to write to the script after the document is written to the page.}
  \item{...}{Ignored.}
}
\details{This function builds a simple snippet of HTML and javascript to produce an iframe-embedded Scribd document. The \code{addParam} argument can be used to control the appearance of the embedded document.}
\value{A character string containing the HTML and javascript code.}
\references{
\href{http://www.scribd.com/developers/javascript_api}{Javscript API Reference}
}
\author{Thomas J. Leeper}
%\seealso{}
\examples{
\dontrun{
d <- docs_list()
cat(doc_embed(d[[1]]))
}
}
