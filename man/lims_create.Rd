% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Create_dB.R
\name{lims_create}
\alias{lims_create}
\title{lims_Ccreate}
\usage{
lims_create(lims_database, creds, lims_types, valdoc)
}
\arguments{
\item{lims_database}{Database name.}

\item{creds}{RDS object with database user and pass}

\item{lims_types}{LIMS collections to be created.  Ussually read from lms_config.R}

\item{valdoc}{validation json doc that used in creating metadata table}
}
\value{
returns "created LIMS successful" if sucsessful or error message if function fails.
}
\description{
Creates tables for ShinyLIMS
}
\details{
DETAILS
}
\examples{
\dontrun{
if(interactive()){
 lims <- lims_create(lims_database,creds,lims_types,valdoc)
 }
}
}
