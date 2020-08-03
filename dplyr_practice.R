chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago)

subset <- select(chicago, city:dptp)
str(subset)
subset <- select(chicago, ends_with("2"))
str(subset)

chic.f <- filter(chicago, pm25tmean2 > 30)
str(chic.f)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)

chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)
chicago <- arrange(chicago, desc(date))

chicago <- rename(chicago, dewpont = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(chicago)


chicago <- mutate(chicago, year = as.POSIXlt(date)$year+1900)
head(chicago)
years <- group_by(chicago, year)
qq <- quantile(chicago$pm25, seq(0, 1, 0.2), na.rm = TRUE)
chicago <- mutate(chicago, pm25.quint = cut(pm25, qq))
quint <- group_by(chicago, pm25.quint)
summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE),
          no2 = mean(no2tmean2, na.rm = TRUE))

mutate(chicago, pm25.quint = cut (pm25, qq)) %>% 
    group_by(pm25.quint) %>%
    summarize(o3 = mean(o3tmean2, na.rm = T),
              no2 = mean(no2tmean2, na.rm = T))
