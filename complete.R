complete <- function(directory, id=1:332) {
    filenames = dir(directory, full.names = T)
    reducer <- function(x,y){append(x, dim(y[complete.cases(y),])[1])}
    nobs <- Reduce(reducer,lapply(filenames[id], read.csv),init=c());
    data.frame(id=id, nobs=nobs)
}