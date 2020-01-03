#' Get details for a designer
#'
#' This function retrieves details for a designer using their id.
#'
#' @param id designer id
#'
#' @return tibble with name, notes, count of patterns, etc.
#'
#' @examples \dontrun{get_designer(id = 1)}
#'
#' @export
#'
get_designer <- function(id){

  response <- ravelry_get(path = paste0('/designers/', id, '.json'))

  response_tibble <- fromJSONtoTibble(response)

  response_tibble %>%
    select(-starts_with('users'))

}
