complete <- function(directory, id=1:332) {
    answer <- data.frame(id=id, nobs=rep(0, length(id)))
    for (n in 1:length(id)) {
        filename <- paste(sprintf("%03d", id[n]), ".csv", sep="")
        fp <- paste(directory, filename, sep="/")
        df <- read.csv(fp)
        df2 <- df[complete.cases(df), ]
        answer[["nobs"]][n] = dim(df2)[1]
    }
    answer
}