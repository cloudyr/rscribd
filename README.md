# rscribd Package #

**rscribd** allows users to publish and retrieve documents from the [Scribd](http://www.scribd.com/) publishing platform. Below are some simple code examples demonstrating package functionality. Note: [Usage limits](http://www.scribd.com/developers/platform#limits) for the API are very generous and it is highly unlikely you will reach them.

### Authentication options ###

The Scribd API has several possible ways to authenticate requests. The simplest involves passing an API key to any **rscribd** function using the `api_key` argument. If this value is not specified, **rscribd** will look for an API key in `Sys.setenv("SCRIBD_API_KEY")`. If none is provided, any operation will fail.

In addition to API key authentication, API requests can be further authenticated via request signing (essentially MD5 hashing), which provides an added layer of security that prevents others from using an exposed API key for unauthorized use. To sign requests, your API account must be configured in the [Scribd API options](http://www.scribd.com/account-settings/api) to have "Require API Signature" set to "Require signature". Then, in addition to the `api_key` argument, all function calls must additionally include the API Secret Key as the `secret_key` argument (or have a secret key set globally with `Sys.setenv("SCRIBD_SECRET_KEY")`). All functions will work without a secret key, by defaulting to basic authentication (described above).

If you are trying to build a public-facing app on top of **rscribd**, you may also want to leverage a user-specific session key returned by `scribd_login`. This allows user-specific operations without requiring users to register an API key. Once a session key is obtained, it can be passed to any **rscribd** function using the `session_key` argument (or have that argument set globally using `Sys.setenv("SCRIBD_SESSION_KEY")`). The session key is reasonably long lived. If this value is not specified, all operations are performed (by default) on the account associated with the API key.

### Uploading documents to Scribd ###

Documents can be uploaded to Scribd in two ways: from a local file or via URL. Supported file types are: pdf, txt, ps, rtf, epub, key, odt, odp, ods, odg, odf, sxw, sxc, sxi, sxd, doc, ppt, pps, xls, docx, pptx, ppsx, xlsx. Image files formats are not allowed.

To upload a document, you can simply use:

```
mydoc <- doc_upload("myfile.pdf")
```

An optional `wait` argument to `doc_upload` waits and repeatedly checks to see if the upload was successful before returning to the console. If the upload fails, an error is produced. If `wait=FALSE`, no checking is performed (but can be performed manually using `conversion_status`).

Once uploaded, it is possible to view document settings and metadata using `doc_settings`:

```
doc_settings(mydoc)
```

These settings can be changed using `doc_change`, for example to modify a title:

```
doc_change(mydoc, title = "My first rscribd upload")
```

### Collections ###

Documents can also be organized into "collections," which combine related documents together.

To create a collection, usinge `coll_create`:

```
mycol <- coll_create("My rscribd documents", "A collection of rscribd documents")
```

You can change the title, description, and access setting for a collection using `coll_update`.

To add a document to a collection, use `coll_add`. You can use `coll_remove` to remove a document:

```
coll_add(mycol, mydoc)
coll_remove(mycol, mydoc)
```

`coll_list` returns a list of documents contained in a collection:

```
coll_list(mycol)
```

`coll_delete` deletes a collection. `doc_delete` deletes a document from Scribd entirely.

## Requirements and Installation ##

[![CRAN Version](http://www.r-pkg.org/badges/version/rscribd)](http://cran.r-project.org/package=rscribd)
![Downloads](http://cranlogs.r-pkg.org/badges/rscribd)
[![Travis-CI Build Status](https://travis-ci.org/leeper/rscribd.png?branch=master)](https://travis-ci.org/leeper/rscribd)
[![codecov.io](http://codecov.io/github/leeper/rscribd/coverage.svg?branch=master)](http://codecov.io/github/leeper/rscribd?branch=master)

**rscribd** is available on [CRAN](http://cran.r-project.org/web/packages/rscribd/index.html), so that it can be installed using:

```
install.packages('rscribd')
```

The development version can be installed directly from GitHub using `ghit`:

```
if(!require('ghit')) {
    install.packages('ghit')
}
ghit::install_github('leeper/rscribd')
```

