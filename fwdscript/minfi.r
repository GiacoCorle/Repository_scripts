#minfi
require(minfi)
require(minfiData)

baseDir=file.choose()
baseDir= "C:\\Users\\local_admin\\Desktop\\Ottini_22-01-2015\\Dataset_e_sample_utilizzato"
#tagliare il path baseDir puntante sulla cartella, non sui file
#baseDir <- system.file("extdata", package = "ChAMPdata")
list.files(baseDir)
targets <- read.450k.sheet(baseDir)
#carico gli idat nell'oggetto RGSet
RGSet <- read.450k.exp(base = baseDir, targets = targets) #
#visualizzo sample sheet
phenoData <- pData(RGSet)
pd <- pData(RGSet)
#RGSet=preprocessRaw(RGSet)
detP <- detectionP(RGSet)
failed <- detP > 0.01
failedProbes <-rownames(failed)[rowMeans(failed)>0.01]  
sum(rowMeans(failed)>0.01)
RGSet<- RGSet[!rownames(RGSet)%in% failedProbes] 
#QC
qcReport(RGset, sampNames = pd$Sample_Name,sampGroups = pd$Sample_Group, pdf = "qcReport1.pdf")	
#normalizzazione SWAN o qualsiasi altra da applicare
MSet <- preprocessRaw(RGSet)
#gset.quantile <- preprocessQuantile(RGSet, fixOutliers = TRUE,removeBadSamples = TRUE, badSampleCutoff = 10.5,quantileNormalize = TRUE, stratified = TRUE,mergeManifest = FALSE, sex = NULL)
qc <- getQC(MSet)
plotQC(qc)
densityPlot(MSet, sampGroups = phenoData$Sample_Group)
densityBeanPlot(MSet, sampGroups = phenoData$Sample_Group)
qcReport(RGSet, pdf= "qcReport.pdf")

#normalizzazione batch effect
quality_c=minfiQC(MSet, fixOutliers = TRUE, verbose = TRUE) 
plotQC(quality_c$qc)
densityPlot(MSet, sampGroups = phenoData$Sample_Group)

#ricavo Beta e M value
ratioSet <- ratioConvert(MSet, what = "both", keepCN = TRUE)
#mappo ratioset all'annotazione
gset <- mapToGenome(ratioSet)
#stabilisco chi confrontare
pheno <- pData(gset)$Sample_Group
#matrice necessaria da inviare a bumphunter
designMatrix <- model.matrix(~ pheno)
#lancio bumphunter
dmrs <- bumphunter(gset, design = designMatrix,cutoff = 0.2, B=1, type="Beta",verbose=T)

.




































