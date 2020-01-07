#' Get or set basic authentication credentials
#'
#' The API wrapper functions in this package rely on basic authentication via username
#' and password residing in the environment variables \code{RAVELRY_USERNAME} and
#' \code{RAVELRY_PASSWORD}. The easiest way to accomplish this is to set it in
#' the `\code{.Renviron}` file in your home directory. If you do not have these
#' credentials, you can create them at https://www.ravelry.com/pro/developer.
#'
#' @param key the variable to set - either username or password
#' @param overwrite overwrite the existing variable in the current environment?
#'
#' @return atomic character vector containing the username or password credential
#'
#' @export

ravelry_auth <- function(key = 'username', overwrite = FALSE) {

  if(key == 'username'){
    var = 'RAVELRY_USERNAME'
  } else if(key == 'password'){
    var = 'RAVELRY_PASSWORD'
  } else {
    stop('Please set key to either username or password.')
  }

  token <- Sys.getenv(var)

  if(!identical(token, "") & !overwrite) return(token)

  if(!interactive()) {
    stop(paste0("Please set env var ", var, " to your Ravelry API credential."),
         call. = FALSE)
  }

  message(paste0("Couldn't find env var ", var, "."))
  message("Please enter your Ravelry API credential and press enter:")
  entered_token <- readline(": ")

  if (identical(entered_token, "")) {
    stop("Ravelry API credential entry failed", call. = FALSE)
  }

  message(paste0("Updating ", var, " env var to ", entered_token))

  if(key == 'username'){
    Sys.setenv('RAVELRY_USERNAME' = entered_token)
  } else if(key == 'password'){
    Sys.setenv('RAVELRY_PASSWORD' = entered_token)
  }

  entered_token

}
