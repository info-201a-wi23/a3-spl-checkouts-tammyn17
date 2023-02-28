library("ggplot2")
library("dplyr")
library("stringr")

spl_data <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# show the trends of checked out mystery books every month
mystery_3_data <- spl_data %>% 
  filter(str_detect(Subjects, "Mystery")) %>% 
  group_by(CheckoutMonth)

  ggplot(mystery_3_data) +
    geom_point(aes(x = CheckoutMonth,
                   y = Checkouts,
                   color = UsageClass)) +
    labs(title = "Mystery Books Checked Out Each Month",
         x = "Checkout Month",
         y = "Checkouts",
         color = "Usage Class") +
  scale_x_continuous(breaks = seq(1, 12))
  
  
 