# This script has been written in R
# the corrplot library has been used to test the significancy of the correlation between the studied variables
# a confidence interval of 5% has been chooses, alongside with a level of significane based on the p value of .05 

data = read.csv("data_file.csv")
library(corrplot)
res1 <- cor.mtest(data, conf.level = .95)
corrplot(cor(bb), p.mat = res1$p, method = "color",
         insig = "label_sig", pch.col = "white")

corrplot.mixed(cor(bb), p.mat = res1$p, sig.level = .05)