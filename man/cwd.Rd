% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cwd.R
\name{cwd}
\alias{cwd}
\title{Cumulative water deficit}
\usage{
cwd(
  df,
  varname_wbal,
  varname_date,
  thresh_terminate = 0,
  thresh_drop = 0.9,
  doy_reset = 999
)
}
\arguments{
\item{df}{a data frame that contains the variable named according to argument \code{varname_wbal}}

\item{varname_wbal}{name of the variable representing the daily soil water balance (infiltration minus evapotranspiration)}

\item{varname_date}{name of the variable representing information about the date (format irrelevant)}

\item{thresh_terminate}{threshold determining the level, relative to maximum CWD attained
during the same event, to which a CWD has to be reduced to terminate the event. Defaults to 0,
meaning that the CWD has to be fully compensated by water infiltration into the soil to terminate
a CWD event.}

\item{thresh_drop}{Level, relative to the CWD maximum of the same event, after which all data
during the remainder of the event is set to missing values. This is to avoid interpreting data
after rain events but before full compensation of CWD. Defaults to 0.9.}

\item{doy_reset}{Day-of-year (integer) when deficit is to be reset to zero each year.}
}
\description{
Derives time series of the cumulative water deficit (CWD), given time series of
the daily soil water balance (infiltration minus evapotranspiration). CWD "events"
are identified as periods of consecutive days where the CWD is positive (a water deficit).
CWD is set to zero after rain has reduced the CWD by a user-defined fraction, relative to
maximum CWD attained during the same event.
}
\details{
A list of two data frames (tibbles). \code{inst} contains information about CWD "events".
Each row corresonds to one event. An event is defined as a period of consecutive days where the
CWD is positive (a water deficit)) and has the following columns:

\code{idx_start}: row number of \code{df} of which the date corresponds to the start of the event
\code{len}: length of the event, quantified as number of rows in \code{df} corresponding to the event
\code{iinst}: event number
\code{date_start}: starting date of the event, formatted as \code{varname_date} in \code{df}.
\code{date_end}: end date of the event, formatted as \code{varname_date} in \code{df}.
\code{deficit}: maximum CWD recorded during this event. Units correspond to units of \code{varname_wbal}
in \code{df}.
}
