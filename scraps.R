rmarkdown::render("QAPP_Plots.Rmd")


newdata %>% filter(CHARACTERISTIC_NAME=="TEMPERATURE",
                   DATA_PROVIDER=="LCI") %>% 
  filter(substr(SAMPLE_DATE,1,4)=='2021') %>% 
  select(SAMPLE_DATE) %>% distinct()

junk<-lci %>% select(param,RSLT_RESULT_SAMPLE_FRACTION) %>% distinct()
write.csv(junk,file="junk.fractions.csv",row.names=FALSE)


rmarkdown::render("QAPP_Plots.Rmd")

junk<-newdata %>% 
  filter(DATA_PROVIDER=="LCI",
         substr(SAMPLE_DATE,1,4)=="2021",INFORMATION_TYPE %in% c('OW','BS')) %>% 
  select(LAKE_HISTORY_ID,LOCATION_HISTORY_ID,INFORMATION_TYPE) %>% distinct()
