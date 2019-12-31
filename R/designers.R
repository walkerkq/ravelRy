#' Get details for a designer
#'
#' This function retrieves details for a designer using their id.
#'
#' @param id designer id
#'
#' @return tibble
#'
#' @export
#'
get_designer <- function(id){

  response <- ravelry_get(path = paste0('/designers/', id, '.json'))

  fromJSONtoTibble(response)

}
