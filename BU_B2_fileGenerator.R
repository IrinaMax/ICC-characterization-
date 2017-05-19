# B2 file generation revised and adjusted to work on  Mac locally

# 2Die genetation, working fine on my Mac, made 5000 files.
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
  
  csvFilename <- paste("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/2DIE/B2_2Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}

# 4-die package locally on my Mac:  working!! 05.05.17
# library(dplyr)

setwd("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/2Die")
filesNames2Die <- list.files("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/2Die", pattern = glob2rx( "*B2_2Die*"))
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
  df1 %>% head
  df2 %>% head
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
  csvFilename <- paste("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/4Die/B2_4Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}



#Simulation for 8 Die
getwd()
setwd("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/4Die")
filesNames4Die <- list.files("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/4Die", pattern = glob2rx( "*B2_4Die*"))
combData <- combn(length(filesNames4Die),2)
combData <- t(combData)
s <- sample(filesNames4Die, replace = FALSE)
head(s,10)
rndm <- 5000
rndm(head, 10)
df1 <- NULL
df2 <- NULL
#head(rndm)
for(j in 1: rndm){
  dim1 <- combData[j, 1]
  head( combData[1:50, 2] ) 
  dim2 <- combData[j, 2]
  
  df1 <- read.csv(s[dim1], header = TRUE)[,2]
  df2 <- read.csv(s[dim2], header = TRUE)[,2]
  # df1 %>% head
  # df2 %>% head
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
  csvFilename <- paste("/Users/38923/Desktop/Raw DataV- 1Z128GbX3/prog/mlc/B2/8Die/B2_8Die_",j,".csv", sep = "")
  write.csv(df, file = csvFilename)
}
