library(googledrive)
library(yaml)
library(dplyr)
library(readr)
library(purrr)
library(stringr)
library(tibble)
library(tidyr)
library(here)

sheet <- drive_download(
  as_id("12HDbqfXia6gq4koKHf6DGgOgWGkq_hl8o6iJxIG4Ucw"),
  here("data", "raw.csv"),
  overwrite = TRUE
)

apps <- read_csv(here("data", "raw.csv")) |>
  mutate(category = str_to_title(category))

# fmt: skip
cat_order <- tribble(
  ~ category     , ~ order, 
  "Informatics"  ,       3,
  "Medicine"     ,       1,
  "Pharma"       ,       4,
  "Public Health",       2
)

apps |>
  arrange(order) |>
  group_by(category) |>
  nest(.key = "tiles") |>
  left_join(cat_order) |>
  arrange(order) |>
  modify_in(.where = "tiles", .f = \(x) map(x, transpose)) |>
  transpose() |>
  write_yaml(here("apps.yml"), indent.mapping.sequence = TRUE)
