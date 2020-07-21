pollutantmean <- function(directory, pollutant, id=1:332) {
    sum_v <- 0;
    cnt <- 0;
    
    for(n in id) {
        filename <- paste(sprintf("%03d", n), ".csv", sep="")
        fp <- paste(directory, filename, sep="/")
        df <- read.csv(fp)
        df2 <- df[complete.cases(df), ]
        sum_v <- sum_v + sum(df2[pollutant])
        cnt <- cnt + dim(df2[pollutant])[[1]]
    }
    
    sum_v/cnt;
}
