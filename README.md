
# ravelRy <img src="man/figures/ravelRy_hex.png" width="160px" align="right" />

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/walkerkq/ravelRy.svg?branch=master)](https://travis-ci.org/walkerkq/ravelRy)
<!-- badges: end -->

ravelRy is an R package that provides access to the [Ravelry
API](https://www.ravelry.com/groups/ravelry-api).

[Ravelry](https://www.ravelry.com/about) describes itself as *a place
for knitters, crocheters, designers, spinners, weavers and dyers to keep
track of their yarn, tools, project and pattern information, and look to
others for ideas and inspiration.*

Hex sticker yarn icon by
[Eucalyp](https://www.flaticon.com/authors/eucalyp) via Flaticon.

## Installation

You can install the development version of ravelRy from Github:

``` r
devtools::install_github("walkerkq/ravelRy")
```

Or the release via CRAN:

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
# you will be prompted to enter your username via the console

ravelry_auth(key = 'password') 
# you will be prompted to enter your password via the console
```

### An example

Retrieve a list of free patterns for baby hats.

``` r
library(ravelRy)

search_results <- search_patterns(query = 'hat', page_size = 5, availability = 'free', fit = 'baby')
str(search_results, max.level = 1)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    5 obs. of  7 variables:
#>  $ free           : logi  TRUE TRUE TRUE TRUE TRUE
#>  $ id             : int  124400 464893 528611 899479 585110
#>  $ name           : chr  "Sockhead Slouch Hat" "Garter Ear Flap Hat" "Classic Cuffed Hat" "Classic Ribbed Hat" ...
#>  $ permalink      : chr  "sockhead-slouch-hat" "garter-ear-flap-hat" "classic-cuffed-hat" "classic-ribbed-hat-5" ...
#>  $ designer.id    : int  21767 40686 40686 40686 82906
#>  $ designer.name  : chr  "Kelly McClure" "Purl Soho" "Purl Soho" "Purl Soho" ...
#>  $ pattern_sources:List of 5
```

Get pattern details for those ids.

``` r
patterns <- get_patterns(ids = search_results$id)
str(patterns, max.level = 1)
#> 'data.frame':    5 obs. of  50 variables:
#>  $ comments_count         : int  7 27 82 91 156
#>  $ created_at             : chr  "2019/01/30 11:17:12 -0500" "2014/10/22 11:12:42 -0400" "2015/06/08 18:09:27 -0400" "2014/01/23 11:39:14 -0500" ...
#>  $ currency               : chr  "USD" "USD" "" "USD" ...
#>  $ difficulty_average     : num  1.9 1.84 2.21 2.41 1.53
#>  $ difficulty_count       : int  193 1190 760 2490 4974
#>  $ downloadable           : logi  TRUE TRUE TRUE TRUE TRUE
#>  $ favorites_count        : int  6703 28706 16020 46680 44945
#>  $ free                   : logi  TRUE TRUE TRUE TRUE TRUE
#>  $ gauge                  : num  32 20 20 4.25 32
#>  $ gauge_divisor          : int  4 4 4 1 4
#>  $ gauge_pattern          : chr  "1x1 Rib" "stockinette" "stockinette stitch" "garter stitch" ...
#>  $ generally_available    : chr  "2019/01/01 00:00:00 -0500" "2014/10/01 00:00:00 -0400" "2015/06/01 00:00:00 -0400" "2014/01/01 00:00:00 -0500" ...
#>  $ id                     : int  899479 528611 585110 464893 124400
#>  $ name                   : chr  "Classic Ribbed Hat" "Classic Cuffed Hat" "Quick Ombré Hat" "Garter Ear Flap Hat" ...
#>  $ pdf_url                : chr  "" "" "" "https://www.purlsoho.com/create/wp-content/uploads/2014/01/Purl_Bee_Garter_Ear_Flap_Hats.pdf" ...
#>  $ permalink              : chr  "classic-ribbed-hat-5" "classic-cuffed-hat" "quick-ombre-hat" "garter-ear-flap-hat" ...
#>  $ price                  : chr  "" "" "" "" ...
#>  $ projects_count         : int  807 5808 2874 10025 22135
#>  $ published              : chr  "2019/01/01" "2014/10/01" "2015/06/01" "2014/01/01" ...
#>  $ queued_projects_count  : int  889 4021 2207 7008 8955
#>  $ rating_average         : num  4.82 4.65 4.65 4.62 4.65
#>  $ rating_count           : int  193 1194 777 2520 4870
#>  $ row_gauge              : num  33 28 26 8 46
#>  $ updated_at             : chr  "2019/01/30 11:33:37 -0500" "2019/11/22 11:09:26 -0500" "2019/02/18 22:56:45 -0500" "2019/04/18 14:10:08 -0400" ...
#>  $ url                    : chr  "https://www.purlsoho.com/create/2019/01/30/classic-ribbed-hat/" "http://www.purlsoho.com/create/2014/10/22/classic-cuffed-hat/" "" "https://www.purlsoho.com/create/2014/01/23/lauras-loop-garter-ear-flap-hat/" ...
#>  $ yardage                : int  94 164 50 60 155
#>  $ yardage_max            : int  264 328 200 160 415
#>  $ personal_attributes    : chr  "" "" "" "" ...
#>  $ sizes_available        : chr  "Baby (Kid, Adult Small, Adult Medium, Adult Large)" "Three Sizes: Baby (Kid, Adult)" "Preemie 4-5lbs, Preemie 5-6lbs, Newborn, Baby 3-6months, Baby 6-12 months, Toddler, Child, Adult woman, Adult man" "Baby, Toddler, Kid, Adult Small, Adult Medium, Adult Large" ...
#>  $ product_id             : chr  "" "" "277047" "" ...
#>  $ currency_symbol        : chr  "$" "$" "" "$" ...
#>  $ ravelry_download       : logi  FALSE FALSE TRUE FALSE TRUE
#>  $ download_location      :List of 5
#>  $ pdf_in_library         : logi  FALSE FALSE FALSE FALSE FALSE
#>  $ volumes_in_library     : chr  "" "" "" "" ...
#>  $ gauge_description      : chr  "32 stitches and 33 rows = 4 inches in 1x1 Rib" "20 stitches and 28 rows = 4 inches in stockinette" "20 stitches and 26 rows = 4 inches in stockinette stitch" "4.25 stitches and 8 rows = 1 inch in garter stitch" ...
#>  $ yarn_weight_description: chr  "DK (11 wpi)" "Worsted (9 wpi)" "Worsted (9 wpi)" "Aran (8 wpi)" ...
#>  $ yardage_description    : chr  "94 - 264 yards" "164 - 328 yards" "50 - 200 yards" "60 - 160 yards" ...
#>  $ pattern_needle_sizes   :List of 5
#>  $ notes_html             : chr  "\n<p>MATERIALS</p>\n\n<ul>\n<li>1 (1, 1, 1, 2) skein(s) of Purl Soho’s <a href=\"https://www.purlsoho.com/cashm"| __truncated__ "\n<p>MATERIALS</p>\n\n<ul>\n<li>Hat with pom pom: 1 (2, 2) skeins of Purl Soho’s Worsted Twist, 100% merino. We"| __truncated__ "\n<p>This pattern uses stranded color work and changes gradually from one color to the next.</p>\n" "\n<p>MATERIALS</p>\n\n<ul>\n<li>1 (1, 1, 1, 2, 2) skein(s) of Purl Soho’s Alpaca Pure, 100% alpaca. We used the"| __truncated__ ...
#>  $ notes                  : chr  "MATERIALS\r\n\r\n- 1 (1, 1, 1, 2) skein(s) of Purl Soho’s [Cashmere Merino Bloom][1], 75% extra fine merino and"| __truncated__ "MATERIALS\r\n- Hat with pom pom: 1 (2, 2) skeins of Purl Soho’s Worsted Twist, 100% merino. We used all of our "| __truncated__ "This pattern uses stranded color work and changes gradually from one color to the next.\r\n" "MATERIALS\r\n\r\n- 1 (1, 1, 1, 2, 2) skein(s) of Purl Soho's Alpaca Pure, 100% alpaca. We used the colors Heirl"| __truncated__ ...
#>  $ packs                  :List of 5
#>  $ printings              :List of 5
#>  $ yarn_weight            :List of 5
#>  $ craft                  :List of 5
#>  $ pattern_categories     :List of 5
#>  $ pattern_attributes     :List of 5
#>  $ pattern_author         :List of 5
#>  $ photos                 :List of 5
#>  $ pattern_type           :List of 5
```

More examples can be found
[here](https://github.com/walkerkq/ravelRy/tree/master/man/example_files/example_eda.md).
