#' Search for yarn
#'
#' This function retrieves a list of basic yarn details based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 100
#' @param sort options: `best`, `rating`, `projects`
#'
#' @return Tibble containing basic pattern details, some nested
#'
#' @export
#'
search_yarn <- function(query, page = NULL, page_size = NULL, sort = NULL){

  response <- ravelry_get(path = '/yarns/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size,
                                       sort = sort))

  fromJSONtoTibble(response)

}

#' Get details for multiple yarns
#'
#' This function retrieves details for one or multiple yarns using the yarn id.
#'
#' @param ids one or more `yarn_id`s
#'
#' @return tibble
#'
#' @export
#'
get_yarns <- function(ids){

  flat_ids <- paste(ids, collapse = '+')
  response <- ravelry_get(path = '/yarns.json', query = list(ids = flat_ids))

  # this is broken - also only returning the first item
  #fromJSONtoTibble(response)
  response

}

#' Get yarn attribute groups
#'
#' This function retrieves yarn attritube groups.
#'
#' @return tibble
#'
#' @export
#'
get_yarn_attribute_groups <- function(){

  response <- ravelry_get(path = '/yarn_attributes/groups.json')

  fromJSONtoTibble(response)

}

#' Search yarn companies
#'
#' This function retrieves yarn attritube groups.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 48
#' @param sort options: `best`
#'
#' @return tibble
#'
#' @export
#'
search_yarn_companies <- function(query, page = NULL, page_size = NULL, sort = NULL){

  response <- ravelry_get(path = '/yarn_companies/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size,
                                       sort = sort))

  fromJSONtoTibble(response)

}

