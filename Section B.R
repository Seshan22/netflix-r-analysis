# 6. Count NA values per column using sapply
sapply(netflix, function(x) sum(is.na(x)))

# 7. Add title_length column
netflix <- netflix %>%
  mutate(title_length = nchar(title))

# 8. Longest title and its character count
netflix %>%
  filter(title_length == max(title_length, na.rm = TRUE)) %>%
  select(title, title_length)

# 9. Average title length for Movies vs. TV Shows
netflix %>%
  group_by(type) %>%
  summarise(avg_title_length = mean(title_length, na.rm = TRUE))
