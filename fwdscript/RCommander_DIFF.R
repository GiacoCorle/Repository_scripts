
countsTable <- read.table("/home/antony/Scrivania/Output3/MFBC3_0h_VS_MFBC3_72h.dat")

matrixTable <- as.matrix(countsTable)

head(countsTable)

#Normalization quantile
library(limma)
normLimma <- normalizeBetweenArrays(matrixTable, method="quantile")
write.csv(normLimma,"/home/antony/Scrivania/ris_NORM.csv")

#Noiseq
source("/home/antony/R/noiseq.r")
mydata <- readData(file = "DataFile.txt", cond1 = c(2:3), cond2 = c(4:5), header = TRUE)  
myresults <- noiseq(mydata[[2]], mydata[[1]],repl = "tech",norm = "n", k=NULL)
write.csv(myresults,"/home/antony/Scrivania/ris_Noiseq.csv")

#Fisher
risFisher <- fisher.ngs(mydata[[1]], mydata[[2]],norm = "n")
write.csv(risFisher,"/home/antony/Scrivania/ris_Fisher.csv")

#Parametri da aggiungere per simulazione repilicati
pnr = 0.2, nss = 5, v = 0.02 

#DESeq
library(DESeq)
cds <- newCountDataSet( countsTable, conds )
cds <- estimateSizeFactors( cds )
cnorm <- counts(cds,normalized=TRUE)
cds <- estimateDispersions(cds)
plotDispEsts(cds)
vsd <- varianceStabilizingTransformation(cds)
plotPCA(vsd)
vsd2 <- getVarianceStabilizedData(cds)
dists <- dist(t(vsd2))
library(gplots)
heatmap.2(as.matrix(dists),symm=TRUE,trace="none")
res <- nbinomTest( cds, "W", "M")
plotMA(res,col = ifelse(res$pval>=0.05, "black", "red3"))
abline(h=c(-1,1),col="blue")
hist(res$pval,breaks=100,col="skyblue",border="slateblue",main="")
write.table(res,"res.txt",sep="\t")


#edgeR
library(edgeR)
# targets <- readTargets()
# targets
# d <- readDGE(targets)
# d$sample
# head(d$counts)
# keep <- rowSums(cpm(d)>1) >=8
# dim(d)
# d <- d[keep,]
# dim(d)
# d$samples$lib.size <- colSums(d$counts)
# d$samples
d = DGEList(countsTable,cond)
d <- calcNormFactors(d)
plotMDS(d)
d <- estimateCommonDisp(d,verbose=TRUE)
d <- estimateTagwiseDisp(d)
plotBCV(d)
et <- exactTest(d,pair=c("wild","mutant"))
topTags(et)
summary(de <- decideTestsDGE(et,p=0.05,adjust="BH"))
detags <- rownames(d)[as.logical(de)]
head(detags)
plotSmear(et,de.tags=detags)
abline(h=c(-1,1),col="blue")
write.table(detags,"detags.txt",sep="\t")
write.table(et$table,"exactTest.txt",sep="\t")
# export Normalized counts table to a file 
write.table(d$pseudo.alt, file="TMM_edgeR_Normalized.test.exp.txt", row.names = TRUE, col.names = TRUE, sep = "\t" )