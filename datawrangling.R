library('plyr')
library('dplyr')
#user_keywords = purchase %>% filter(!grepl('Parking|parking',primary_act_name))%>% 
 # group_by(purch_party_lkup_id) %>% distinct(primary_act_name) %>%
#  summarise(keywords=paste(c(primary_act_name),collapse=","),event_num=n())

user_keywords = purchase %>% filter(!grepl('Parking|parking',primary_act_name))%>% 
  group_by(purch_party_lkup_id,primary_act_name) %>%
  dplyr::summarise(freq=sum(tickets_purchased_qty))

names(user_keywords) = c('user_id','event','tickets')
user_keywords$user_id = as.factor(user_keywords$user_id)
old_levels = levels(user_keywords$user_id)
user_keywords$user_id=mapvalues(user_keywords$user_id, from = old_levels, to = seq(1,length(old_levels)))
user_keywords$event = as.factor(user_keywords$event)
event_levels = levels(user_keywords$event)
user_keywords$event_id=mapvalues(user_keywords$event, from = event_levels, to = seq(1,length(event_levels)))

n_row = user_keywords %>% ungroup() %>% select(user_id) %>% distinct() %>% nrow() 
n_col = user_keywords %>% ungroup() %>% select(event_id) %>% distinct() %>% nrow()

rmatrix  <-  matrix(nrow=n_row, ncol=n_col)

dimnames(rmatrix) <- list(rownames(rmatrix, do.NULL = FALSE, prefix = "row"),
                          colnames(rmatrix, do.NULL = FALSE, prefix = "col"))
