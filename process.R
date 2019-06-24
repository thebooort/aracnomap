df = read.csv("data/web.csv", stringsAsFactors = F)
df <- na.omit(df)
saveRDS(df, "./data.rds")
sample_data <- df[c(1:1000),]
saveRDS(sample_data, "data/sample_data.rds")
