#import library
library("rtweet")
library("dplyr")
library("tidyr")

query <- "G20"
jumlah <- 2000
bahasa <- "id"
#followers <- get_followers(user_name, n = jumlah, page = "-1", parse = TRUE,
#                       token = NULL)


retweet <- FALSE

token <- create_token(
  app = "vaksin covid",
  consumer_key = "Xc9S6GZWxwbOlInuCQrmXcTB0",
  consumer_secret = "OhkuYS01DtDkpEbiqW5WQk3i9tgsAsJTo8khy9YM6KcF9KylzX",
  access_token = "177951577-xlttk1JUzueyKl7bmM1Jtk4WPHOBIwjowDw1U5Cl",
  access_secret = "KGSf3z3vNehvMctnrqQuCzoR6knlrg8pehiUsE5yyRAqW")

#kalau yang diatas gabisa, delete dulu rds di Sys.getenv("TWITTER_PAT"), 
#terus ke folder itu delete aja rds, restar r session
#terus run get_token()


crawling <- search_tweets(query,
                         # followers,
                          n = jumlah,
                          include_rts = retweet,
                          lang = bahasa,
                          retryonratelimit = FALSE)

library("writexl")
library("xlsx")
View(crawling)
#write.xlsx(df2, file="D:/Works/Inovastek/HANDOVER FARHAN/HANDOVER FARHAN/ANALISIS SENTIMEN/Satu Paket/Cek123.xlsx", 
#           sheetName="Sheet1", col.names = TRUE, row.names = FALSE, append = TRUE)

#write.xlsx(as.data.frame(crawling), "R/sentimen_prabowo.xlsx", 
 #          col.names = TRUE, row.names = FALSE)
#install.packages("xlsx")
#Save as CSV
df2 = subset(crawling, select=-c(entities,metadata,geo,coordinates,place,quoted_status))

write_as_csv(df2, "D:/Works/Inovastek/HANDOVER FARHAN/HANDOVER FARHAN/ANALISIS SENTIMEN/Satu Paket/G20-Nov.csv",
             prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")

#write.csv(as.data.frame(crawling), "ruukuhp.csv",row.names=F)
