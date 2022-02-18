rmarkdown::render("QAPP_Plots.Rmd")


newdata %>% filter(CHARACTERISTIC_NAME=="TEMPERATURE",
                   DATA_PROVIDER=="LCI") %>% 
  filter(substr(SAMPLE_DATE,1,4)=='2021') %>% 
  select(SAMPLE_DATE) %>% distinct()

junk<-lci %>% select(param,RSLT_RESULT_SAMPLE_FRACTION) %>% distinct()
write.csv(junk,file="junk.fractions.csv",row.names=FALSE)


rmarkdown::render("Budget_and_QAPP_Plots.Rmd")

junk<-newdata %>% 
  filter(DATA_PROVIDER=="LCI",
         substr(SAMPLE_DATE,1,4)=="2021",INFORMATION_TYPE %in% c('OW','BS')) %>% 
  select(LAKE_HISTORY_ID,LOCATION_HISTORY_ID,INFORMATION_TYPE) %>% distinct()


junk<-newdata %>% 
  filter(DATA_PROVIDER=="LCI",SAMPLE_TYPE=="WATER COLUMN",
                         INFORMATION_TYPE %in% c("OW","BS"),
         substr(SAMPLE_DATE,1,4)=="2021") %>% 
  select(LOCATION_HISTORY_ID,SAMPLE_DATE) %>% distinct()

newdata %>% filter(DATA_PROVIDER=="CSL",SAMPLE_TYPE=="WATER COLUMN",substr(SAMPLE_DATE,1,4)=="2020") %>% 
  select(CHARACTERISTIC_NAME) %>% distinct() %>% arrange(CHARACTERISTIC_NAME)
