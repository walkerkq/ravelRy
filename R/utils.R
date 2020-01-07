fromJSONtoTibble <- function(response, deep = FALSE) {

  df <- jsonlite::fromJSON(
    gsub(':null', ':\"\"',
         httr::content(response, as = 'text', encoding = 'utf-8')
         ),
    flatten = TRUE)[[1]]

  # handle JSON repsonses where the list is nested under id values
  if(deep == TRUE) {

    response_tibble <- tibble::tibble(.rows=length(df))

    for(l in 1:length(df)) {

      tibble_row <- df[[l]] %>%
        purrr::map_if(purrr::is_list, as_tibble) %>%
        purrr::map_if(tibble::is_tibble, list) %>%
        tibble::as_tibble()

      if(l == 1){
        response_tibble <- rbind(response_tibble, tibble_row)
      } else {
        # handle responses missing columns with an full outer merge
        response_tibble <- merge(response_tibble, tibble_row, all = TRUE)
      }

    }

  } else {

    response_tibble <- tibble::as_tibble(df)

  }

  response_tibble

}
