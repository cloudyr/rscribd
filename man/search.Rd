\name{search}
\alias{docs_search}
\alias{docs_browse}
\alias{docs_featured}
\alias{docs_list}
\title{Search documents}
\description{Search and browse Scribd documents}
\usage{
docs_search(query, category = NULL, language = NULL,
            simple = TRUE, limit = 10, offset = 0, ...)

docs_featured(scope = "hot", limit = 20, offset = 0, ...)

docs_browse(sort = "popular", limit = 20, offset = 0, ...)

docs_list(limit = 20, offset = 0, ...)
}
\arguments{
  \item{query}{A character string containing a search query. If \code{simple=TRUE}}
  \item{category}{Optionally, a numeric value indicating a Scribd document category, perhaps returned by \code{\link{docs_categories}}.}
  \item{language}{Optionally, an \href{http://en.wikipedia.org/wiki/ISO_639-1}{ISO 639-1} formatted language identifier.}
  \item{simple}{A logical indicating when \code{TRUE} (the default), to allow advanced search queries like \code{title:"A Tale of Two Cities"}. When \code{FALSE}, \code{query} is interpreted like a search query on the Sribd website.}
  \item{scope}{A character string containing either \dQuote{new} or \dQuote{hot}.}
  \item{sort}{A character string containing one of \dQuote{popular}, \dQuote{views}, or \dQuote{newest}.}
  \item{limit}{For results pagination, a numeric value indicating the number of result to return. Must be less than 1000.}
  \item{offset}{For results pagination, a numeric value indicating the initial result to return. Must be less than 1000.}
  \item{...}{Other arguments passed to HTTP request functions.}
}
\details{
\code{docs_search} allows for searches of all documents on Scribd based on a search query, category restrictions, and language restrictions.

\code{docs_featured} returns a list of featured documents based on time or popularity.

\code{docs_browse} returns a list of documents based on time, views, or popularity.

\code{docs_list} returns a list of the user's own documents.

All of these functions can be paginated using the \code{limit} (page size) and \code{offset} (page start) parameters. For example, a call with \code{limit = 20, offset = 0} returns the first 20 results. A subsequent call to \code{limit = 20, offset = 20} returns the next 20 results.
}
\value{A list of objects of class \dQuote{scribd_doc}.}
\references{
\href{http://www.scribd.com/developers/platform/api/docs_search}{API Reference: docs.search}

\href{http://www.scribd.com/developers/platform/api/docs_featured}{API Reference: docs.featured}

\href{http://www.scribd.com/developers/platform/api/docs_browse}{API Reference: docs.browse}

\href{http://www.scribd.com/developers/platform/api/docs_getlist}{API Reference: docs.getList}
}
\author{Thomas J. Leeper}
%\seealso{}
\examples{
\dontrun{
# get your own documents
docs_list()

# search public documents
docs_search("John Chambers")

# featured documents
docs_featured()
}
}
