corr <- function(directory, threshold = 0) {
    dfs <- lapply(dir(directory, full.names = T), read.csv)
    dfs <- lapply(dfs, function(x) x[complete.cases(x),])
    dfs <- dfs[sapply(dfs, function(x) dim(x)[1] > threshold)]
    dfs <- sapply(dfs, function(x){cor(x$sulfate, x$nitrate)})
}