
This package is under
development.

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

### An example

Retrieve a list of free patterns for baby hats.

``` r
library(ravelRy)

search_results <- search_patterns(query = 'hat', page_size = 5, availability = 'free', fit = 'baby')
search_results
#> # A tibble: 5 x 7
#>   free      id name    permalink  designer.id designer.name pattern_sources
#>   <lgl>  <int> <chr>   <chr>            <int> <chr>         <list>         
#> 1 TRUE  991074 Grit B… grit-baby…       98854 Hobbii Design <df[,59] [1 × …
#> 2 TRUE  124400 Sockhe… sockhead-…       21767 Kelly McClure <df[,59] [3 × …
#> 3 TRUE  464893 Garter… garter-ea…       40686 Purl Soho     <df[,59] [1 × …
#> 4 TRUE  528611 Classi… classic-c…       40686 Purl Soho     <df[,59] [2 × …
#> 5 TRUE  585110 Quick … quick-omb…       82906 Emily Dormier <df[,59] [1 × …
```

Learn more about the pattern designer.

``` r
designer_id <- search_results$designer.id[2]

get_designer(id = designer_id)  
#> # A tibble: 1 x 9
#>   crochet_pattern… favorites_count    id knitting_patter… name 
#>              <int>           <int> <int>            <int> <chr>
#> 1               11            1424 21767               85 Kell…
#> # … with 4 more variables: patterns_count <int>, permalink <chr>,
#> #   notes <chr>, notes_html <chr>
```

Get pattern details for those ids.
