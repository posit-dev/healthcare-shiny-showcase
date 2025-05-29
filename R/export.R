# Run to propogate changes made on GitHub back to Google Doc

library(googledrive)
library(yaml)
library(dplyr)
library(readr)
library(purrr)
library(stringr)
library(tibble)
library(tidyr)
library(here)

sheet <- drive_update(
  as_id("12HDbqfXia6gq4koKHf6DGgOgWGkq_hl8o6iJxIG4Ucw"),
  here("data", "raw.csv")
)
