install.packages('data.table')
purchase <- data.table::fread('approved_data_purchase-v5.csv')
behavior <- data.table::fread('approved_ga_data_v2.csv')
ad <- data.table::fread('approved_adwords_v3.csv')