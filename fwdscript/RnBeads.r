#Analisi RnBeads step by step
library(RnBeads)
idat.dir<-file.choose() #path dei file .idat
idat.dir= dirname(idat.dir) #prendo la cartella
idat.dir
analysis.dir=getwd()#cartella di lavoro
report.dir <- file.path(analysis.dir, "reports_detail") #creo una nuova cartella report_details in cui inserire i risultati passo passo

sample.annotation=file.choose()#sample sheet
data.source <- c(idat.dir, sample.annotation)
result <- rnb.run.import(data.source=data.source, data.type="infinium.idat.dir", dir.reports=report.dir)  #carico il dataset nella variabile result
rnb.set <- result$rnb.set #rappresenta il dataset ,questa variabile racchiude molte caratteristiche inerenti il dataset da poter esplorare

# I accept for the analysis probes with a p-value > 0.01 in any sample
any.bad.p.val <- apply(dpval(rnb.set)>0.01, 1, any)
rnb.set3 <- remove.sites(rnb.set, any.bad.p.val) #rimuove le probes con alto valore p-value dal dataset
rnb.set=rnb.set3

#inizia il controllo qualitÃƒ 
rnb.run.qc(rnb.set, report.dir)

#preprocessamento dei dati
rnb.set.unfiltered <- rnb.set
nrow(meth(rnb.set.unfiltered)) #numero di probes
rnb.set.filtered <- rnb.execute.context.removal(rnb.set.unfiltered)$dataset#rimozione probes fuori dal contesto CpG
nrow(meth(rnb.set.filtered))
rnb.set.filtered <-rnb.execute.snp.removal(rnb.set.filtered, snp="any")$dataset   #filtraggio SNP
rnb.set.filtered <- rnb.execute.sex.removal(rnb.set.filtered)$dataset #rimozione cpg cromosomi sessuali
nrow(meth(rnb.set.filtered))
rnb.set=rnb.set.filtered
rnb.set.filtered <- rnb.execute.na.removal(rnb.set.filtered)$dataset #rimozione na presenti
rnb.set.filtered <-rnb.execute.variability.removal(rnb.set.filtered, 0.005)$dataset #beta value inferiore 0.005
nrow(meth(rnb.set.filtered))
rnb.set= rnb.set.filtered
rnb.set.norm <- rnb.execute.normalization(rnb.set, method="bmiq",bgcorr.method="methylumi.noob")
#Normalization to internal controls methylumi "illumina" [11, 8]
#SWAN minfi "swan" [4, 9]
#â€ Data-drivenâ€  normalization wateRmelon "wm.*" a
#Functional normalization minfi minfi.funnorm [18, 9]
#BMIQ BMIQ "bmiq" b
#Background correction (normalization.background.method=)NOOB methylumi "methylumi.noob" [11, 8]Lumi methylumi "methylumi.lumi" [11, 8]

rnb.set = rnb.set.norm
#analisi esploratoria, crea un report che lascia ispezionare le associazioni di metilazione tra i vari campioni con PCA plot, MDS plot, volcano plot, regional methylation profiles
rnb.run.exploratory(rnb.set, report.dir)
#differential methylation analysis
analisi_diff=rnb.run.differential(rnb.set, report.dir)




#Generating Density-Scatterplots con RnBeads
comparison <- "C vs T (based on Sample_Group)"
dframe <- get.table(diffmeth, comparison, "sites", return.data.frame=TRUE)
# define the probes with an FDR corrected p-value below 0.05
# as differentially methylated
isDMP <- dframe[,"diffmeth.p.adj.fdr"] < 0.05
create.densityScatter(dframe, is.special=isDMP, sparse.points=0.001,
                      add.text.cor=TRUE) + labs(x="mean beta: C", y="mean beta: T") +
  coord_fixed()

  
  
#clustering RnBeads
clusterings.sites <- rnb.execute.clustering(rnb.set, region.type="sites")
X <- meth(rnb.set, type="sites")[1:100, ]
#cambiare colnames di X con
cresult <- clusterings.sites[[5]]@result #complete, manhattan
label_set=rnb.set@pheno
new_label=cbind(label_set[,1],label_set[,8] )
cresult$labels=new_label[,1]
#cambiare colnames di X con il set label preso da rnb.set@pheno(ossia le colonne di x devo chiamarsi col il sample_name. Utilizzare strsplit(lista,", )ed aggiustare)
attr(cresult, "class") <- "hclust"
cresult <- as.dendrogram(cresult)
pdf(file="sites_heatmap.pdf")
heatmap.2(X, Rowv=F, Colv=cresult, dendrogram="column", col=greenred (10),
          scale="none", trace="none",cexCol=0.6, labRow=NA,offsetCol = 0.3,  )
dev.off()  
  
  
  
  
  
  
  
  