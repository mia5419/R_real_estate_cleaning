#讀CSV檔案
#ReadFile
#data <- readLines("./A_lvr_land_A.CSV", encoding="big5")
#data <- iconv(data, "big5", "utf8")

#FixData
#column_count <- length(strsplit(data[1], ",")[[1]])
#row_count <- length(data) 
#fix_data <- matrix(NA, nrow = row_count, ncol = column_count)
#for(row in 1:row_count) {
#       for(col in 1:column_count) {
#             fix_data[row,col] <- strsplit(data[row], ",")[[1]][col] 
#}}
#data_new <- fix_data[2:row_count,]
#View(data_new)
#--------------------------------------------
# saveFile
# write.table(fix_data[2:row_count,], file = "fix_A_lvr_land_A.CSV", sep = ",", col.names = fix_data[1,]) 
# point start from 2
# col.names start from 1
#--------------------------------------------
#Read XML file
install.packages("XML")
library(XML) 
dataS1 <- xmlToDataFrame("./A_lvr_land_A_2013_1.XML")
dataS2 <- xmlToDataFrame("./A_lvr_land_A_2013_2.XML")
dataS3 <- xmlToDataFrame("./A_lvr_land_A_2013_3.XML")
dataS4 <- xmlToDataFrame("./A_lvr_land_A_2013_4.XML")
data_year <- rbind(dataS1, dataS2, dataS3, dataS4)
View(data_year)
#--------------------------------------------
#Add year
#
#nrow(data_year) 
#ncol(data_year)
#dim(data_year)
#
#NROW(na.omit(dataset)) #To count the data after omitting the NA
#sum(complete.cases(dataset))

row_count <- nrow(data_year)
row_count
year_arr <- matrix(2013, nrow = row_count, ncol = 1)
View(year_arr)
data_year <- cbind(data_year, year_arr)
View(data_year)
write.table(data_year[2:row_count-1,], file = "fix2013_A_lvr_land_A.CSV", sep = ",", col.names = data_year[1,]) 

