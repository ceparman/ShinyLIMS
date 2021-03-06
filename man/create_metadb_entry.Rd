% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_metadb_entry.R
\name{create_metadb_entry}
\alias{create_metadb_entry}
\title{create_metadb_entry}
\usage{
create_metadb_entry(db_connection, name, table, type, fields, bcprefix)
}
\arguments{
\item{db_connection}{mongolite connection to metadb table}

\item{name}{Name ob object type. Must be unique in metadb table}

\item{table}{collection that will hold instances of this type.}

\item{type}{object type used for searching (to be controlled a some point)}

\item{fields}{list of fields for objects}

\item{bcprefix}{Prefix for barcode generation.}

\item{fieldreq}{"Y","N" list to determine if the field is required.}
}
\value{
Error message if not succesful.
}
\description{
creates a new object type in the metadata collection
}
\details{
Parameter table must be from lims_types defined in lims_config.

Allowed data types are datatypes defined in lims_config.

Currently "string","int","float","boolean","date","array","file","script" are allowed.
}
\examples{
\dontrun{
if(interactive()){
 #EXAMPLE1
 }
}
}
