library(dplyr)
library(dplyr)
library(jsonlite)
library(httr)
library(rlist)
library(readxl)

pp <- read.csv("150kplus/PPP Data 150k plus.csv")
ca_ppp <- filter(ppp, NonProfit != "Y" & State == "CA") %>% select(LoanRange:BusinessType, JobsRetained)

ca_ppp <- arrange(ca_ppp, JobsRetained)

naics <- read_xlsx("150kplus/6-digit_2017_Codes.xlsx", 1)
naics <- naics[,1:2]
names(naics) <- c("NAICSCode", "Industry")
merged <- inner_join(ca_ppp, naics)
write.csv(merged, "150kplus/merged.csv")
