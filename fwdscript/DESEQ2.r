library(DESeq2)

# countData = as.matrix(MyTable)
# condition = c(rep("CTRL",14),rep("DCM",20))
# colData = data.frame(names(MyTable),condition)
# dds = DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~condition)
# dds$condition
# dds=DESeq(dds)
# res = results(dds)

directory = "C://Users/local_admin/Desktop/Project_Ines_Barone/HTSeq/"
sampleFiles = grep("DCM",list.files(directory),value=TRUE)
sampleName <- sub("Sample_","\\1",sub(".txt","\\1",sampleFiles))
sampleCond = c(rep("C",3),rep("GW",3))
sampleTable = data.frame(sampleName=sampleName, fileName=sampleFiles, condition=sampleCond)
ddsHtseq = DESeqDataSetFromHTSeqCount(sampleTable=sampleTable,directory=directory,design=~condition)
ddsHtseq$condition
ddsHtseq=DESeq(ddsHtseq)
res = results(ddsHtseq)
write.table(res,"C://Users/local_admin/Desktop/Project_Ines_Barone/DESeq2/CAFs_DiffAnalysis.txt",sep="\t")

rld <- rlog(ddsHtseq)
#vsd <- varianceStabilizingTransformation(ddsHtseq)


#PCA plot
plotPCA(rld)

library("ggplot2")
data <- plotPCA(rld,returnData=TRUE)
percentVar <- round(100 * attr(data, "percentVar"))
ggplot(data, aes(PC1, PC2,color=condition))+
#geom_point(size=3) +
xlab(paste0("PC1: ",percentVar[1],"% variance"))+
ylab(paste0("PC2: ",percentVar[2],"% variance"))+
geom_text(size=3,aes(label=sampleName))


resSig <- subset(res, padj < 0.1)

mat <- assay(rld)[ rownames(resSig), ]
mat <- mat - rowMedians(mat)


#Euclidean Distance
library("RColorBrewer")
library("gplots")
hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
distsRL <- dist(t(assay(rld)))
mat <- as.matrix(distsRL)
hc <- hclust(distsRL)
heatmap.2(mat, Rowv=as.dendrogram(hc),symm=TRUE, trace="none",col = rev(hmcol), margin=c(13, 13))

#Poisson Distance
library("PoiClaClu")
poisd <- PoissonDistance(t(counts(dds)))
samplePoisDistMatrix <- as.matrix( poisd$dd )
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
hc <- hclust(poisd$dd)
rownames(samplePoisDistMatrix) <- colnames(samplePoisDistMatrix) <- sampleName
heatmap.2( samplePoisDistMatrix, Rowv=as.dendrogram(hc),
          symm=TRUE, trace="none", col=colors,
          margins=c(13,13))
		  
		  



#Analysis multi-factor
sampleType = c()
sampleTable = data.frame(sampleName=sampleName, fileName=sampleFiles, condition=sampleCond,type = smapleType)
des = formula(~ type + condition)
ddsHtseq = DESeqDataSetFromHTSeqCount(sampleTable=sampleTable,directory=directory,design=des)

plotPCA(rld, intgroup=c("condition", "type"))
It is also possible to customize the PCA plot using the ggplot function.
data <- plotPCA(rld, intgroup=c("condition", "type"), returnData=TRUE)
percentVar <- round(100 * attr(data, "percentVar"))
ggplot(data, aes(PC1, PC2, color=condition, shape=type)) +
geom_point(size=3) +
xlab(paste0("PC1: ",percentVar[1],"% variance")) +
ylab(paste0("PC2: ",percentVar[2],"% variance"))