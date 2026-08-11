library(flowCore)
library(ggplot2)
library(gridExtra)
library(here)

# Load your FCS file
fcsData <- read.FCS("yourfile.fcs")

# Extract the flow frame data
ff <- as(fcsData, "flowFrame")

# Get the names of parameters, you might want to exclude some like Time, FSC, SSC depending on your data
parameters <- colnames(ff)[5:14]  # Modify this according to your actual markers

# Initialize an empty list to store the plots
plot_list <- list()

# Create N x N plots
counter <- 1
for (i in parameters) {
  for (j in parameters) {
    # Skip plotting a parameter against itself
    if (i != j) {
      # Create the scatter plot for the parameter pair
      p <- ggplot(data = as.data.frame(ff), aes_string(x = i, y = j)) +
        geom_point(alpha = 0.5) +
        theme_minimal() +
        labs(title = paste(i, "vs", j), x = i, y = j)
      # Store the plot in the list
      plot_list[[counter]] <- p
      counter <- counter + 1
    }
  }
}

# Combine the plots. Adjust the grid dimensions as needed
do.call(grid.arrange, c(plot_list, ncol = length(parameters) - 1))