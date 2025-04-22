# 13. Top 10 genres
netflix %>%
  separate_rows(listed_in, sep = ", ") %>%
  count(listed_in, sort = TRUE) %>%
  slice_head(n = 10)

# 14. Top 10 content-producing countries
netflix %>%
  separate_rows(country, sep = ", ") %>%
  count(country, sort = TRUE) %>%
  slice_head(n = 10)

# 15. Top 5 genres for TV Shows vs. Movies
netflix %>%
  separate_rows(listed_in, sep = ", ") %>%
  group_by(type, listed_in) %>%
  summarise(count = n(), .groups = "drop") %>%
  arrange(type, desc(count)) %>%
  group_by(type) %>%
  slice_head(n = 5)
