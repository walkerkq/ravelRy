
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

You can install the development version of ravelRy from Github with:

``` r
devtools::install_github("walkerkq/ravelRy")
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
#>  $ id             : int  124400 464893 528611 585110 443533
#>  $ name           : chr  "Sockhead Slouch Hat" "Garter Ear Flap Hat" "Classic Cuffed Hat" "Quick Ombré Hat" ...
#>  $ permalink      : chr  "sockhead-slouch-hat" "garter-ear-flap-hat" "classic-cuffed-hat" "quick-ombre-hat" ...
#>  $ designer.id    : int  21767 40686 40686 82906 45502
#>  $ designer.name  : chr  "Kelly McClure" "Purl Soho" "Purl Soho" "Emily Dormier" ...
#>  $ pattern_sources:List of 5
```

Get pattern details for those ids.

``` r
patterns <- get_patterns(ids = search_results$id)
str(patterns, max.level = 1)
#> 'data.frame':    5 obs. of  50 variables:
#>  $ comments_count         : int  23 78 89 156 166
#>  $ created_at             : chr  "2014/10/22 11:12:42 -0400" "2015/06/08 18:09:27 -0400" "2014/01/23 11:39:14 -0500" "2009/05/25 16:17:05 -0400" ...
#>  $ currency               : chr  "USD" "" "USD" "" ...
#>  $ difficulty_average     : num  1.84 2.2 2.41 1.52 2.31
#>  $ difficulty_count       : int  1163 723 2456 4897 3878
#>  $ downloadable           : logi  TRUE TRUE TRUE TRUE TRUE
#>  $ favorites_count        : int  28069 15439 45902 44052 38955
#>  $ free                   : logi  TRUE TRUE TRUE TRUE TRUE
#>  $ gauge                  : num  20 20 4.25 32 18
#>  $ gauge_divisor          : int  4 4 1 4 4
#>  $ gauge_pattern          : chr  "stockinette" "stockinette stitch" "garter stitch" "stockinette stitch  " ...
#>  $ generally_available    : chr  "2014/10/01 00:00:00 -0400" "2015/06/01 00:00:00 -0400" "2014/01/01 00:00:00 -0500" "2009/05/01 00:00:00 -0400" ...
#>  $ id                     : int  528611 585110 464893 124400 443533
#>  $ name                   : chr  "Classic Cuffed Hat" "Quick Ombré Hat" "Garter Ear Flap Hat" "Sockhead Slouch Hat" ...
#>  $ pdf_url                : chr  "" "" "https://www.purlsoho.com/create/wp-content/uploads/2014/01/Purl_Bee_Garter_Ear_Flap_Hats.pdf" "" ...
#>  $ permalink              : chr  "classic-cuffed-hat" "quick-ombre-hat" "garter-ear-flap-hat" "sockhead-slouch-hat" ...
#>  $ price                  : chr  "" "" "" "" ...
#>  $ projects_count         : int  5694 2736 9840 21719 15324
#>  $ published              : chr  "2014/10/01" "2015/06/01" "2014/01/01" "2009/05/01" ...
#>  $ queued_projects_count  : int  3979 2164 6973 8882 7591
#>  $ rating_average         : num  4.65 4.64 4.62 4.65 4.73
#>  $ rating_count           : int  1166 737 2483 4788 3887
#>  $ row_gauge              : num  28 26 8 46 22
#>  $ updated_at             : chr  "2019/11/22 11:09:26 -0500" "2019/02/18 22:56:45 -0500" "2019/04/18 14:10:08 -0400" "2019/12/03 18:34:33 -0500" ...
#>  $ url                    : chr  "http://www.purlsoho.com/create/2014/10/22/classic-cuffed-hat/" "" "https://www.purlsoho.com/create/2014/01/23/lauras-loop-garter-ear-flap-hat/" "http://bohoknits.blogspot.com/2009/05/sockhead-hat.html" ...
#>  $ yardage                : int  164 50 60 155 280
#>  $ yardage_max            : int  328 200 160 415 1800
#>  $ personal_attributes    : chr  "" "" "" "" ...
#>  $ sizes_available        : chr  "Three Sizes: Baby (Kid, Adult)" "Preemie 4-5lbs, Preemie 5-6lbs, Newborn, Baby 3-6months, Baby 6-12 months, Toddler, Child, Adult woman, Adult man" "Baby, Toddler, Kid, Adult Small, Adult Medium, Adult Large" "baby, child, teen, adult small, medium, large, extra-large" ...
#>  $ product_id             : chr  "" "277047" "" "19200" ...
#>  $ currency_symbol        : chr  "$" "" "$" "" ...
#>  $ ravelry_download       : logi  FALSE TRUE FALSE TRUE TRUE
#>  $ download_location      :List of 5
#>  $ pdf_in_library         : logi  FALSE FALSE FALSE FALSE FALSE
#>  $ volumes_in_library     : chr  "" "" "" "" ...
#>  $ gauge_description      : chr  "20 stitches and 28 rows = 4 inches in stockinette" "20 stitches and 26 rows = 4 inches in stockinette stitch" "4.25 stitches and 8 rows = 1 inch in garter stitch" "32 stitches and 46 rows = 4 inches in stockinette stitch  " ...
#>  $ yarn_weight_description: chr  "Worsted (9 wpi)" "Worsted (9 wpi)" "Aran (8 wpi)" "Fingering (14 wpi)" ...
#>  $ yardage_description    : chr  "164 - 328 yards" "50 - 200 yards" "60 - 160 yards" "155 - 415 yards" ...
#>  $ pattern_needle_sizes   :List of 5
#>  $ notes_html             : chr  "\n<p>MATERIALS</p>\n\n<ul>\n<li>Hat with pom pom: 1 (2, 2) skeins of Purl Soho’s Worsted Twist, 100% merino. We"| __truncated__ "\n<p>This pattern uses stranded color work and changes gradually from one color to the next.</p>\n" "\n<p>MATERIALS</p>\n\n<ul>\n<li>1 (1, 1, 1, 2, 2) skein(s) of Purl Soho’s Alpaca Pure, 100% alpaca. We used the"| __truncated__ "\n<p>Version Four (V4) is now available! <strong>#sockheadhat</strong> <br />Also, try the condensed Quick Prin"| __truncated__ ...
#>  $ notes                  : chr  "MATERIALS\r\n- Hat with pom pom: 1 (2, 2) skeins of Purl Soho’s Worsted Twist, 100% merino. We used all of our "| __truncated__ "This pattern uses stranded color work and changes gradually from one color to the next.\r\n" "MATERIALS\r\n\r\n- 1 (1, 1, 1, 2, 2) skein(s) of Purl Soho's Alpaca Pure, 100% alpaca. We used the colors Heirl"| __truncated__ "Version Four (V4) is now available! **#sockheadhat**\r\nAlso, try the condensed Quick Print version - it's only"| __truncated__ ...
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
