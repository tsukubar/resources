library(gganimate)
library(dplyr)

# 1/3 Logo Part --------------------------------------------------------------------
df_text <- 
  tibble::data_frame(
    x = c(1:7, 7.7, 8.4),
    y = 1,
    text = c("T", "s", "u", "k", "u", "b", "a", ".", "R"),
    l = letters[1:9]
  )

p_tkbr_logo <- 
  ggplot() +
  geom_text(data = df_text, 
            aes(x, y, label = text),
            size = 24, family = "times", color = "white", fontface = "bold") +
  xlim(0.5, 9.5) +
  transition_reveal(l, x, keep_last = TRUE) +
  theme_void() +
  theme(plot.background = element_rect(fill = "#54447B"))

animate(p_tkbr_logo, fps = 20, nframes = 180, width = 1024, height = 205,
        renderer = gifski_renderer(loop = FALSE, 
                                   file = "tsukubar_logo.gif"))


# 2/3 Mountain Part ----------------------------------------------------------------
d <- 
  data.frame(x = c(1, 3, 5, 4.2, 5.4, 9),
           y = c(1, 3, 2.2, 2.2, 3.2, 1),
           g = as.character(c(1, 1, 1, 2, 2, 2)))

d2 <- 
  data.frame(
  x = c(1, 5.6),
  y = c(0.6, 0.6),
  g = as.character(c(1, 1))
)
d3 <- 
  data.frame(
  x = c(9, 3),
  y = c(0, 0),
  g = as.character(c(1, 1))
)

p_tkbm_animate <- 
  ggplot(data = d, aes(x, y, group = g)) +
  geom_line(size = 4.8, color = "#54447B") +
  geom_line(data = d2, aes(x, y, group = g), 
            size = 4.8, color = "#54447B") +
  geom_line(data = d3, aes(x, y, group = g), 
            size = 4.8, color = "#54447B") +
  guides(size = FALSE, fill = FALSE) +
  xlim(0.5, 9.5) +
  ylim(-0.4, 3.4) +
  enter_grow() +
  exit_shrink() +
  ease_aes("quintic-in-out") +
  transition_reveal(1, x) +
  theme_void()

animate(p_tkbm_animate, fps = 20, nframes = 180, width = 1024, height = 328,
        renderer = gifski_renderer(loop = FALSE, 
                                   file = "tsukubar_logo-mount.gif"))


# 3/3 Combine images -----------------------------------------------------------------
library(magick)
a_mgif <- 
  image_read("tsukubar_logo.gif")
b_mgif <- 
  image_read("tsukubar_logo-mount.gif")

new_gif <- 
  image_append(c(a_mgif[1], b_mgif[1]), stack = TRUE)
for (i in 1:180) {
  combined <- image_append(c(a_mgif[i], b_mgif[i]), stack = TRUE)
  new_gif <- c(new_gif, combined)
}

magick::image_write(new_gif, path = here::here("logo", "logo-animation.gif"))

unlink("tsukubar_logo.gif")
unlink("tsukubar_logo-mount.gif")

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
#   [1] magick_1.9           bindrcpp_0.2.2       dplyr_0.7.6          gganimate_0.9.9.9999
# [5] ggplot2_3.0.0.9000  
# 
# loaded via a namespace (and not attached):
#   [1] Rcpp_0.12.18      pillar_1.3.0      compiler_3.5.1    plyr_1.8.4        bindr_0.1.1      
# [6] prettyunits_1.0.2 tools_3.5.1       progress_1.2.0    tibble_1.4.2      gtable_0.2.0     
# [11] pkgconfig_2.0.2   png_0.1-7         rlang_0.2.2       rstudioapi_0.7    yaml_2.2.0       
# [16] withr_2.1.2       knitr_1.20        hms_0.4.2         grid_3.5.1        tidyselect_0.2.4 
# [21] glue_1.3.0        R6_2.2.2          gifski_0.8.6      purrr_0.2.5       tweenr_1.0.0     
# [26] farver_1.0        magrittr_1.5      scales_1.0.0      assertthat_0.2.0  colorspace_1.3-2 
# [31] labeling_0.3      stringi_1.2.4     lazyeval_0.2.1    munsell_0.5.0     crayon_1.3.4     
