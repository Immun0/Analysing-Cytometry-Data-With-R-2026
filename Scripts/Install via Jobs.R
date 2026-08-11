# Install packages in the background (via Jobs window)

#install.packages("job")

job::job({
  install.packages(c("ggplot2", "tidyverse", "devtools", "BiocManager", "Rcpp", "RcppEigen"))
})
