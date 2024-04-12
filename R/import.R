library(googledrive)
library(yaml)
library(dplyr)
library(readr)
library(here)

sheet <- drive_download(as_id("12HDbqfXia6gq4koKHf6DGgOgWGkq_hl8o6iJxIG4Ucw"),
  here("data", "raw.csv"))

apps <- read_csv(here("data", "raw.csv"))

apps |> 
  select(url, org, title, thumbnail) |> 
  write_yaml(here("apps.yml"), column.major = FALSE)
