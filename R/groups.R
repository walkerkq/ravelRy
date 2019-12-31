#' Search groups
#'
#' This function retrieves groups based on search terms.
#'
#' @param query search string
#' @param page result page to retrieve; defaults to first page
#' @param page_size number of results to retrieve; defaults to 50
#' @param sort options: `best`, `added`, `favorites`
#'
#' @return tibble
#'
#' @export
#'
search_groups <- function(query, page = NULL, page_size = NULL, sort = NULL){

  response <- ravelry_get(path = '/groups/search.json',
                          query = list(query = query,
                                       page = page,
                                       page_size = page_size,
                                       sort = sort))

  fromJSONtoTibble(response)

}
