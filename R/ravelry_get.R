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

  url <- httr::modify_url(url = "https://api.ravelry.com/", path = path, query = query)

  # undo encoding of plus signs, which are required for methods returning multiple ids
  url <- gsub('\\%2B', '+', url)

  response <- httr::GET(url,
                        authenticate(
                          Sys.getenv('RAVELRY_USERNAME'),
                          Sys.getenv('RAVELRY_PASSWORD')
                          ),
                        user_agent("http://github.com/walkerkq/ravelRy")
  )

  if (httr::http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  } else if(response$status_code != 200) {
    stop(paste0("API returned status ", response$headers$status), call. = FALSE)
  }

  response

}


