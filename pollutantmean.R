pollutantmean <- function(directory, pollutant, id=1:332) {
    filenames = dir(directory, full.names = T)
    dfs <-  lapply(filenames[id], read.csv);
    output <- Reduce(rbind,dfs,dfs[[1]][0,])
    mean(output[complete.cases(output[pollutant]),][[pollutant]])
}