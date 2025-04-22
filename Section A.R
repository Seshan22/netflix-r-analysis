# 1. Total records
nrow(netflix_titles)

# 2. Percentage Movies vs. TV Shows
netflix_titles %>%
  count(type) %>%
  mutate(percent = round(n / sum(n) * 100, 2))

# 3. Top 5 most common content ratings
netflix_titles %>%
  count(rating, sort = TRUE) %>%
  slice_head(n = 5)

# 4. Rows with missing data and most missing columns
sum(!complete.cases(netflix_titles))
colSums(is.na(netflix_titles)) %>% sort(decreasing = TRUE)

# 5. Unique countries represented
netflix_titles %>%
  filter(!is.na(country)) %>%
  separate_rows(country, sep = ", ") %>%
  distinct(country) %>%
  nrow()
