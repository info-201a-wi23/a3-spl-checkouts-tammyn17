library("dplyr")
library("stringr")

spl_data <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# How many digital copies vs hard copies were checked out and what is the difference?
digital_copies <- spl_data %>% 
  filter(UsageClass == "Digital", str_detect(Subjects, "Mystery")) %>% 
  summarize(total_d_checkouts = sum(Checkouts)) %>% 
  pull(total_d_checkouts)

hard_copies <- spl_data %>%
  filter(UsageClass == "Physical", str_detect(Subjects, "Mystery")) %>% 
  summarize(total_h_checkouts = sum(Checkouts)) %>% 
  pull(total_h_checkouts)

difference_copies <- digital_copies - hard_copies

# What form of digital copies were checked out most?
form_of_most_copies <- spl_data %>% 
  filter(UsageClass == "Digital", str_detect(Subjects, "Mystery")) %>% 
  group_by(MaterialType) %>% 
  summarize(type_checkouts = sum(Checkouts)) %>% 
  filter(type_checkouts == max(type_checkouts)) %>% 
  pull(MaterialType)

# What form of digital copies were checked out the least?
form_of_least_copies <- spl_data %>% 
  filter(UsageClass == "Digital", str_detect(Subjects, "Mystery")) %>% 
  group_by(MaterialType) %>% 
  summarize(type_checkouts = sum(Checkouts)) %>% 
  filter(type_checkouts == min(type_checkouts)) %>% 
  pull(MaterialType)

# What author was checked out the most with digital?
top_author <- spl_data %>% 
  filter(UsageClass == "Digital", str_detect(Subjects, "Mystery")) %>% 
  group_by(Creator) %>% 
  summarize(author_checkouts = sum(Checkouts)) %>% 
  filter(author_checkouts == max(author_checkouts)) %>% 
  pull(Creator)

# What month had the most checkouts for digital?
most_month <- spl_data %>% 
  filter(UsageClass == "Digital", str_detect(Subjects, "Mystery")) %>% 
  group_by(CheckoutMonth) %>% 
  summarize(date_checkouts = sum(Checkouts)) %>% 
  filter(date_checkouts == max(date_checkouts)) %>% 
  pull(CheckoutMonth) %>% 
  month.name[.]

