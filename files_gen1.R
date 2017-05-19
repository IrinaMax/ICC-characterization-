#fils generation for 2 die

setwd("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2")
filesNamesB2 <- list.files("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2", pattern = glob2rx( "*MLC_B2*"))


combData <- combn(length(filesNamesB2),2)
combData <- t(combData)
s <- sample(filesNamesB2, replace = FALSE)
rndm <- 5000
for(j in 1: rndm){
  dim1 <- combData[j, 1]
  dim2 <- combData[j, 2]
  df1 <- read.table(s[dim1], header = FALSE)
  df2 <- read.table(s[dim2], header = FALSE)
  n1 <- dim(df1)[1]
  n2 <- dim(df2)[1]
  k <- abs(n1 - n2)
  ifelse(k > 0, L <- sample(1:k, 1), L <- 1)
  ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),2] + df1[,2],ifelse(n1 > n2, df <- df1[L:(L + n2 -1),2]+df2[,2], df <- df1 + df2))
  
  csvFilename <- paste("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/2Die/B2_2Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}


# df_ma <- function(df,n){
#   x <- df$ICC
#   cx <- cumsum(x)
#   rsum <- (cx[(n+1):length(x)] - cx[1:(length(x) - n)])/n
#   return(rsum)
# }

# two die package: code below reads single die files (B2) and creates 2-die package files

# filesNamesB2 <- list.files("//pops/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc", pattern = glob2rx( "*MLC_B2*"))
# combData <- combn(length(filesNamesB2),2)
# combData <- t(combData)
# s <- sample(filesNamesB2, replace = FALSE)
# rndm <- 5000
# for(j in 1: rndm){
#   dim1 <- combData[j, 1]
#   dim2 <- combData[j, 2]
#   df1 <- read.table(s[dim1], header = FALSE)
#   df2 <- read.table(s[dim2], header = FALSE)
#   n1 <- dim(df1)[1]
#   n2 <- dim(df2)[1]
#   k <- abs(n1 - n2)
#   ifelse(k > 0, L <- sample(1:k, 1), L <- 1)
#   ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),2] + df1[,2],ifelse(n1 > n2, df <- df1[L:(L + n2 -1),2]+df2[,2], df <- df1 + df2))
#   
#   csvFilename <- paste("//pops/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/2Die/B2_2Die_",j,".csv", sep = "")
#   write.csv(df, file = csvFilename)
# }


# 4-die package:
filesNames2Die <- list.files("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/2die", pattern = glob2rx( "*B2_2Die_*"))
combData <- combn(length(filesNames2Die),2)
combData <- t(combData)
s <- sample(filesNames2Die, replace = FALSE)
rndm <- 5000
for(j in 1: rndm){
  dim1 <- combData[j, 1]
  dim2 <- combData[j, 2]
  df1 <- read.csv(s[dim1], header = TRUE)[,2]
  df2 <- read.csv(s[dim2], header = TRUE)[,2]
  n1 <- dim(df1)[1]
  n2 <- dim(df2)[1]
  k <- abs(n1 - n2)
  ifelse(k > 0, L <- sample(1:k, 1), L <- 1)
  ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),2] + df1[,2],ifelse(n1 > n2, df <- df1[L:(L + n2 -1),2]+df2[,2], df <- df1 + df2))
  csvFilename <- paste("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/4die/B2_4Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}


# 8-die package:

filesNamesB2 <- list.files("//pops/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/4Die", pattern = glob2rx( "*B2_4Die*"))
combData <- combn(length(filesNamesB2),2)
combData <- t(combData)
s <- sample(filesNamesB2, replace = FALSE)
rndm <- 5000
for(j in 1: rndm){
  dim1 <- combData[j, 1]
  dim2 <- combData[j, 2]
  df1 <- read.csv(s[dim1], header = TURE)[,2]
  df2 <- read.csv(s[dim2], header = TRUE)[,2]
  n1 <- dim(df1)[1]
  n2 <- dim(df2)[1]
  k <- abs(n1 - n2)
  ifelse(k > 0, L <- sample(1:k, 1), L <- 1)
  ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),2] + df1[,2],ifelse(n1 > n2, df <- df1[L:(L + n2 -1),2]+df2[,2], df <- df1 + df2))
  csvFilename <- paste("//pops/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/8Die/B2_8Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}


# 16-die package:
filesNamesB2 <- list.files("//pops/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/8Die", pattern = glob2rx( "*B2_8Die*"))
combData <- combn(length(filesNamesB2),2)
combData <- t(combData)
s <- sample(filesNamesB2, replace = FALSE)
rndm <- 5000
for(j in 1: rndm){
  dim1 <- combData[j, 1]
  dim2 <- combData[j, 2]
  df1 <- read.csv(s[dim1], header = TRUE)[,2]
  df2 <- read.csv(s[dim2], header = TRUE)[,2]
  n1 <- dim(df1)[1]
  n2 <- dim(df2)[1]
  k <- abs(n1 - n2)
  ifelse(k > 0, L <- sample(1:k, 1), L <- 1)
  ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),2] + df1[,2],ifelse(n1 > n2, df <- df1[L:(L + n2 -1),2]+df2[,2], df <- df1 + df2))
  csvFilename <- paste("//pops/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/16Die/B2_16Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}
