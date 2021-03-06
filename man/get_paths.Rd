% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_paths.R
\name{get_paths}
\alias{get_paths}
\title{Get paths from a specified node in a directed graph}
\usage{
get_paths(graph, from = NULL, to = NULL, shortest_path = FALSE,
  longest_path = FALSE, distance = NULL)
}
\arguments{
\item{graph}{a graph object of class \code{dgr_graph}.}

\item{from}{the node from which all paths will be determined.}

\item{to}{the node to which all paths will be determined.}

\item{shortest_path}{an option to return paths that are the shortest in the
set of all determined paths.}

\item{longest_path}{an option to return paths that are the longest in the
set of all determined paths.}

\item{distance}{a vector of integer values that specify which of the valid
paths to return when filtering by distance}
}
\value{
a list of paths, sorted by ascending traversal length, comprising
vectors of node IDs in sequence of traversal through the graph
}
\description{
Obtain a list of all possible paths from a given node within
a directed graph
}
\examples{
\dontrun{
library(magrittr)

# Create a simple graph
graph <-
  create_graph() \%>\%
  add_node_df(create_nodes(1:8)) \%>\%
  add_edge("1", "2") \%>\% add_edge("1", "3") \%>\%
  add_edge("3", "4") \%>\% add_edge("3", "5") \%>\%
  add_edge("4", "6") \%>\% add_edge("2", "7") \%>\%
  add_edge("7", "5") \%>\% add_edge("4", "8")

# Get a list of all paths outward from node "1"
get_paths(graph, from = "1")
#> [[1]]
#> [1] "1" "3" "5"
#>
#> [[2]]
#> [1] "1" "2" "7" "5"
#>
#> [[3]]
#> [1] "1" "3" "4" "6"
#>
#> [[4]]
#> [1] "1" "3" "4" "8"

# Get a list of all paths leading to node "6"
get_paths(graph, to = "6")
#> [[1]]
#> [1] "4" "6"
#>
#> [[2]]
#> [1] "3" "4" "6"
#>
#> [[3]]
#> [1] "1" "3" "4" "6"

#' # Get a list of all paths from "1" to "5"
get_paths(graph, from = "1", to = "5")
#> [[1]]
#> [1] "1" "3" "5"
#>
#> [[2]]
#> [1] "1" "2" "7" "5"

# Get a list of all paths from "1" up to a distance of 2 node traversals
get_paths(graph, from = "1", distance = 2)
#> [[1]]
#> [1] "1" "3" "5"
#>
#> [[2]]
#> [1] "1" "2" "7"
#>
#> [[3]]
#> [1] "1" "3" "4"

# Get a list of the shortest paths from "1" to "5"
get_paths(graph, from = "1", to = "5", shortest_path = TRUE)
#> [[1]]
#> [1] "1" "3" "5"

# Get a list of the longest paths from "1" to "5"
get_paths(graph, from = "1", to = "5", longest_path = TRUE)
#> [[1]]
#> [1] "1" "2" "7" "5"
}
}

