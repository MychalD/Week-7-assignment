library(tidyverse)
library(dplyr)
library(usethis)


#Data comes from: https://data.cms.gov/medicare-shared-savings-program/performance-year-financial-and-quality-results/data
acopuf<- read.csv(file = "Performance_Year_Financial_and_Quality_Results_2020.csv")


aco_pivot_longer <- acopuf %>% 
                  select(contains(c("ACO"))) %>% 
                  mutate(ACO1 = na_if(ACO1,"^")) %>% 
                  mutate(ACO2 = na_if(ACO2,"^")) %>% 
                  mutate(ACO3 = na_if(ACO3,"^")) %>% 
                  mutate(ACO4 = na_if(ACO4,"^")) %>% 
                  mutate(ACO5 = na_if(ACO5,"^")) %>% 
                  mutate(ACO6 = na_if(ACO6,"^")) %>% 
                  mutate(ACO7 = na_if(ACO7,"^")) %>% 
                  mutate(ACO34 = na_if(ACO34,"^")) %>% 
                  mutate(ACO45 = na_if(ACO45,"^")) %>% 
                  mutate(ACO46 = na_if(ACO46,"^")) %>% 
                  mutate(ACO8 = na_if(ACO8,"~")) %>% 
                  mutate(ACO38 = na_if(ACO38,"~")) %>% 
  mutate(ACO1 = replace_na(ACO1, 0)) %>% 
  mutate(ACO2 = replace_na(ACO2,0)) %>% 
  mutate(ACO3 = replace_na(ACO3,0)) %>% 
  mutate(ACO4 = replace_na(ACO4,0)) %>% 
  mutate(ACO5 = replace_na(ACO5,0)) %>% 
  mutate(ACO6 = replace_na(ACO6,0)) %>% 
  mutate(ACO7 = replace_na(ACO7,0)) %>% 
  mutate(ACO34 = replace_na(ACO34,0)) %>% 
  mutate(ACO45 = replace_na(ACO45,0)) %>% 
  mutate(ACO46 = replace_na(ACO46,0)) %>% 
  mutate(ACO8 = replace_na(ACO8,0)) %>% 
  mutate(ACO38 = replace_na(ACO38,0)) %>% 
                  pivot_longer(cols = - c("ACO_ID","ACO_Name","ACO_State"),
                               names_to = "ACO_Measures",
                               values_to = "Scores")