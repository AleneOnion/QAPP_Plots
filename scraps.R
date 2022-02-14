rmarkdown::render("QAPP_Plots.Rmd")


newdata %>% filter(CHARACTERISTIC_NAME=="TEMPERATURE",
                   DATA_PROVIDER=="LCI") %>% 
  filter(substr(SAMPLE_DATE,1,4)=='2021') %>% 
  select(SAMPLE_DATE) %>% distinct()
