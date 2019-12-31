#' Basic API call
#'
#' This function is the base GET call to the Ravelry API.
#'
#' @param path the API method to call
#' @param query call parameters in the form of a list()
#'
#' @return API object
#'
#' @import httr
#'
#' @export
#'
ravelry_get <- function(path, query = NULL) {

  url <- modify_url(url = api_url, path = path, query = query)

  response <- GET(url,
                  authenticate(
                    Sys.getenv('RAVELRY_USERNAME'),
                    Sys.getenv('RAVELRY_PASSWORD')
                  )
  )

  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  } else if(response$status_code != 200) {
    stop(paste0("API returned status ", response$headers$status), call. = FALSE)
  }

  response

}


