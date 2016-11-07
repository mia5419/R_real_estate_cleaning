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
# 另存資料
# write.table(fix_data[2:row_count,], file = "fix_A_lvr_land_A.CSV", sep = ",", col.names = fix_data[1,]) 
# 將資料輸出，指標要從 2 開始，
# 指標 1 的部分要放到 col.names。
#--------------------------------------------
#讀XML檔案
install.packages("XML")
library(XML) 
data <- xmlToDataFrame("./A_lvr_land_A.XML")
View(data)
#--------------------------------------------
#Add year
year_arr <- matrix(2012, nrow = row_count-1, ncol = 1)
View(year_arr)
data_year <- cbind(data_new, year_arr)
View(data_year)
write.table(data_year[2:row_count-1,], file = "fix2012_A_lvr_land_A.CSV", sep = ",", col.names = data_year[1,]) 

