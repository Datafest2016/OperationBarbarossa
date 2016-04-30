library('dplyr')
library(plyr)
user_keywords = purchase %>% filter(!grepl('Parking|parking',primary_act_name))%>% 
  group_by(purch_party_lkup_id) %>% distinct(primary_act_name) %>%
  summarise(keywords=paste(c(primary_act_name),collapse=","),event_num=n())

names(user_keywords) = c('id','keywords','num_events')
user_keywords$id = as.factor(user_keywords$id)
old_levels = levels(user_keywords$id)
user_keywords$id=mapvalues(user_keywords$id, from = old_levels, to = seq(1,length(old_levels)))
