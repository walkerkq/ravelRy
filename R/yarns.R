#' Search for yarn
#'
#' This function retrieves a list of basic yarn details based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 100
#' @param sort options: `best`, `rating`, `projects`
#' @param ... pass any other filter parameters available via \url{https://www.ravelry.com/yarns/search}
#' (ex. weight, needles, photo, fiberc, ya, ratings, origin)
#'
#' @return tibble containing basic pattern details, some nested
#'
#' @examples \dontrun{search_yarn(query = 'cascade', page_size = 10)}
#'
#' # using site search parameters
#' \dontrun{search_yarn(query = 'cascade', sort = 'best', weight = 'sport', needles = '3.75mm')}
#'
#' @export
#'
search_yarn <- function(query = NULL, page = NULL, page_size = NULL, sort = NULL, ...){

  response <- ravelry_get(path = '/yarns/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size,
                                       sort = sort,
                                       ...))

  response_tibble <- fromJSONtoTibble(response)

  response_tibble %>%
    select(-starts_with('first_photo'),
           -starts_with('yarn_weight'),
           -.data$personal_attributes)

}

#' Get details for multiple yarns
#'
#' This function retrieves details for one or multiple yarns using the yarn id.
#'
#' @param ids one or more `yarn_id`s
#'
#' @return tibble containing yarn details like company, gauge, grams, texture, needle sizes, ratings, etc.
#'
#' @examples \dontrun{get_yarns(ids = c(66124,54110))}
#'
#' @export
#'
get_yarns <- function(ids){

  response <- ravelry_get(path = '/yarns.json', query = list(ids = paste(ids, collapse = '+')))

  fromJSONtoTibble(response, deep = TRUE)

}

#' Get yarn attribute groups
#'
#' This function retrieves yarn attribute groups.
#'
#' @return tibble containing current attribute groups for yarn.
#'
#' @examples \dontrun{get_yarn_attribute_groups()}
#'
#' @export
#'
get_yarn_attribute_groups <- function(){

  response <- ravelry_get(path = '/yarn_attributes/groups.json')

  fromJSONtoTibble(response)

}

#' Search yarn companies
#'
#' This function retrieves yarn companies based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 48
#' @param sort options: `best`
#' @param ... pass any other filter parameters available via \url{https://www.ravelry.com/yarns/brands/search}
#'
#' @return tibble containing company details
#'
#' @examples \dontrun{search_yarn_companies(query = 'lion')}
#'
#' @export
#'
search_yarn_companies <- function(query = NULL, page = NULL, page_size = NULL, sort = NULL, ...){

  response <- ravelry_get(path = '/yarn_companies/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size,
                                       sort = sort,
                                       ...))

  fromJSONtoTibble(response)

}

