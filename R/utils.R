ua <- httr::user_agent("http://github.com/walkerkq/ravelRy")
api_url <- "https://api.ravelry.com/"

fromJSONtoTibble <- function(json, level = 1) {

  df <- jsonlite::fromJSON(content(json, type = 'text', encoding = 'utf-8'))

  # some methods nest the content deeper than others
  if(level == 2) {
    df <- df[[1]][[1]]
  } else {
    df <- df[[1]]
  }

  list_df <- purrr::map_if(df, is.data.frame, list)

  tb <- tibble::as_tibble(list_df, validate = FALSE)

  tb

}
