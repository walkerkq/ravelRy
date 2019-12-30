
# ravelRy <img src="man/figures/ravelRy_hex.png" width="160px" align="right" />

ravelRy is an R package that provides access to the [Ravelry
API](https://www.ravelry.com/groups/ravelry-api).

[Ravelry](https://www.ravelry.com/about) describes itself as *a place
for knitters, crocheters, designers, spinners, weavers and dyers to keep
track of their yarn, tools, project and pattern information, and look to
others for ideas and inspiration.*

Hex sticker yarn icon by
[Eucalyp](https://www.flaticon.com/authors/eucalyp) via Flaticon.

## Installation

You can install the released version of ravelRy from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ravelRy")
```

## Getting started

1.  Set up a Ravelry developer account at
    <https://www.ravelry.com/pro/developer>.  
2.  Create an app with basic authentication: read only access.  
3.  Set `RAVELRY_USERNAME` and `RAVELRY_PASSWORD` in your .renviron file
    or via the console with the `ravelry_auth()` function.

<!-- end list -->

``` r
library(ravelRy)

ravelry_auth(key = 'username')
ravelry_auth(key = 'password')
```
