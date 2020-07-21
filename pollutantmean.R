pollutantmean <- function(directory, pollutant, id=1:332) {
    filenames = dir(directory, full.names = T)
    output = read.csv(filenames[id[1]])
    output <- output[complete.cases(output), ]
    print(dim(output))
    for(file in filenames[id[-1]]) {
        print(file)
        df <- read.csv(file, )
        output <- rbind(output, df[complete.cases(df), ])
    }
    print(dim(output))
    mean(output[[pollutant]])
}