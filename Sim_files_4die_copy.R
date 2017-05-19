# 4-die package for server on my Mac: (working good locally so far !) 05.05.17
# adjusted for server but stop generate files around after 2700...  I guess server problems.

#library(dplyr)
setwd("/Volumes/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/2Die")
filesNames2Die <- list.files("/Volumes/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/2Die", pattern = glob2rx( "*B2_2Die*"))
combData <- combn(length(filesNames2Die),2)
combData <- t(combData)
s <- sample(filesNames2Die, replace = FALSE)
rndm <- 5000
df1 <- NULL
df2 <- NULL
#head(rndm)
for(j in 1: rndm){
  dim1 <- combData[j, 1]
  dim2 <- combData[j, 2]
  
  df1 <- read.csv(s[dim1], header = TRUE)[,2]
  df2 <- read.csv(s[dim2], header = TRUE)[,2]
#  df1 %>% head
#  df2 %>% head
  df1 <- data.frame(df1)
  df2 <- data.frame(df2)
  
  
  n1 <- dim(df1)[1]
  n2 <- dim(df2)[1]
  k <- abs(n1 - n2)
  # ifelse(k >0, L <- sample(1:k, 1), L <- 1)
  # if(n1 < n2) {
  #      df <- df2[L:(L + n1 - 1),1] + df1[,1]
  #    } else if (n1 > n2) {
  #      df <- df1[L:(L + n2 -1),1] + df2[,1]
  #    } else {df1 + df2}
  
  ifelse(k >0, L <- sample(1:k, 1), L <- 1)
  ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),1] + df1[,1],
         ifelse(n1 > n2, df <- df1[L:(L + n2 -1),1]+df2[,1], df <- df1 + df2))
  csvFilename <- paste("/Volumes/Memory Characterization/Users/Vladimir/Raw Data - 1Z128GbX3/prog/mlc/4Die/B2_4Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}

setwd("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/2Die")
filesNames2Die <- list.files("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/2Die", pattern = glob2rx( "*B2_2Die*"))
combData <- combn(length(filesNames2Die),2)
combData <- t(combData)
s <- sample(filesNames2Die, replace = FALSE)
rndm <- 5000
head(rndm)
for(j in 1: rndm){
  dim1 <- combData[j, 1]
  dim2 <- combData[j, 2]
  df1 <- read.csv(s[dim1], header = TRUE)[,2]
  df2 <- read.csv(s[dim2], header = TRUE)[,2]
  df1 %>% head
  df2 %>% head
  df1 %>% data.frame(df1)
  df2 %>% data.frame(df2)
  n1 <- length(df1)[1,]
  n2 <- length(df2)[1,]
  k <- abs(n1 - n2)
  # ifelse(k >0, L <- sample(1:k, 1), L <- 1)
  # if(n1 < n2) {
  #      df <- df2[L:(L + n1 - 1),1] + df1[,1]
  #    } else if (n1 > n2) {
  #      df <- df1[L:(L + n2 -1),1] + df2[,1]
  #    } else {df1 + df2}
  
    ifelse(k >0, L <- sample(1:k, 1), L <- 1)
    ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),1] + df1[,1],ifelse(n1 > n2, df <- df1[L:(L + n2 -1),1]+df2[,1], df <- df1 + df2))
  csvFilename <- paste("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/4Die/B2_4Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}

#the console stop work by iself : I copy error look like this: looks like server problems...
# Error in `[.data.frame`(read.csv(s[dim2], header = TRUE), , 2) : 
# undefined columns selected In addition: Warning messages:
#   1: In scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  :
#                EOF within quoted string
#              2: In scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  :
#                           embedded nul(s) found in input
#                         



# #fils generation for 4 die May 3
# 
# setwd("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2")
# filesNamesB2_4d <- list.files("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2", pattern = glob2rx( "*B2_2Die_*"))
# 
# combData <- combn(length(filesNamesB2_4d),2)
# combData <- t(combData)
# 
# rndm <- 5000
# for(j in 1: rndm){
#   dim1 <- combData[j, 1]
#   dim2 <- combData[j, 2]
#   s <- sample(filesNamesB2_4d)
#   df1 <- read.csv(filesNamesB2_4d[dim1], header = TRUE)[,2]
#   df2 <- read.csv(filesNamesB2_4d[dim2], header = TRUE)[,2]
#   n1 <- dim(df1)[1]
#   n2 <- dim(df2)[1]
#   k <- abs(n1 - n2)
#   L <- sample(1:k, 1)
#   # if(k = 0){
#   #   df <- df1 + df2}
#   # else{
#   #  ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),2] + df1[,2], df <- df1[L:(L + n2 -1),2]+df2[,2])
#     ifelse( k == 0, df <- df1 + df2 ,
#             ifelse(n1 < n2, df <- df2[L:(L + n1 - 1),2] + df1[,2], df <- df1[L:(L + n2 -1),2]+df2[,2]))
#   # }
#   csvFilename <- paste("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/file_4d_",j,".csv", sep = "")
#   write.csv(df, file = csvFilename)
# }
