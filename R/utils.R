fromJSONtoTibble <- function(json) {

  df <- jsonlite::fromJSON(httr::content(json, as = 'text', encoding = 'utf-8'), flatten = TRUE)

  #list_df <- purrr::map_if(df[[1]], is.data.frame, list)

  tb <- tibble::as_tibble(df[[1]])

  tb

}

# df_cols <- names(df[[1]][[1]])
# df_transformed <- data.table::rbindlist(df, fill = TRUE, use.names = TRUE)
# df_transformed <- df_transformed %>%
#   t() %>%
#   as.data.frame() %>%
#   magrittr::set_colnames(df_cols)

lists_to_modify <- c('min_needle_size', 'yarn_company', 'yarn_weight', 'min_hook_size', 'max_needle_size', 'max_hook_size', #get_yarns
                     'craft', 'pattern_type', 'pattern_author', # get_patterns
                     'country', 'state' # get_shop
)

fromJSONtoTibble_mult <- function(json, level = 1) {

  df <- jsonlite::fromJSON(httr::content(json, as = 'text', encoding = 'utf-8'))

  if(level == 2) {
    df_transformed <- df[[1]][[1]]
    df_transformed[sapply(df_transformed, is.null)] <- NA
    df_transformed <- purrr::modify_at(df_transformed,
                                       lists_to_modify,
                                       function(x) data.frame(matrix(x, nrow = 1, byrow = TRUE)))
  } else {
    df_transformed <- df[[1]]
  }

  list_df <- purrr::map_if(df_transformed, is.data.frame, list)

  tb <- tibble::as_tibble(list_df)

  tb

}
