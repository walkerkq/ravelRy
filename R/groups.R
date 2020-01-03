#' Search groups
#'
#' This function retrieves groups based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 50
#' @param sort options: `best`, `added`, `favorites`
#' @param ... pass any other filter parameters available via \url{https://www.ravelry.com/groups/search}
#' (ex. creation, gc)
#'
#' @return tibble containing group information, like name, created_at, short_description, etc.
#'
#' @examples \dontrun{search_groups(query = 'star wars')}
#'
#' # with site search parameters
#' \dontrun{search_groups(query = 'star wars', gc = 'knitting')}
#'
#' @export
#'
search_groups <- function(query = NULL, page = NULL, page_size = NULL, sort = NULL, ...){

  response <- ravelry_get(path = '/groups/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size,
                                       sort = sort,
                                       ...))

  fromJSONtoTibble(response)

}
