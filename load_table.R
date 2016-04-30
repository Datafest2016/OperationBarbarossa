install.packages('data.table')
purchase <- data.table::fread('data/approved_data_purchase-v5.csv')
behavior <- data.table::fread('data/approved_ga_data_v2.csv')
ad <- data.table::fread('data/approved_adwords_v3.csv')