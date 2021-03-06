% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write.R
\name{read_unitted}
\alias{read_unitted}
\title{Read a unitted data.frame from a text file that was written using 
write_unitted.}
\usage{
read_unitted(file, comment.char = "#", header = TRUE, sep = "\\t",
  stringsAsFactors = FALSE, ..., attach.units = TRUE)
}
\arguments{
\item{file}{The file to read in}

\item{comment.char}{a single-character string. should describe any comments 
INCLUDING the special character, if any, that begins the units line (i.e., 
the comment.char that was specified in write_unitted)}

\item{header}{logical indicating whether to read in the header (and units), 
as in \code{\link{read.table}}}

\item{sep}{character string separating columns of the table, as in 
\code{\link{read.table}}}

\item{stringsAsFactors}{logical indicating whether to convert strings to 
factors, as in \code{\link{read.table}}}

\item{...}{Other arguments passed to \code{\link{read.table}}.}

\item{attach.units}{logical. If TRUE, the returned value is unitted. If 
FALSE, units in the text file are ignored entirely and the return value is 
a non-unitted data.frame.}
}
\value{
a unitted_data.frame if attach.units=TRUE, or a data.frame if 
  attach.units=FALSE.
}
\description{
Read a unitted data.frame from a text file that was written using 
write_unitted.
}
\examples{
practice <- u(data.frame(x=1:3, y=9:7, row.names=as.character(1:3)), c(x="grapes","seeds"))
write_unitted(practice, file="practice.tsv")
read_unitted("practice.tsv")
all.equal(practice, read_unitted("practice.tsv"))
file.remove("practice.tsv")
}
