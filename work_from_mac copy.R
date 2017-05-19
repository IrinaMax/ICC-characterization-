start.time <- Sys.time()
setwd("/Volumes/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc")
filesNamesB2 <- list.files("/Volumes/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc", pattern = glob2rx( "*file_*"))

df_ma <- function(df,n){
  x <- df$ICC
  cx <- cumsum(x)
  rsum <- (cx[(n+1):length(x)] - cx[1:(length(x) - n)])/n
  return(rsum)
} 
pdf(file = "/Volumes/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/hist_plots.pdf")
B2_1mic <- numeric(0)
B2_5mic <- numeric(0)
B2_20mic <- numeric(0)
for (j in 1: length(filesNamesB2)){
  df <- read.csv(filesNamesB2[j], header = TRUE)
  names(df)[1:2] <- c("Time", "ICC")
  B2_1mic[j] <- max(df_ma(df, 20), na.rm = TRUE)
  B2_5mic[j] <- max(df_ma(df, 100), na.rm = TRUE)
  B2_20mic[j] <- max(df_ma(df, 400), na.rm = TRUE)
}  

hist(B2_1mic, col = 'light blue')
hist(B2_5mic, col = 'light green')
hist(B2_20mic, col = 'light pink')


graphics.off()

end.time <- Sys.time()

processTime <- end.time - start.time

