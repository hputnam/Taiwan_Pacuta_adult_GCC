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

filt <- filterfun(pOverA(0.50,5)) #set filter values for PoverA, P percent of the samples have counts over A
tfil <- genefilter(counts, filt) #create filter for the counts data
keep <- counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
counts.10x <- as.matrix(counts[which(rownames(counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have counts over A
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

write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/DEG.csv")

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
df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, 
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()

#Identify Host Genes
host.annot <- read.csv(file="Compartment/coral.outfmt6", header=F, sep="") #Load expressin matrix from trinity
colnames(host.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score") #name columns
host.annot <- subset(host.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
counts$query_id <- rownames(counts) #add row names
host.counts <- merge(host.annot[1], counts, by="query_id") #merge with counts data
row.names(host.counts) <- host.counts$query_id #add query ids as row names 
host.counts <- host.counts[2:12] #subset counts only

#Host DEG
tfil <- genefilter(host.counts, filt) #create filter for the host.counts data
keep <- host.counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
host.counts.10x <- as.matrix(host.counts[which(rownames(host.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have host.counts over A
storage.mode(host.counts.10x) = "integer" #store host.counts data as integer
sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
data <- DESeqDataSetFromMatrix(countData = host.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object

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

write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Host_DEG.csv")

##### Run PCA
#princomp(rsig$)

##### View DEG Data Heatmap and PCA
PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Host_PCA.DEG.jpg")
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
df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Host_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, 
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()


#Identify Symbiodinium
sym.annot <- read.csv(file="Compartment/sym.outfmt6", header=F, sep="") #Load expressin matrix from trinity
colnames(sym.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score")
sym.annot <- subset(sym.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
counts$query_id <- rownames(counts)
sym.counts <- merge(sym.annot[1], counts, by="query_id")
row.names(sym.counts) <- sym.counts$query_id
sym.counts <- sym.counts[2:12]

#Symbiodinium DEG
tfil <- genefilter(sym.counts, filt) #create filter for the sym.counts data
keep <- sym.counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
sym.counts.10x <- as.matrix(sym.counts[which(rownames(sym.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have sym.counts over A
storage.mode(sym.counts.10x) = "integer" #store sym.counts data as integer
sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
data <- DESeqDataSetFromMatrix(countData = sym.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object

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

write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Sym_DEG.csv")

##### Run PCA
#princomp(rsig$)

##### View DEG Data Heatmap and PCA
PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Sym_PCA.DEG.jpg")
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
df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Sym_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, 
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()

#Identify Bacteria
bact.annot <- read.csv(file="Compartment/bacteria.outfmt6", header=F, sep="") #Load expressin matrix from trinity
colnames(bact.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score")
bact.annot <- subset(bact.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
counts$query_id <- rownames(counts)
bact.counts <- merge(bact.annot[1], counts, by="query_id")
row.names(bact.counts) <- bact.counts$query_id
bact.counts <- bact.counts[2:12]

#Bacterial DEG
tfil <- genefilter(bact.counts, filt) #create filter for the bact.counts data
keep <- bact.counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
bact.counts.10x <- as.matrix(bact.counts[which(rownames(bact.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have bact.counts over A
storage.mode(bact.counts.10x) = "integer" #store bact.counts data as integer
sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
data <- DESeqDataSetFromMatrix(countData = bact.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object

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

write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Bact_DEG.csv")

##### Run PCA
#princomp(rsig$)

##### View DEG Data Heatmap and PCA
PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Bact_PCA.DEG.jpg")
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
df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Bact_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, 
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()

#Identify Viruses
virus.annot <- read.csv(file="Compartment/viruses.outfmt6", header=F, sep="") #Load expressin matrix from trinity
colnames(virus.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score")
virus.annot <- subset(virus.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
counts$query_id <- rownames(counts)
virus.counts <- merge(virus.annot[1], counts, by="query_id")
row.names(virus.counts) <- virus.counts$query_id
virus.counts <- virus.counts[2:12]

#Viral DEG
tfil <- genefilter(virus.counts, filt) #create filter for the virus.counts data
keep <- virus.counts[tfil,] #identify transcripts to keep by count filter
gn.keep <- rownames(keep) #identify transcript list
virus.counts.10x <- as.matrix(virus.counts[which(rownames(virus.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have virus.counts over A
storage.mode(virus.counts.10x) = "integer" #store virus.counts data as integer
sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
data <- DESeqDataSetFromMatrix(countData = virus.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object

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

write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/virus_DEG.csv")

##### Run PCA
#princomp(rsig$)

##### View DEG Data Heatmap and PCA
PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/virus_PCA.DEG.jpg")
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
df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/virus_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, 
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()


#determine if there are hits to multiple taxa
host.sym.union <- merge(host.annot, sym.annot, by="query_id") #1031
host.bac.union <- merge(host.annot, bact.annot, by="query_id") #620
host.vir.union <- merge(host.annot, virus.annot, by="query_id") #1
sym.bac.union <- merge(sym.annot, bact.annot, by="query_id") #1066
sym.vir.union <- merge(sym.annot, virus.annot, by="query_id") #5
bac.vir.union <- merge(bact.annot, virus.annot, by="query_id") #6

