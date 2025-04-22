# 10. Histogram of title lengths
ggplot(netflix, aes(x = title_length)) +
  geom_histogram(binwidth = 5, fill = "lightgreen", color = "black") +
  labs(title = "Histogram of Title Lengths", x = "Title Length", y = "Count")

# 11. Bar plot of top 5 most common ratings
netflix %>%
  count(rating, sort = TRUE) %>%
  slice_head(n = 5) %>%
  ggplot(aes(x = reorder(rating, -n), y = n, fill = rating)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 5 Most Common Ratings", x = "Rating", y = "Count") +
  theme_minimal()

# 12. Titles released each year
netflix %>%
  filter(!is.na(release_year)) %>%
  count(release_year) %>%
  ggplot(aes(x = release_year, y = n)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Number of Titles Released Each Year", x = "Year", y = "Count") +
  theme_minimal()
