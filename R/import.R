library(googledrive)
library(googlesheets4)
library(yaml)
library(dplyr)
library(here)

apps <- drive_get(id = as_id("12HDbqfXia6gq4koKHf6DGgOgWGkq_hl8o6iJxIG4Ucw")) |> 
  read_sheet() 

apps |> 
  select(url = Application, org = Organization, title = Project) |> 
  write_yaml(here("apps.yml"), column.major = FALSE)
