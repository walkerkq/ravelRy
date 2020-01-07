#' Search for patterns
#'
#' This function retrieves a list of pattern ids and basic details based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 100
#' @param ... pass any other filter parameters available via \url{https://www.ravelry.com/patterns/search}
#' (ex. craft, availability, photo, pa, fit, weight, etc.)
#' @return tibble containing basic pattern details, some nested
#'
#' @examples \dontrun{search_patterns(query = 'cowl')}
#'
#' # with site search parameters
#' \dontrun{search_patterns(query = 'hat', page_size = 10, availability = 'free', fit = 'baby')}
#'
#' @import dplyr
#'
#' @export
#'
search_patterns <- function(query = NULL, page = NULL, page_size = NULL, ...){

  response <- ravelry_get(path = 'patterns/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size,
                                       ...))

  response_tibble <- fromJSONtoTibble(response)

  response_tibble %>%
    select(.data$free, .data$id, .data$name, .data$permalink,
           .data$designer.id, .data$designer.name,
           .data$pattern_sources)

}

#' Get pattern details for multiple patterns
#'
#' This function retrieves details for one or multiple patterns using the pattern id.
#'
#' @param ids one or more `pattern_id`s. Tested for vectors of up to 500 ids; 100 max recommended.
#'
#' @return tibble containing pattern details, like yardage, gauge, count of comments, ratings, etc.
#'
#' @examples \dontrun{get_patterns(ids = c(600, 601))}
#'
#' @export
#'
get_patterns <- function(ids){

  response <- ravelry_get(path = 'patterns.json', query = list(ids = paste(ids, collapse = '+')))

  fromJSONtoTibble(response, deep = TRUE)

}

#' Get pattern categories
#'
#' This function retrieves pattern categories.
#'
#' @return nested tibble containing levels of categories and sub-categories for patterns.
#'
#' @examples \dontrun{ get_pattern_categories() }
#'
#' @export
#'
get_pattern_categories <- function(){

  response <- ravelry_get(path = '/pattern_categories/list.json')

  response_tibble <- fromJSONtoTibble(response)

  response_tibble$children

}

