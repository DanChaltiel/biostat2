% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/body_add_crosstable.r
\name{cross_to_flextable}
\alias{cross_to_flextable}
\alias{body_add_crosstable}
\title{Crosstables output}
\usage{
cross_to_flextable(
  crosstable,
  compact = FALSE,
  auto.fit = FALSE,
  id = ".id",
  variable = "variable",
  label = "label",
  value = "value",
  p = "p",
  effect = "effect",
  total = "Total",
  show.test.name = F,
  generic.labels = c(id, variable, label, value, p, effect, total)
)

body_add_crosstable(doc, ...)
}
\arguments{
\item{crosstable}{the result of \code{cross} function}

\item{compact}{whether to compact the table}

\item{auto.fit}{whether to \code{flextable::autofit} the table}

\item{id}{name of the 'id' column}

\item{variable}{name of the 'variable' column}

\item{label}{name of the 'label' column}

\item{value}{name of the 'value' column}

\item{p}{name of the 'p' column}

\item{show.test.name}{in the p column, show the test name}

\item{doc}{a \code{rdocx} object created by \code{read_docx} function (see \code{officer} package)}

\item{...}{arguments for \code{cross_to_flextable}}
}
\value{
A \code{rdocx} object
}
\description{
\code{cross_to_flextable} turns a table made by the cross function into a flextable.

\code{body_add_crosstable2} adds a table made by the cross function into an officer document
}
\examples{
### cross_to_flextable
library(dplyr) #for the pipe operator
library(officer)
cross(cbind(...) ~ tobgp, esoph, test = TRUE) \%>\% cross_to_flextable
cross(cbind(...) ~ Species, iris, test = TRUE) \%>\% cross_to_flextable
cross(cbind(...) ~ ., esoph) \%>\% cross_to_flextable

### body_add_crosstable
#mytable <- cross(cbind(...) ~ tobgp, esoph, test = TRUE)
#mytable <- cross(cbind(...) ~ Species, iris, test = TRUE)
mytable <- cross(cbind(...) ~ ., esoph)
doc <- read_docx() \%>\% 
    body_add_crosstable(mytable) \%>\% 
    body_add_break \%>\% 
    body_add_crosstable(mytable, compact=TRUE)

\dontrun{
dfile <- "test_doc.docx"
print(doc, target = dfile)
shell.exec(dfile)
}
}
\author{
Dan Chaltiel
}
