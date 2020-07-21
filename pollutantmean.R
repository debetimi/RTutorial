pollutantmean <- function(directory, pollutant, id=1:332) {
    filenames = dir(directory, full.names = T)
    output = read.csv(filenames[id[1]])
    for(file in filenames[id[-1]]) {
        df <- read.csv(file, )
        output <- rbind(output, df)
    }
    mean(output[complete.cases(output[pollutant]),][[pollutant]])
}