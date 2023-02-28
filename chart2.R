library("ggplot2")
library("dplyr")
library("stringr")

spl_data <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# comparing ebook(most popular) to audio(least popular) with checkouts every month
mystery_2_data <- spl_data %>% 
  filter(MaterialType %in% c("EBOOK", "AUDIOBOOK")) %>% 
  filter(str_detect(Subjects, "Mystery")) %>% 
  group_by(CheckoutMonth, MaterialType) %>% 
  summarize(Checkouts = sum(Checkouts))

ggplot(mystery_2_data) +
  geom_line(aes(x = CheckoutMonth,
                 y = Checkouts,
                 color = MaterialType)) +
  labs(title = "Ebook vs. Audiobook Monthly Checkouts",
       x = "Checkout Month",
       y = "Total Checkouts",
       color = "MaterialType") +
  scale_x_continuous(breaks = seq(1, 12))

