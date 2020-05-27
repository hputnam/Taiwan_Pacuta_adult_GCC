#last modified 20200527
#Copyright 2020 HM Putnam
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
library("tidyverse")
library("spdep") 
library("adegenet")
library("UpSetR")
library("goseq")
library("GO.db")

#############################################################
# Host Gene expression analysis
counts <- read.csv(file="Data/Pact_gene_count_matrix.csv", header=T, sep=",") #Load expressin matrix from trinity
row.names(counts) <- counts$gene_id
counts <- counts[,-1]
annot <- read.csv(file="Data/Pact_Functionnal_annotation_abinitio.txt", header=T, , sep="\t")
annot$gene <- gsub(".*\\.(.*)\\..*", "\\1", annot$SeqName)
annot <- distinct(annot, gene, .keep_all = TRUE)

#Filter reads by proportion of samples containing the cutoff value
filt <- filterfun(pOverA(0.6,10)) #set filter values for PoverA, P percent of the samples have counts over A
tfil <- genefilter(counts, filt) #create filter for the counts data
keep <- counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
counts.5x <- as.matrix(counts[which(rownames(counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have counts over A
storage.mode(counts.5x) = "integer" #store counts data as integer
sample.info <- read.csv(file="Data/sample_description.csv", header=T, sep=",", row.names=1) #load sample info
sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
data <- DESeqDataSetFromMatrix(countData = counts.5x, colData = sample.info, design = ~ Temperature + CO2 + Temperature:CO2) #create a DESeqDataSet object

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

Temperature.Res <- results(DEG.int, contrast=c("Temperature", "High", "Ambient"))
Temperature.Res
Temp.sig.num <- sum(Temperature.Res$padj <0.05, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
Temp.sig <- subset(Temperature.Res, padj<0.05,) #identify signficant pvalues with 10%FDR
Temp.sig.list <- data[which(rownames(data) %in% rownames(Temp.sig)),] #subset list of sig transcripts from original count data
Temp.rsig <- rlog(Temp.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(counts(Temp.sig.list), file="Output/Temperature_DEG.csv")

CO2.Res <- results(DEG.int, contrast=c("CO2", "High", "Ambient"))
CO2.Res
CO2.sig.num <- sum(CO2.Res$padj <0.05, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
CO2.sig <- subset(CO2.Res, padj<0.05,) #identify signficant pvalues with 10%FDR
CO2.sig.list <- data[which(rownames(data) %in% rownames(CO2.sig)),] #subset list of sig transcripts from original count data
CO2.rsig <- rlog(CO2.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(counts(CO2.sig.list), file="Output/CO2_DEG.csv")

Interact.Res <- results(DEG.int, contrast=list(c("TemperatureHigh.CO2High")))
Interact.Res
Interact.sig.num <- sum(Interact.Res$padj <0.05, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
Interact.sig <- subset(Interact.Res, padj<0.05,) #identify signficant pvalues with 10%FDR
Interact.sig.list <- data[which(rownames(data) %in% rownames(Interact.sig)),] #subset list of sig transcripts from original count data
Interact.rsig <- rlog(Interact.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(counts(Interact.sig.list), file="Output/TempxCO2_Interaction_DEG.csv")

##### UNIQUE FROM INTERSECTION OF DEG IN TEMP, CO2, AND TEMP X CO2
Temp.DEGs <- as.data.frame(row.names(Temp.sig.list))
colnames(Temp.DEGs) <- "DEGs" 
CO2.DEGs <- as.data.frame(row.names(CO2.sig.list))
colnames(CO2.DEGs) <- "DEGs"
Interact.DEGs <- as.data.frame(row.names(Interact.sig.list))
colnames(Interact.DEGs) <- "DEGs"

DEGS.ALL <- rbind(Temp.DEGs,CO2.DEGs,Interact.DEGs )
DEGS.ALL <- unique(DEGS.ALL)
Unique.sig.num <- length(t(unique(DEGS.ALL)))

Unique.sig.list <- data[which(rownames(data) %in% DEGS.ALL$DEGs),] #subset list of sig transcripts from original count data
Unique.rsig <- rlog(Unique.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(counts(Unique.sig.list), file="Output/Unique_DEG.csv")

PCA.plot <- plotPCA(Unique.rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
dev.off()
jpeg(file="Output/Unique_PCA.DEG.jpg")
plot(PC.info$PC1, PC.info$PC2, xlab="PC1 94%", ylab="PC2 2%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
legend(x="bottomright", 
       bty="n",
       legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
       pch = c(15, 16),
       col=c("gray", "gray", "black", "black"),
       cex=1)
dev.off()


df <- as.data.frame(colData(Unique.rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
col.order <- c("pd_12.7",
               "pd_12.14",
               "pd_13.10",
               "pd_12.2",
               "pd_14.8",
               "pd_13.9",
               "pd_14.12",
               "pd_15.6",
               "pd_13.13",
               "pd_14.11",
               "pd_15.3")

Unique.DEG.annot <- as.data.frame(counts(Unique.sig.list))
Unique.DEG.annot$gene <- row.names(Unique.DEG.annot)
Unique.DEG.annot <- merge(Unique.DEG.annot, annot, by="gene")
write.csv(Unique.DEG.annot, file="Output/Unique_DEG_annotated.csv")

Unique.DEG.annot$ann.row <- paste0(Unique.DEG.annot$gene," ", Unique.DEG.annot$Description)
rownames(Unique.DEG.annot) <- Unique.DEG.annot$ann.row
mat <- as.matrix(Unique.DEG.annot[,2:12]) #make a matrix
mat <- mat[,col.order]
dev.off()
pdf(file="Output/Unique_Heatmap.DEG.Annotated.pdf") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors, scale="row",
         show_rownames =T, fontsize_row = 4, cluster_cols = FALSE,
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()

#############################################################
# Symbiont Gene expression analysis
counts <- read.csv(file="Data/C1_gene_count_matrix.csv", header=T, sep=",") #Load expressin matrix from trinity
row.names(counts) <- counts$gene_id
counts <- counts[,-1]
#annot <- read.csv(file="Data/Pact_Functionnal_annotation_abinitio.txt", header=T, , sep="\t")
#annot$gene <- gsub(".*\\.(.*)\\..*", "\\1", annot$SeqName)
#annot <- distinct(annot, gene, .keep_all = TRUE)

#Filter reads by proportion of samples containing the cutoff value
filt <- filterfun(pOverA(.6,10)) #set filter values for PoverA, P percent of the samples have counts over A
tfil <- genefilter(counts, filt) #create filter for the counts data
keep <- counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
counts.5x <- as.matrix(counts[which(rownames(counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have counts over A
storage.mode(counts.5x) = "integer" #store counts data as integer
sample.info <- read.csv(file="Data/sample_description.csv", header=T, sep=",", row.names=1) #load sample info
sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
data <- DESeqDataSetFromMatrix(countData = counts.5x, colData = sample.info, design = ~ Temperature + CO2 + Temperature:CO2) #create a DESeqDataSet object

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

Temperature.Res <- results(DEG.int, contrast=c("Temperature", "High", "Ambient"))
Temperature.Res
Temp.sig.num <- sum(Temperature.Res$padj <0.05, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
Temp.sig <- subset(Temperature.Res, padj<0.05,) #identify signficant pvalues with 10%FDR
Temp.sig.list <- data[which(rownames(data) %in% rownames(Temp.sig)),] #subset list of sig transcripts from original count data
Temp.rsig <- rlog(Temp.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(counts(Temp.sig.list), file="Output/Sym_Temperature_DEG.csv")

CO2.Res <- results(DEG.int, contrast=c("CO2", "High", "Ambient"))
CO2.Res
CO2.sig.num <- sum(CO2.Res$padj <0.05, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
CO2.sig <- subset(CO2.Res, padj<0.05,) #identify signficant pvalues with 10%FDR
CO2.sig.list <- data[which(rownames(data) %in% rownames(CO2.sig)),] #subset list of sig transcripts from original count data
CO2.sig.counts <- as.data.frame(counts(CO2.sig.list))
CO2.rsig <- rlog(CO2.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(CO2.sig.counts, file="Output/Sym_CO2_DEG.csv")

Interact.Res <- results(DEG.int, contrast=list(c("TemperatureHigh.CO2High")))
Interact.Res
Interact.sig.num <- sum(Interact.Res$padj <0.05, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
Interact.sig <- subset(Interact.Res, padj<0.05,) #identify signficant pvalues with 10%FDR
Interact.sig.list <- data[which(rownames(data) %in% rownames(Interact.sig)),] #subset list of sig transcripts from original count data
Interact.rsig <- rlog(Interact.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(counts(Interact.sig.list), file="Output/Sym_TempxCO2_Interaction_DEG.csv")

##### UNIQUE FROM INTERSECTION OF DEG IN TEMP, CO2, AND TEMP X CO2
Temp.DEGs <- as.data.frame(row.names(Temp.sig.list))
colnames(Temp.DEGs) <- "DEGs" 
CO2.DEGs <- as.data.frame(row.names(CO2.sig.list))
colnames(CO2.DEGs) <- "DEGs"
Interact.DEGs <- as.data.frame(row.names(Interact.sig.list))
colnames(Interact.DEGs) <- "DEGs"

DEGS.ALL <- rbind(Temp.DEGs,CO2.DEGs,Interact.DEGs )
DEGS.ALL <- unique(DEGS.ALL)
Unique.sig.num <- length(t(unique(DEGS.ALL)))

Unique.sig.list <- data[which(rownames(data) %in% DEGS.ALL$DEGs),] #subset list of sig transcripts from original count data
Unique.rsig <- rlog(Unique.sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
write.csv(counts(Unique.sig.list), file="Output/Sym_Unique_DEG.csv")


PCA.plot <- plotPCA(Unique.rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
dev.off()
jpeg(file="Output/Sym_Unique_PCA.DEG.jpg")
plot(PC.info$PC1, PC.info$PC2, xlab="PC1 42%", ylab="PC2 27%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
legend(x="bottomright", 
       bty="n",
       legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
       pch = c(15, 16),
       col=c("gray", "gray", "black", "black"),
       cex=1)
dev.off()

col.order <- c("pd_12.7",
               "pd_12.14",
               "pd_13.10",
               "pd_12.2",
               "pd_14.8",
               "pd_13.9",
               "pd_14.12",
               "pd_15.6",
               "pd_13.13",
               "pd_14.11",
               "pd_15.3")
mat <- assay(Unique.rsig) #make an expression object
mat <- mat[,col.order]
df <- as.data.frame(colData(Unique.sig.list)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors

dev.off()
pdf(file="Output/Sym_Unique_Heatmap.DEG.pdf") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors, scale="row",
         show_rownames =T, fontsize_row = 3, cluster_cols = FALSE,
         show_colnames =T) #plot heatmap of all DEG by group
dev.off()

# Unique.DEG.annot <- as.data.frame(counts(Unique.sig.list))
# Unique.DEG.annot$gene <- row.names(Unique.DEG.annot)
# Unique.DEG.annot <- merge(Unique.DEG.annot, annot, by="gene")
# write.csv(Unique.DEG.annot, file="Output/Unique_DEG_annotated.csv")
# 
# Unique.DEG.annot$ann.row <- paste0(Unique.DEG.annot$gene," ", Unique.DEG.annot$Description)
# rownames(Unique.DEG.annot) <- Unique.DEG.annot$ann.row
# mat <- as.matrix(Unique.DEG.annot[,2:12]) #make a matrix
# mat <- mat[,col.order]
# dev.off()
# pdf(file="Output/Unique_Heatmap.DEG.Annotated.pdf") #save file
# pheatmap(mat, annotation_col=df, annotation_colors=ann_colors, scale="row",
#          show_rownames =T, fontsize_row = 4, cluster_cols = FALSE,
#          show_colnames =F) #plot heatmap of all DEG by group
# dev.off()




