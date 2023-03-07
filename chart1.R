library("ggplot2")
library("dplyr")
library("stringr")

spl_data <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# show the trends of checked out mystery books of 2022 vs 2023
mystery_1_data <- spl_data %>% 
  filter(UsageClass %in% c("Physical", "Digital")) %>% 
  filter(str_detect(Subjects, "Mystery")) %>% 
  group_by(CheckoutYear, UsageClass, .groups = "drop") %>% 
  summarize(Checkouts = sum(Checkouts), .groups = "drop")

ggplot(mystery_1_data) +
  geom_line(aes(x = CheckoutYear,
                y = Checkouts,
                color = UsageClass)) +
  labs(title = "Physical vs. Digital Mystery Checkouts in 22-23",
       x = "Checkout Year",
       y = "Total Checkouts",
       color = "Usage Class") +
  scale_y_continuous(breaks = seq(0, 1000000, by = 50000)) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

