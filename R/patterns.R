#' Search for patterns
#'
#' This function retrieves a list of pattern ids and basic details based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 100
#'
#' @return Tibble containing basic pattern details, some nested
#'
#' @export
#'
search_patterns <- function(query, page = NULL, page_size = NULL){

  response <- ravelry_get(path = 'patterns/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size))

  fromJSONtoTibble(response)

}

#' Get pattern details for multiple patterns
#'
#' This function retrieves details for one or multiple patterns using the pattern id.
#'
#' @param ids one or more `pattern_id`s
#'
#' @return tibble
#'
#' @export
#'
get_patterns <- function(ids){

  flat_ids <- paste(ids, collapse = '+')
  response <- ravelry_get(path = 'patterns.json', query = list(ids = flat_ids))

  # this is broken
  #fromJSONtoTibble(response)
  response

}

#' Get comments for a pattern
#'
#' This function retrieves comments for a pattern using the pattern id.
#'
#' @param id a `pattern_id`
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 25, max is 100
#' @param sort sort order; options are `time`, `helpful`
#' (and `time_`, `helpful_` for descending sort)
#' @return tibble
#'
#' @export

get_pattern_comments <- function(id, page = NULL, page_size = NULL, sort = NULL){

  # 403 forbidden?
  response <- ravelry_get(path = paste0('patterns/', id, '/comments.json'),
                          query = list(page = page,
                                       page_size = page_size,
                                       sort = sort))

  #fromJSONtoTibble(response)
  response

}

#' Get pattern categories
#'
#' This function retrieves pattern categories.
#'
#' @return tibble
#'
#' @export
#'
get_pattern_categories <- function(){

  response <- ravelry_get(path = '/pattern_categories/list.json')

  fromJSONtoTibble(response)

}

