library(magrittr)
magick::image_read(here::here("logo", "tsukubar-logo-square2-772x800.png")) %>%
  magick::image_scale("32x32") %>%
  magick::image_write("favicon.ico", format = "png")

sessionInfo()
# R version 3.5.1 (2018-07-02)
# Platform: x86_64-pc-linux-gnu (64-bit)
# Running under: Debian GNU/Linux 9 (stretch)
# 
# Matrix products: default
# BLAS: /usr/lib/openblas-base/libblas.so.3
# LAPACK: /usr/lib/libopenblasp-r0.2.19.so
# 
# locale:
#   [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C               LC_TIME=en_US.UTF-8       
# [4] LC_COLLATE=en_US.UTF-8     LC_MONETARY=en_US.UTF-8    LC_MESSAGES=C             
# [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                  LC_ADDRESS=C              
# [10] LC_TELEPHONE=C             LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
# 
# attached base packages:
#   [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#   [1] magrittr_1.5
# 
# loaded via a namespace (and not attached):
#   [1] compiler_3.5.1  backports_1.1.2 here_0.1        rprojroot_1.3-2 magick_1.9      tools_3.5.1    
# [7] curl_3.2        yaml_2.2.0      Rcpp_0.12.18    knitr_1.20   
