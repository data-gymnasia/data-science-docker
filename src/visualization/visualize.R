
library(tidyverse)

# Get command line argument
args = commandArgs(trailingOnly=TRUE)
data_file = paste(args[1],"iris.csv", sep="")
output_dir = args[2]

# read data
data = read_csv(data_file)

# save sepal plot
ggplot(data) + 
    geom_point(aes(x = sepal_width, y = sepal_length, color = species)) + 
    ggtitle("Sepal Dimensions")
ggsave(paste(output_dir, "sepal.pdf", sep=""))

# save petal plot
ggplot(data) + 
    geom_point(aes(x = petal_width, y = petal_length, color = species)) + 
    ggtitle("Petal Dimensions")
ggsave(paste(output_dir, "petal.pdf", sep=""))