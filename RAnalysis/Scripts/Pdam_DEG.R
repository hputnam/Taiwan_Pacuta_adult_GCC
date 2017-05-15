#last modified 20170515
#Copyright 2017 HM Putnam
#Use of this code must be accompanied by a citation to XXXX
#Data should not be used without permission from HM Putnam
#See Readme

rm(list=ls()) # removes all prior objects

#source("https://bioconductor.org/biocLite.R")
#biocLite("DESeq2")
library("DESeq2")
library("pheatmap")
library("RColorBrewer")
library("genefilter")
library("ggplot2")
library("gplots")
library("limma")
library("spdep") 
library("adegenet") 

#############################################################
setwd("/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Data/") #set working directory

counts <- read.csv(file="isoforms_counts_matrix.counts.matrix", header=T, sep="") #Load expressin matrix from trinity
#annot <- read.csv(file="trinotate_annotation_report.csv", header=T)
#annotation <- annotation[match(rownames(counts), annot$Pfam),]

#want to pull up until the 3rd occurrance of ^ in Pfam column

filt <- filterfun(pOverA(0.25,5)) #set filter values for PoverA, P percent of the samples have counts over A
tfil <- genefilter(counts, filt) #create filter for the counts data
keep <- counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
counts.10x <- as.matrix(counts[which(rownames(counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have counts over A
#colnames(counts.10x) <- c("pd_12.14", "pd_12.2", "pd_12.7", "pd_13.10", "pd_13.13", "pd_13.9", "pd_14.11", "pd_14.12", "pd_14.8", "pd_15.3", "pd_15.6")
storage.mode(counts.10x) = "integer" #store counts data as integer
sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
data <- DESeqDataSetFromMatrix(countData = counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object

# Expression Visualization
rld <- rlog(data, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
head(assay(rld), 3) #view data
sampleDists <- dist(t(assay(rld))) #calculate distance matix
sampleDistMatrix <- as.matrix(sampleDists) #distance matrix
rownames(sampleDistMatrix) <- colnames(rld) #assign row names
colnames(sampleDistMatrix) <- NULL #assign col names
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255) #assign colors
pheatmap(sampleDistMatrix, #plot matrix
         clustering_distance_rows=sampleDists, #cluster rows
         clustering_distance_cols=sampleDists, #cluster columns
         col=colors) #set colors

plotPCA(rld, intgroup = c("Temperature", "CO2")) #plot PCA of samples with all data

# Differential Gene Expression Analysis
#Interaction Test: test of the factor of "group" with all combinations of the original factors as groups
DEG.int <- DESeq(data) #run differential expression test by group using the wald test
DEG.int.res <- results(DEG.int) #save DE results
resultsNames(DEG.int) #view DE results
sig.num <- sum(DEG.int.res$padj <0.1, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
sig <- subset(DEG.int.res, padj<0.1,) #identify signficant pvalues with 10%FDR
sig.list <- data[which(rownames(data) %in% rownames(sig)),] #subset list of sig transcripts from original count data
rsig <- rlog(sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size

##### Run PCA
#princomp(rsig$)

##### View DEG Data Heatmap and PCA
PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/PCA.DEG.jpg")
plot(PC.info$PC1, PC.info$PC2, xlab="PC1 62%", ylab="PC2 19%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
legend(x="bottomleft", 
       bty="n",
       legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
       pch = c(15, 16),
       col=c("gray", "gray", "black", "black"),
       cex=1)
dev.off()

topVarGenes <- head(order(rowVars(assay(rsig)),decreasing=TRUE),sig.num) #can choose a subset of transcripts for viewing
mat <- assay(rsig)[ topVarGenes, ] #make an expression object
mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
df <- as.data.frame(colData(rsig)[,c("Temperature","CO2")]) #make dataframe
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Heatmap.DEG.jpg")
pheatmap(mat, annotation_col=df, 
         show_rownames =F, 
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()




