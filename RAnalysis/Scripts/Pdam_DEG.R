#last modified 20200408
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
library(GSEABase)

#############################################################

counts <- read.csv(file="Data/Pact_gene_count_matrix.csv", header=T, sep=",") #Load expressin matrix from trinity
row.names(counts) <- counts$gene_id
counts <- counts[,-1]
annot <- read.csv(file="Data/Pact_Functionnal_annotation_abinitio.txt", header=T, , sep="\t")
annot$gene <- gsub(".*\\.(.*)\\..*", "\\1", annot$SeqName)
annot <- distinct(annot, gene, .keep_all = TRUE)



#Filter reads by proportion of samples containing the cutoff value
filt <- filterfun(pOverA(0.5,5)) #set filter values for PoverA, P percent of the samples have counts over A
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

##### TEMPERATURE View DEG Data Heatmap and PCA #####
PCA.plot <- plotPCA(Temp.rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Temp_PCA.DEG.jpg")
plot(PC.info$PC1, PC.info$PC2, xlab="PC1 60%", ylab="PC2 14%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
legend(x="bottomleft", 
       bty="n",
       legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
       pch = c(15, 16),
       col=c("gray", "gray", "black", "black"),
       cex=1)
dev.off()

topVarGenes <- head(order(rowVars(assay(Temp.rsig)),decreasing=TRUE),Temp.sig.num) #can choose a subset of transcripts for viewing
mat <- assay(Temp.rsig)[ topVarGenes, ] #make an expression object
mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
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
mat <- mat[,col.order]
df <- as.data.frame(colData(Temp.rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
dev.off()
jpeg(file="Output/Temperature_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, cluster_cols=FALSE,
         show_colnames =T) #plot heatmap of all DEG by group
dev.off()


##### PCO2 View DEG Data Heatmap and PCA #####
PCA.plot <- plotPCA(CO2.rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
dev.off()
jpeg(file="Output/CO2_PCA.DEG.jpg")
plot(PC.info$PC1, PC.info$PC2, xlab="PC1 59%", ylab="PC2 16%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
legend(x="topright", 
       bty="n",
       legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
       pch = c(15, 16),
       col=c("gray", "gray", "black", "black"),
       cex=1)
dev.off()

topVarGenes <- head(order(rowVars(assay(CO2.rsig)),decreasing=TRUE),CO2.sig.num) #can choose a subset of transcripts for viewing
mat <- assay(CO2.rsig)[ topVarGenes, ] #make an expression object
mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
mat <- mat[,col.order]
df <- as.data.frame(colData(CO2.rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
dev.off()
jpeg(file="Output/CO2_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, cluster_cols = FALSE,
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()


##### INTERACTION View DEG Data Heatmap and PCA #####
PCA.plot <- plotPCA(Interact.rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
PCA.plot #view plot
PC.info <-PCA.plot$data #extract plotting data
dev.off()
jpeg(file="Output/Interaction_PCA.DEG.jpg")
plot(PC.info$PC1, PC.info$PC2, xlab="PC1 43%", ylab="PC2 21%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
legend(x="bottomright", 
       bty="n",
       legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
       pch = c(15, 16),
       col=c("gray", "gray", "black", "black"),
       cex=1)
dev.off()

topVarGenes <- head(order(rowVars(assay(Interact.rsig)),decreasing=TRUE), Interact.sig.num) #can choose a subset of transcripts for viewing
mat <- assay(Interact.rsig)[ topVarGenes, ] #make an expression object
mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
mat <- mat[,col.order]
df <- as.data.frame(colData(Interact.rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
dev.off()
jpeg(file="Output/Interaction_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
         show_rownames =F, cluster_cols = FALSE,
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()


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
plot(PC.info$PC1, PC.info$PC2, xlab="PC1 42%", ylab="PC2 27%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
legend(x="bottomright", 
       bty="n",
       legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
       pch = c(15, 16),
       col=c("gray", "gray", "black", "black"),
       cex=1)
dev.off()

mat <- assay(Unique.rsig) #make an expression object
mat <- mat[,col.order]
df <- as.data.frame(colData(Interact.rsig)[,c("CO2","Temperature")]) #make dataframe
ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
dev.off()
jpeg(file="Output/Unique_Heatmap.DEG.jpg") #save file
pheatmap(mat, annotation_col=df, annotation_colors=ann_colors, scale="row",
         show_rownames =T, fontsize_row = 4, cluster_cols = FALSE,
         show_colnames =F) #plot heatmap of all DEG by group
dev.off()

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


##### GENE ONTOLOGY ENRICHMENT ANALYSIS #####
#Analysis for All DE (potentially both Host and Sym together)
ALL<-row.names(data)
DEG <- DEGS.ALL #row.names(sig) 
LENGTH <-read.table("Trinity.fasta.seq_len", sep = "", header=F) #reads in a list of gene lengths
#filter length to subset same count filter as above
gn.keep <- as.data.frame(gn.keep)
colnames(gn.keep) <- c("V1")
lens <- as.data.frame(LENGTH)
LENGTH <- merge(as.data.frame(LENGTH), gn.keep, by="V1")
GO <- read.table("go_annotations.txt", sep = "", header=F, stringsAsFactors=FALSE)
#filter GO to subset same count filter as above
GO <- as.data.frame(GO)
GOs <- merge(as.data.frame(GO), gn.keep, by="V1", all=T)
GOs[is.na(GOs)] <- "unknown"
GOs <- merge(GOs, LENGTH, by="V1")
GOs <- GOs[,1:2]
splitted <- strsplit(as.character(GOs$V2.x), ",")
GO.terms <- data.frame(v1 = rep.int(GOs$V1, sapply(splitted, length)), v2 = unlist(splitted))
IDs <- row.names(data)

#change contig lists to vectors
ALL.vector <-c(t(ALL))
DEG.vector <-c(t(DEG))
ID.vector <- LENGTH$V1
LENGTH.vector <-LENGTH$V2

#Construct new vector with 1 for DEG and 0 for others
gene.vector=as.integer(ALL.vector%in%DEG.vector)
names(gene.vector)=ALL.vector 
#explore this new vector 
head(gene.vector)
tail(gene.vector)

#weight vector by length of gene
DEG.pwf<-nullp(gene.vector, ID.vector, bias.data=LENGTH.vector)

#Find enriched GO terms, "selection-unbiased testing for category enrichment amongst differentially expressed (DE) genes for RNA-seq data"
GO.wall<-goseq(DEG.pwf, ID.vector, gene2cat=GO.terms, test.cats=c("GO:CC", "GO:BP", "GO:MF"), method="Wallenius", use_genes_without_cat=TRUE)

#How many enriched GO terms do we have
#Host
class(GO.wall)
head(GO.wall)
tail(GO.wall)
nrow(GO.wall)

#Find only enriched GO terms that are statistically significant at cutoff 
enriched.GO.05.a<-GO.wall$category[GO.wall$over_represented_pvalue<.05]
enriched.GO.05<-data.frame(enriched.GO.05.a)
colnames(enriched.GO.05) <- c("category")
enriched.GO.05 <- merge(enriched.GO.05, GO.wall, by="category")

All.sig.GO <- as.data.frame(enriched.GO.05)
  
MF <- subset(enriched.GO.05, ontology=="MF")
MF <- MF[order(MF$numDEInCat),]
MF <- subset(MF, numDEInCat>2) #remove terms with zero counts
barplot(MF$numDEInCat, horiz = TRUE , xlim = c(0,16), names.arg=MF$term, las=1, 
        cex.axis=0.5, cex.names=0.5)
MF$Prop <- MF$numDEInCat/sum(MF$numDEInCat)
slices <- MF$Prop
lbls <- MF$term
pie(slices, labels = lbls, main="Molecular Function")

BP <- subset(enriched.GO.05, ontology=="BP")
BP <- BP[order(BP$numDEInCat),]
BP <- subset(BP, numDEInCat>2) #remove terms with zero counts
barplot(BP$numDEInCat, horiz = TRUE , xlim = c(0,16), names.arg=BP$term, las=1, 
        cex.axis=0.5, cex.names=0.5)
BP$Prop <- BP$numDEInCat/sum(BP$numDEInCat)
slices <- BP$Prop
lbls <- BP$term
pie(slices, labels = lbls, main="Biological Process")

CC <- subset(enriched.GO.05, ontology=="CC")
CC <- CC[order(CC$numDEInCat),]
CC <- subset(CC, numDEInCat>2) #remove terms with zero counts
barplot(CC$numDEInCat, horiz = TRUE , xlim = c(0,16), names.arg=CC$term, las=1, 
        cex.axis=0.5, cex.names=0.5)
CC$Prop <- CC$numDEInCat/sum(CC$numDEInCat)
slices <- CC$Prop
lbls <- CC$term
pie(slices, labels = lbls, main="Cellular Component")

pdf(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/GO_Enrichment.pdf", height=8, width=8.5) #save file
par(mfrow=c(2,1))
#bottom, left, top, and right
par(mar=c(2, 20, 4, 1))
barplot(MF$numDEInCat, horiz = TRUE , xlim = c(0,36), names.arg=MF$term, las=1, 
        cex.axis=0.5, cex.names=0.5)
barplot(BP$numDEInCat, horiz = TRUE , xlim = c(0,36), names.arg=BP$term, las=1, 
        cex.axis=0.5, cex.names=0.5)
#barplot(CC$numDEInCat, horiz = TRUE , xlim = c(0,16), names.arg=CC$term, las=1, 
#        cex.axis=0.5, cex.names=0.5)
dev.off()


#####
#Annotation








#####
# #Identify Host Genes
# host.annot <- read.csv(file="Compartment/coral.outfmt6", header=F, sep="") #Load expressin matrix from trinity
# colnames(host.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score") #name columns
# host.annot <- subset(host.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
# counts$query_id <- rownames(counts) #add row names
# host.counts <- merge(host.annot[1], counts, by="query_id") #merge with counts data
# row.names(host.counts) <- host.counts$query_id #add query ids as row names 
# host.counts <- host.counts[2:12] #subset counts only
# 
# #Host DEG
# tfil <- genefilter(host.counts, filt) #create filter for the host.counts data
# keep <- host.counts[tfil,] #identify transcripts to keep by count filter
# gn.keep <- rownames(keep) #identify transcript list
# host.counts.10x <- as.matrix(host.counts[which(rownames(host.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have host.counts over A
# storage.mode(host.counts.10x) = "integer" #store host.counts data as integer
# sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
# sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
# data <- DESeqDataSetFromMatrix(countData = host.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object
# 
# # Expression Visualization
# rld <- rlog(data, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# head(assay(rld), 3) #view data
# sampleDists <- dist(t(assay(rld))) #calculate distance matix
# sampleDistMatrix <- as.matrix(sampleDists) #distance matrix
# rownames(sampleDistMatrix) <- colnames(rld) #assign row names
# colnames(sampleDistMatrix) <- NULL #assign col names
# colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255) #assign colors
# pheatmap(sampleDistMatrix, #plot matrix
#          clustering_distance_rows=sampleDists, #cluster rows
#          clustering_distance_cols=sampleDists, #cluster columns
#          col=colors) #set colors
# 
# plotPCA(rld, intgroup = c("Temperature", "CO2")) #plot PCA of samples with all data
# 
# # Differential Gene Expression Analysis
# #Interaction Test: test of the factor of "group" with all combinations of the original factors as groups
# DEG.int <- DESeq(data) #run differential expression test by group using the wald test
# DEG.int.res <- results(DEG.int) #save DE results
# resultsNames(DEG.int) #view DE results
# sig.num <- sum(DEG.int.res$padj <0.1, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
# sig <- subset(DEG.int.res, padj<0.1,) #identify signficant pvalues with 10%FDR
# sig.list <- data[which(rownames(data) %in% rownames(sig)),] #subset list of sig transcripts from original count data
# rsig <- rlog(sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# 
# write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Host_DEG.csv")
# 
# ##### Run PCA
# #princomp(rsig$)
# 
# ##### View DEG Data Heatmap and PCA
# PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
# PCA.plot #view plot
# PC.info <-PCA.plot$data #extract plotting data
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Host_PCA.DEG.jpg")
# plot(PC.info$PC1, PC.info$PC2, xlab="PC1 61%", ylab="PC2 18%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
# legend(x="bottomleft", 
#        bty="n",
#        legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
#        pch = c(15, 16),
#        col=c("gray", "gray", "black", "black"),
#        cex=1)
# dev.off()
# 
# topVarGenes <- head(order(rowVars(assay(rsig)),decreasing=TRUE),sig.num) #can choose a subset of transcripts for viewing
# mat <- assay(rsig)[ topVarGenes, ] #make an expression object
# mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
# df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
# ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Host_Heatmap.DEG.jpg") #save file
# pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
#          show_rownames =F, 
#          show_colnames =F) #plot heatmap of all DEG by group
# dev.off()
# 
# 
# #Identify Symbiodinium
# sym.annot <- read.csv(file="Compartment/sym.outfmt6", header=F, sep="") #Load expressin matrix from trinity
# colnames(sym.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score")
# sym.annot <- subset(sym.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
# counts$query_id <- rownames(counts)
# sym.counts <- merge(sym.annot[1], counts, by="query_id")
# row.names(sym.counts) <- sym.counts$query_id
# sym.counts <- sym.counts[2:12]
# 
# #Symbiodinium DEG
# tfil <- genefilter(sym.counts, filt) #create filter for the sym.counts data
# keep <- sym.counts[tfil,] #identify transcripts to keep by count filter
# gn.keep <- rownames(keep) #identify transcript list
# sym.counts.10x <- as.matrix(sym.counts[which(rownames(sym.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have sym.counts over A
# storage.mode(sym.counts.10x) = "integer" #store sym.counts data as integer
# sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
# sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
# data <- DESeqDataSetFromMatrix(countData = sym.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object
# 
# # Expression Visualization
# rld <- rlog(data, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# head(assay(rld), 3) #view data
# sampleDists <- dist(t(assay(rld))) #calculate distance matix
# sampleDistMatrix <- as.matrix(sampleDists) #distance matrix
# rownames(sampleDistMatrix) <- colnames(rld) #assign row names
# colnames(sampleDistMatrix) <- NULL #assign col names
# colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255) #assign colors
# pheatmap(sampleDistMatrix, #plot matrix
#          clustering_distance_rows=sampleDists, #cluster rows
#          clustering_distance_cols=sampleDists, #cluster columns
#          col=colors) #set colors
# 
# plotPCA(rld, intgroup = c("Temperature", "CO2")) #plot PCA of samples with all data
# 
# # Differential Gene Expression Analysis
# #Interaction Test: test of the factor of "group" with all combinations of the original factors as groups
# DEG.int <- DESeq(data) #run differential expression test by group using the wald test
# DEG.int.res <- results(DEG.int) #save DE results
# resultsNames(DEG.int) #view DE results
# sig.num <- sum(DEG.int.res$padj <0.1, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
# sig <- subset(DEG.int.res, padj<0.1,) #identify signficant pvalues with 10%FDR
# sig.list <- data[which(rownames(data) %in% rownames(sig)),] #subset list of sig transcripts from original count data
# rsig <- rlog(sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# 
# write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Sym_DEG.csv")
# 
# ##### Run PCA
# #princomp(rsig$)
# 
# ##### View DEG Data Heatmap and PCA
# PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
# PCA.plot #view plot
# PC.info <-PCA.plot$data #extract plotting data
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Sym_PCA.DEG.jpg")
# plot(PC.info$PC1, PC.info$PC2, xlab="PC1 62%", ylab="PC2 19%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
# legend(x="bottomleft", 
#        bty="n",
#        legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
#        pch = c(15, 16),
#        col=c("gray", "gray", "black", "black"),
#        cex=1)
# dev.off()
# 
# topVarGenes <- head(order(rowVars(assay(rsig)),decreasing=TRUE),sig.num) #can choose a subset of transcripts for viewing
# mat <- assay(rsig)[ topVarGenes, ] #make an expression object
# mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
# df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
# ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Sym_Heatmap.DEG.jpg") #save file
# pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
#          show_rownames =F, 
#          show_colnames =F) #plot heatmap of all DEG by group
# dev.off()
# 
# #Identify Bacteria
# bact.annot <- read.csv(file="Compartment/bacteria.outfmt6", header=F, sep="") #Load expressin matrix from trinity
# colnames(bact.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score")
# bact.annot <- subset(bact.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
# counts$query_id <- rownames(counts)
# bact.counts <- merge(bact.annot[1], counts, by="query_id")
# row.names(bact.counts) <- bact.counts$query_id
# bact.counts <- bact.counts[2:12]
# 
# #Bacterial DEG
# tfil <- genefilter(bact.counts, filt) #create filter for the bact.counts data
# keep <- bact.counts[tfil,] #identify transcripts to keep by count filter
# gn.keep <- rownames(keep) #identify transcript list
# bact.counts.10x <- as.matrix(bact.counts[which(rownames(bact.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have bact.counts over A
# storage.mode(bact.counts.10x) = "integer" #store bact.counts data as integer
# sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
# sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
# data <- DESeqDataSetFromMatrix(countData = bact.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object
# 
# # Expression Visualization
# rld <- rlog(data, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# head(assay(rld), 3) #view data
# sampleDists <- dist(t(assay(rld))) #calculate distance matix
# sampleDistMatrix <- as.matrix(sampleDists) #distance matrix
# rownames(sampleDistMatrix) <- colnames(rld) #assign row names
# colnames(sampleDistMatrix) <- NULL #assign col names
# colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255) #assign colors
# pheatmap(sampleDistMatrix, #plot matrix
#          clustering_distance_rows=sampleDists, #cluster rows
#          clustering_distance_cols=sampleDists, #cluster columns
#          col=colors) #set colors
# 
# plotPCA(rld, intgroup = c("Temperature", "CO2")) #plot PCA of samples with all data
# 
# # Differential Gene Expression Analysis
# #Interaction Test: test of the factor of "group" with all combinations of the original factors as groups
# DEG.int <- DESeq(data) #run differential expression test by group using the wald test
# DEG.int.res <- results(DEG.int) #save DE results
# resultsNames(DEG.int) #view DE results
# sig.num <- sum(DEG.int.res$padj <0.1, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
# sig <- subset(DEG.int.res, padj<0.1,) #identify signficant pvalues with 10%FDR
# sig.list <- data[which(rownames(data) %in% rownames(sig)),] #subset list of sig transcripts from original count data
# rsig <- rlog(sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# 
# write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Bact_DEG.csv")
# 
# ##### Run PCA
# #princomp(rsig$)
# 
# ##### View DEG Data Heatmap and PCA
# PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
# PCA.plot #view plot
# PC.info <-PCA.plot$data #extract plotting data
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Bact_PCA.DEG.jpg")
# plot(PC.info$PC1, PC.info$PC2, xlab="PC1 62%", ylab="PC2 19%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
# legend(x="bottomleft", 
#        bty="n",
#        legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
#        pch = c(15, 16),
#        col=c("gray", "gray", "black", "black"),
#        cex=1)
# dev.off()
# 
# topVarGenes <- head(order(rowVars(assay(rsig)),decreasing=TRUE),sig.num) #can choose a subset of transcripts for viewing
# mat <- assay(rsig)[ topVarGenes, ] #make an expression object
# mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
# df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
# ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/Bact_Heatmap.DEG.jpg") #save file
# pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
#          show_rownames =F, 
#          show_colnames =F) #plot heatmap of all DEG by group
# dev.off()
# 
# #Identify Viruses
# virus.annot <- read.csv(file="Compartment/viruses.outfmt6", header=F, sep="") #Load expressin matrix from trinity
# colnames(virus.annot) <- c("query_id",        "subject_id",      "pct_identity",    "aln_length",      "n_of_mismatches", "gap_openings",    "q_start", "q_end",   "s_start",   "s_end",   "e_value", "bit_score")
# virus.annot <- subset(virus.annot, e_value < 1.0e-05) # select for hits with evalues <1.0e-05
# counts$query_id <- rownames(counts)
# virus.counts <- merge(virus.annot[1], counts, by="query_id")
# row.names(virus.counts) <- virus.counts$query_id
# virus.counts <- virus.counts[2:12]
# 
# #Viral DEG
# tfil <- genefilter(virus.counts, filt) #create filter for the virus.counts data
# keep <- virus.counts[tfil,] #identify transcripts to keep by count filter
# gn.keep <- rownames(keep) #identify transcript list
# virus.counts.10x <- as.matrix(virus.counts[which(rownames(virus.counts) %in% gn.keep),]) #data filtered in PoverA, P percent of the samples have virus.counts over A
# storage.mode(virus.counts.10x) = "integer" #store virus.counts data as integer
# sample.info <- read.csv(file="sample_description.csv", header=T, sep=",", row.names=1) #load sample info
# sample.info$group <- factor(paste0(sample.info$Temperature, sample.info$CO2)) #merge condition and time into group
# data <- DESeqDataSetFromMatrix(countData = virus.counts.10x, colData = sample.info, design = ~ group) #create a DESeqDataSet object
# 
# # Expression Visualization
# rld <- rlog(data, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# head(assay(rld), 3) #view data
# sampleDists <- dist(t(assay(rld))) #calculate distance matix
# sampleDistMatrix <- as.matrix(sampleDists) #distance matrix
# rownames(sampleDistMatrix) <- colnames(rld) #assign row names
# colnames(sampleDistMatrix) <- NULL #assign col names
# colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255) #assign colors
# pheatmap(sampleDistMatrix, #plot matrix
#          clustering_distance_rows=sampleDists, #cluster rows
#          clustering_distance_cols=sampleDists, #cluster columns
#          col=colors) #set colors
# 
# plotPCA(rld, intgroup = c("Temperature", "CO2")) #plot PCA of samples with all data
# 
# # Differential Gene Expression Analysis
# #Interaction Test: test of the factor of "group" with all combinations of the original factors as groups
# DEG.int <- DESeq(data) #run differential expression test by group using the wald test
# DEG.int.res <- results(DEG.int) #save DE results
# resultsNames(DEG.int) #view DE results
# sig.num <- sum(DEG.int.res$padj <0.1, na.rm=T) #identify the number of significant p values with 10%FDR (padj<0.1)
# sig <- subset(DEG.int.res, padj<0.1,) #identify signficant pvalues with 10%FDR
# sig.list <- data[which(rownames(data) %in% rownames(sig)),] #subset list of sig transcripts from original count data
# rsig <- rlog(sig.list, blind=FALSE) #apply a regularized log transformation to minimize effects of small counts and normalize wrt library size
# 
# write.csv(counts(sig.list), file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/virus_DEG.csv")
# 
# ##### Run PCA
# #princomp(rsig$)
# 
# ##### View DEG Data Heatmap and PCA
# PCA.plot <- plotPCA(rsig, intgroup = c("Temperature", "CO2")) #Plot PCA of all samples for DEG only
# PCA.plot #view plot
# PC.info <-PCA.plot$data #extract plotting data
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/virus_PCA.DEG.jpg")
# plot(PC.info$PC1, PC.info$PC2, xlab="PC1 62%", ylab="PC2 19%", pch = c(15, 16)[as.numeric(sample.info$CO2)], col=c("gray", "black")[sample.info$Temperature], cex=1.3)
# legend(x="bottomleft", 
#        bty="n",
#        legend = c("ATAC", "ATHC", "HTAC", "HTHC"),
#        pch = c(15, 16),
#        col=c("gray", "gray", "black", "black"),
#        cex=1)
# dev.off()
# 
# topVarGenes <- head(order(rowVars(assay(rsig)),decreasing=TRUE),sig.num) #can choose a subset of transcripts for viewing
# mat <- assay(rsig)[ topVarGenes, ] #make an expression object
# mat <- mat - rowMeans(mat) #difference in expression compared to average across all samples
# df <- as.data.frame(colData(rsig)[,c("CO2","Temperature")]) #make dataframe
# ann_colors <- list(Temperature = c(Ambient="blue", High="red"), CO2 = c(Ambient= "gray", High= "black")) #manually set colors
# jpeg(file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/virus_Heatmap.DEG.jpg") #save file
# pheatmap(mat, annotation_col=df, annotation_colors=ann_colors,
#          show_rownames =F, 
#          show_colnames =F) #plot heatmap of all DEG by group
# dev.off()
# 
# 
# #determine if there are hits to multiple taxa
# host.sym.union <- merge(host.annot, sym.annot, by="query_id") #1031
# host.bac.union <- merge(host.annot, bact.annot, by="query_id") #620
# host.vir.union <- merge(host.annot, virus.annot, by="query_id") #1
# sym.bac.union <- merge(sym.annot, bact.annot, by="query_id") #1066
# sym.vir.union <- merge(sym.annot, virus.annot, by="query_id") #5
# bac.vir.union <- merge(bact.annot, virus.annot, by="query_id") #6
# 
