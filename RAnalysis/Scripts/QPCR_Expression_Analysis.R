#####################################################################
#This script is for the Taiwan physiology and gene expression project
#
#Created by Hollie Putnam
#Created on 17 March 2017
#Last Edited 17 March 2017
#####################################################################

## clear the working environment
rm(list=ls())

## load libraries
library(plyr)
library(data.table)


## Set working directory
setwd("Data")

gene.data <- read.csv("Gene_expression.csv", header=T, sep=",") #load expression data
sample.info <- read.csv("Sample.Info.csv", header=T, sep=",") #load sample info

Data <- merge(sample.info, gene.data, by="Sample.ID")

#calculate normalization genes and spike
Data$Solaris <- 1/(2^Data$Solaris.Ct)*10^9
Data$Sym.GCP <- (1/(2^Data$Sym.GCP.Ct)*10^9)/((1/(2^Data$Host.GCP.Ct)*10^9)+(1/(2^Data$Sym.GCP.Ct)*10^9))
Data$Host.GCP <- (1/(2^Data$Host.GCP.Ct)*10^9)/((1/(2^Data$Host.GCP.Ct)*10^9)+(1/(2^Data$Sym.GCP.Ct)*10^9))

#calculate expression and normalize
Data$rbcL <- (1/(2^Data$rbcL.Ct)*10^9)/(Data$Solaris)/(Data$Sym.GCP)
Data$pgpase <- (1/(2^Data$pgpase.Ct)*10^9)/(Data$Solaris)/(Data$Sym.GCP)
Data$psI <- (1/(2^Data$psI.Ct)*10^9)/(Data$Solaris)/(Data$Sym.GCP)
Data$symHSP <- (1/(2^Data$Sym.hsp70.Ct)*10^9)/(Data$Solaris)/(Data$Sym.GCP)
Data$apx1 <- (1/(2^Data$apx1.Ct)*10^9)/(Data$Solaris)/(Data$Sym.GCP)
Data$nrt2 <- (1/(2^Data$nrt2.Ct)*10^9)/(Data$Solaris)/(Data$Sym.GCP)

pdf("/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/gene.expression.pdf")
par(mfrow=c(4,3))

rbcl <- aov(sqrt(rbcL)~Temperature*CO2, data=Data)
rbcl.s <- summary(rbcl)
qqnorm(rbcl$residuals)
qqline(rbcl$residuals)
hist(rbcl$residuals)
plot(rbcL ~ interaction(Temperature,CO2), data=Data)

pgpase <- aov(log10(pgpase)~Temperature*CO2, data=Data)
pgpase.s <- summary(pgpase)
qqnorm(pgpase$residuals)
qqline(pgpase$residuals)
hist(pgpase$residuals)
plot(pgpase ~ interaction(Temperature,CO2), data=Data)

psI <- aov(log10(psI)~Temperature*CO2, data=Data)
psI.s <- summary(psI)
qqnorm(psI$residuals)
qqline(psI$residuals)
hist(psI$residuals)
plot(psI ~ interaction(Temperature,CO2), data=Data)

symHSP <- aov(log10(symHSP)~Temperature*CO2, data=Data)
symHSP.s <- summary(symHSP)
qqnorm(symHSP$residuals)
qqline(symHSP$residuals)
hist(symHSP$residuals)
plot(symHSP ~ interaction(Temperature,CO2), data=Data)

apx1 <- aov(log10(apx1)~Temperature*CO2, data=Data)
apx1.s <- summary(apx1)
qqnorm(apx1$residuals)
qqline(apx1$residuals)
hist(apx1$residuals)
plot(apx1 ~ interaction(Temperature,CO2), data=Data)

nrt2 <- aov(log10(nrt2)~Temperature*CO2, data=Data)
nrt2.s <- summary(nrt2)
qqnorm(nrt2$residuals)
qqline(nrt2$residuals)
hist(nrt2$residuals)
plot(nrt2 ~ interaction(Temperature,CO2), data=Data)

dev.off()

capture.output( rbcl.s, pgpase.s, psI.s, symHSP.s, apx1.s, nrt2.s , file="/Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Output/gene.expression.stats.txt")





