library("ChAMP", lib.loc="~/R/win-library/3.1")
library("ChAMPdata", lib.loc="~/R/win-library/3.1")
library("DNAcopy", lib.loc="~/R/win-library/3.1")
library("impute", lib.loc="~/R/win-library/3.1")
library("marray", lib.loc="~/R/win-library/3.1")
library("preprocessCore", lib.loc="~/R/win-library/3.1")
library("RPMM", lib.loc="~/R/win-library/3.1")
library("sva", lib.loc="~/R/win-library/3.1")
library("IlluminaHumanMethylation450kmanifest", lib.loc="~/R/win-library/3.1")
library("wateRmelon", lib.loc="~/R/win-library/3.1")

testDir=system.file("extdata",package="ChAMPdata") #carico il dataset cercandolo con il suo nome utilizzando system.file
getwd() 

myLoad=champ.load(directory = testDir) #carico il dataset con il path di testDir
#champ.load(directory = getwd(), methValue = "B", resultsDir = paste(getwd(),
#"resultsChamp", sep = "/"), filterXY = TRUE, QCimages = TRUE, filterDetP = TRUE,
#detPcut = 0.01, removeDetP = 0, filterBeads=TRUE, beadCutoff=0.05, filterNoCG=FALSE)

myNorm=champ.norm( filterXY = FALSE) #normalizzazione con default BMIQ
#champ.norm(beta = myLoad$beta, rgSet = myLoad$rgSet, pd = myLoad$pd, mset = myLoad$mset,
#sampleSheet = "sampleSheet.txt", resultsDir = paste(getwd(), "resultsChamp",
#sep = "/"), methValue = "B", fromIDAT = TRUE, norm = "BMIQ", fromFile = FALSE, betaFile,
#filter = TRUE, filterXY = TRUE, QCimages = TRUE, plotBMIQ = TRUE)

champ.SVD() #singular value decomposition method

batchNorm = champ.runCombat() #corregge i batch effect
limma = champ.MVP(beta.norm = batchNorm$beta, pd = myLoad$pd, adjPVal = 0.05, adjust.method = "BH",
                  compare.group = c("C", "T"), resultsDir = paste(getwd(), "resultsChamp", sep = "/"),
                  bedFile = TRUE)
#champ.MVP(beta.norm = myNorm$beta, pd = myLoad$pd, adjPVal = 0.05, adjust.method = "BH",
#compare.group = c("C", "T"), resultsDir = paste(getwd(), "resultsChamp", sep = "/"),
#bedFile = TRUE)

lasso=champ.lasso(fromFile=TRUE, limma=limma, image=TRUE,bedFile=TRUE)
#champ.lasso(fromFile = FALSE, uploadResults = FALSE, uploadFile = "limma.txt", limma,
#beta.norm = myNorm$beta, pd = myLoad$pd, filterXY = TRUE, image = TRUE, mafPol.lower = 0,
#mafPol.upper = 0.05, popPol = "eur", lassoStyle = "max", lassoRadius = 2000,
#minSigProbesLasso = 3, minDmrSep = 1000, minDmrSize = 0, adjPVal = 0.05,
#adjust.method = "BH", resultsDir = paste(getwd(), "resultsChamp", sep = "/"),
#bedFile = TRUE, DMRpval = 0.05, batchDone = FALSE, normSave)             

CNA=champ.CNA()