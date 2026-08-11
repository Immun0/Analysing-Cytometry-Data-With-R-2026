## CLEANING - REMOVE ACQUISITION ARTIFACTS AND OUTLIERS

library(flowAI)
library(flowCore)
library(tidyverse)
library(here)
library(flowCut)
library(PeacoQC)

# Import flowset to test
FLOWSET <- Reordered_RENAMED_FLOWSET <- readRDS(here(RDS, "FLOWSET.rds"))
# Transform the data
ARCSINH_FLOWSET <- fsApply(FLOWSET, function(x, cofactor = 200){
  expr <- exprs(x)
  expr <- asinh(expr / cofactor)
  exprs(x) <- expr
  x
})
ARCSINH_FLOWSET

# FLOWAI
FLOWAI_CLEANED_FLOWSET <- flow_auto_qc(ARCSINH_FLOWSET, folder_results = here(output, "FlowAI_QC"))

#FLOWCUT
# FlowCut requries flowFrames as input rather than flowSet so we have to split up our flowFrame
CLEANED<-fsApply(ARCSINH_FLOWSET, function(x)flowCut(x, Directory = here(output,  "flowCut")))

#Check the results for all files in the flowSet
# CLEANED # skip this if lots of large files
# or just a single file
CLEANED[[1]]$frame 

class(CLEANED)

# Note that the CLEANED item is actually a list and not a flowFrame or flowSet so we need to turn it back into a flowSet for the rest of our analyses.
# loop through the files in the list so we get each one's name
files<-list() 
for(x in 1:length(CLEANED)){
  files<-append(files,list(CLEANED[[x]]$frame))
}

# make a flowSet out of the data from our loop and save it
FLOWCUT_CLEANED_TRANSFORMED_FLOWSET<-flowSet(files)

#PEACOQC
# Specify flowframe path and read your flowframe

# Determine channels on which quality control should be done
channels <- c(3:16)
# Remove margins
# Make sure you do this before any compensation since the internal parameters
# change and they are neccessary for the RemoveMargins function.
# If this is not possible, you can specify the internal parameters in the
# cleaned flowframe as an fcs file and plot the results
# of this quality control step.
CLEANED<-fsApply(ARCSINH_FLOWSET, function(x)PeacoQC(x, channels = channels, save_fcs = TRUE, plot = TRUE, output_directory = here(output,  "PeacoQC")))

Test <- CLEANED$'20230518_1SP1_Live.fcs'

class(CLEANED)

files<-list() 
for(x in 1:length(CLEANED)){
  files<-append(files,list(CLEANED[[1]]$FinalFF))
}

PEACOQC_CLEANED_FLOWSET<-flowSet(files)

sampleNames(PEACOQC_CLEANED_FLOWSET)
sampleNames(FLOWCUT_CLEANED_FLOWSET)
sampleNames(FLOWAI_CLEANED_FLOWSET)
sampleNames(FLOWCUT_CLEANED_FLOWSET) <- sampleNames(ARCSINH_FLOWSET)
sampleNames(PEACOQC_CLEANED_FLOWSET) <- sampleNames(ARCSINH_FLOWSET)
pData(FLOWCUT_CLEANED_FLOWSET)$name <- sampleNames(FLOWCUT_CLEANED_FLOWSET)
pData(PEACOQC_CLEANED_FLOWSET)$name <- sampleNames(PEACOQC_CLEANED_FLOWSET)

ARCSINH_FLOWSET <- fsApply(FLOWSET, function(x, cofactor = 200){
  expr <- exprs(x)
  expr <- asinh(expr / cofactor)
  exprs(x) <- expr
  x
})

ARCSINH_FLOWAI_CLEANED_FLOWSET <- fsApply(FLOWAI_CLEANED_FLOWSET, function(x, cofactor = 200){
  expr <- exprs(x)
  expr <- asinh(expr / cofactor)
  exprs(x) <- expr
  x
})

ARCSINH_FLOWCUT_CLEANED_FLOWSET <- fsApply(FLOWCUT_CLEANED_FLOWSET, function(x, cofactor = 200){
  expr <- exprs(x)
  expr <- asinh(expr / cofactor)
  exprs(x) <- expr
  x
})

ARCSINH_PEACOQC_CLEANED_FLOWSET <- fsApply(PEACOQC_CLEANED_FLOWSET, function(x, cofactor = 200){
  expr <- exprs(x)
  expr <- asinh(expr / cofactor)
  exprs(x) <- expr
  x
})

C1 <- ggcyto::as.ggplot(autoplot(ARCSINH_FLOWSET[[5]], "Time", "BUV395-A", bins = 128)) +
  ggtitle("Before cleaning") 
C2 <- ggcyto::as.ggplot(autoplot(ARCSINH_FLOWAI_CLEANED_FLOWSET[[5]], "Time", "BUV395-A", bins = 128)) + 
  ggtitle("After cleaning - FlowAI")
C3 <- ggcyto::as.ggplot(autoplot(ARCSINH_FLOWCUT_CLEANED_FLOWSET[[5]], "Time", "BUV395-A", bins = 128)) + 
  ggtitle("After cleaning - FlowCut")
C4 <- ggcyto::as.ggplot(autoplot(ARCSINH_PEACOQC_CLEANED_FLOWSET[[5]], "Time", "BUV395-A", bins = 128)) + 
  ggtitle("After cleaning - PeacoQC")



plot_grid(C1, C2, C3, C4)
