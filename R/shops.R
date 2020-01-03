#' Search shops
#'
#' This function retrieves shops based on search terms.
#'
#' @param query search string
#' @param shop_type_id set to 1 to restrict to local stores only (filter out chains and online stores)
#' @param lat latitude for geographic search
#' @param lng longitude for geographic search
#' @param radius radius for geographic search
#' @param units units for geographic search, `miles` or `km`
#' @param page result page to retrieve; defaults to 1
#' @param page_size number of results to retrieve; defaults to 100
#' @param sort options: `best`, `added`, `favorites`
#'
#' @return tibble with address, social media, and other descriptive features for shops
#'
#' @examples \dontrun{search_shops(lat = 42.35, lng = -71.05, radius = 100)}
#'
#' @import dplyr
#'
#' @export
#'
search_shops <- function(query = NULL,
                         shop_type_id = NULL,
                         lat = NULL,
                         lng = NULL,
                         radius = NULL,
                         units = NULL,
                         page = NULL,
                         page_size = NULL,
                         sort = NULL){

  response <- ravelry_get(path = '/shops/search.json',
                          query = list(query = query,
                                       shop_type_id = shop_type_id,
                                       lat = lat,
                                       lng = lng,
                                       radius = radius,
                                       units = units,
                                       page = page,
                                       page_size = page_size,
                                       sort = sort))

  response_tibble <- fromJSONtoTibble(response)

  response_tibble %>%
    select(-.data$state.id, -.data$country.id)

}

#' Get details for a shop
#'
#' This function retrieves details for a shop using its id.
#'
#' @param id shop id
#'
#' @return tibble containing shop info including address, contact info, and other descriptive variables.
#'
#' @examples \dontrun{get_shop(id = 1781)}
#'
#' @export
#'
get_shop <- function(id){

  response <- ravelry_get(path = paste0('/shops/', id, '.json'))

  fromJSONtoTibble(response)

}

