#' Search for patterns
#'
#' This function retrieves a list of pattern ids and basic details based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 100
#'
#' @return API pattern list object
#'
#' @export
#'
search_patterns <- function(query, page = NULL, page_size = NULL){

  response <- ravelry_get(path = 'patterns/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size))

  response

}

#' Get pattern details for multiple patterns
#'
#' This function retrieves details for one or multiple patterns using the pattern id.
#'
#' @param ids one or more `pattern_id`s
#'
#' @return API pattern object
#'
#' @export
#'
get_patterns <- function(ids){

  flat_ids <- paste(ids, collapse = '+')
  response <- ravelry_get(path = 'patterns.json', query = list(ids = flat_ids))

  response

}
