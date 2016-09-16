r
#Analisi CAGEseq NOT USED FOR THE PAPER  ###########################################################################################################################################################################
################################################################################
################################################################################
##############################################################################

library(CAGEr)

#source("http://bioconductor.org/biocLite.R")
#biocLite("BSgenome.Hsapiens.UCSC.hg19")

library(BSgenome.Hsapiens.UCSC.hg19)
setwd("/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/")


input_Files= list("/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits738.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits638.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits662.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits667.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits669.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits670.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits695.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits739.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits653.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits685.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits704.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits705.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits706.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits747.bam.txt")

	
input_Files=as.character(input_Files)
basename(input_Files)
dirname(input_Files)

myCAGEset <- new("CAGEset", genomeName = "BSgenome.Hsapiens.UCSC.hg19",inputFiles = input_Files, inputFilesType = "ctss",sampleLabels= c("a638","a662","a667","a669","a670","a695","a739","h653","h685","h704","h705","h706","h747"))        

myCAGEset
getCTSS(myCAGEset)
ctss <- CTSStagCount(myCAGEset)
save.image()
head(ctss)
sampleLabels(myCAGEset)

plotReverseCumulatives(myCAGEset, onePlot = TRUE)
corr.m <- plotCorrelation(myCAGEset, samples = "all", method = "pearson")
plotReverseCumulatives(myCAGEset, fitInRange = c(5, 100000), onePlot = TRUE)
mergeSamples(myCAGEset, mergeIndex = c(1,2,1,2,1,1,3,3,3,3,3,3),mergedSampleLabels = c("ashtma","ashtma_treated","healthy"))
normalizeTagCount(myCAGEset, method = "powerLaw",fitInRange = c(5, 100000), alpha = 1.04, T = 1*10^7)

exportCTSStoBedGraph(myCAGEset, values = "normalized", oneFile = TRUE)

clusterCTSS(object = myCAGEset, threshold = 3, thresholdIsTpm = TRUE,nrPassThreshold = 1, method = "paraclu",removeSingletons = TRUE, keepSingletonsAbove = 5,useMulticore=TRUE,nrCores=8)

"a638","a662","a667","a669","a670","a695","a739","h653","h685","h704","h705","h706","h747


tc_a638 <- tagClusters(myCAGEset, sample = "a638")
tc_a662 <- tagClusters(myCAGEset, sample = "a662")
tc_a667 <- tagClusters(myCAGEset, sample = "a667")
tc_a669 <- tagClusters(myCAGEset, sample = "a669")
tc_a670 <- tagClusters(myCAGEset, sample = "a670")
tc_a695 <- tagClusters(myCAGEset, sample = "a695")
tc_a739 <- tagClusters(myCAGEset, sample = "a739")
tc_h653 <- tagClusters(myCAGEset, sample = "h653")
tc_h685 <- tagClusters(myCAGEset, sample = "h685")
tc_h704 <- tagClusters(myCAGEset, sample = "h704")
tc_h705 <- tagClusters(myCAGEset, sample = "h705")
tc_h706 <- tagClusters(myCAGEset, sample = "h706")
tc_h747 <- tagClusters(myCAGEset, sample = "h747")



write.table(tc_a638, file="a638.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_a662, file="a662.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_a667, file="a667.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_a669, file="a669.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_a670, file="a670.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_a695, file="a695.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_a739, file="a739.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_h653, file="h653.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_h685, file="h685.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_h704, file="h704.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_h705, file="h705.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_h706, file="h706.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_h747, file="h747.bed", quote=F, sep="\t", row.names=F, col.names=T)

#annoto tutti i bed file precedenti con solo i promoter -list human-p e filtro i dati per distanza dal tss =>-500 AND <=500 eliminando il chmMT che non Ã¨ annotato
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/a638.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a638_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/a662.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a662_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/a667.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a667_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/a669.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a669_annotated.txt; 
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/a670.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a670_annotated.txt; 
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/a695.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a695_annotated.txt; 
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/a739.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a739_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/h653.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h653_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/h685.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h685_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/h704.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h704_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/h705.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h705_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/h706.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h706_annotated.txt;
annotatePeaks.pl /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/h747.bed hg19 -list human-p -noann > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h747_annotated.txt


#carico tutte le tabelle generate da annotatePeaks ottenute dal tool HOMER
annotated_a638=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a638_annotated.txt",header=T, dec=".",sep="\t")
annotated_a662=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a662_annotated.txt",header=T, dec=".",sep="\t")
annotated_a667=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a667_annotated.txt",header=T, dec=".",sep="\t")
annotated_a669=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a669_annotated.txt",header=T, dec=".",sep="\t")
annotated_a670=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a670_annotated.txt",header=T, dec=".",sep="\t")
annotated_a695=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a695_annotated.txt",header=T, dec=".",sep="\t")
annotated_a739=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/a739_annotated.txt",header=T, dec=".",sep="\t")
annotated_h653=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h653_annotated.txt",header=T, dec=".",sep="\t")
annotated_h685=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h685_annotated.txt",header=T, dec=".",sep="\t")
annotated_h704=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h704_annotated.txt",header=T, dec=".",sep="\t")
annotated_h705=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h705_annotated.txt",header=T, dec=".",sep="\t")
annotated_h706=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h706_annotated.txt",header=T, dec=".",sep="\t")
annotated_h747=read.csv(file="/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/bed_CTSS_clustered_annotate/h747_annotated.txt",header=T, dec=".",sep="\t")


#colnames(annotated_a638)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X") 
#colnames(annotated_a662)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_a667)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_a669)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_a670)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_a695)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_a739)=c("chr","start","end","Strand","Annotation","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_h653)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_h685)=c("chr","start","end","Strand","Annotation","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_h704)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_h705)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_h706)=c("chr","start","end","Strand","Annotation","Gene.Name","Gene.Description","Gene.Type","X")
#colnames(annotated_h747)=c("chr","start","end","Strand","Annotation","Distance.to.TSS","Gene.Name","Gene.Description","Gene.Type","X")

#assegno i nomi alle colonne chr start end
colnames(annotated_a638)[2:4] <-c("chr","start","end")
colnames(annotated_a662)[2:4] <-c("chr","start","end")
colnames(annotated_a667)[2:4] <-c("chr","start","end")
colnames(annotated_a669)[2:4] <-c("chr","start","end")
colnames(annotated_a670)[2:4] <-c("chr","start","end")
colnames(annotated_a695)[2:4] <-c("chr","start","end")
colnames(annotated_a739)[2:4] <-c("chr","start","end")
colnames(annotated_h653)[2:4] <-c("chr","start","end")
colnames(annotated_h685)[2:4] <-c("chr","start","end")
colnames(annotated_h704)[2:4] <-c("chr","start","end")
colnames(annotated_h705)[2:4] <-c("chr","start","end")
colnames(annotated_h706)[2:4] <-c("chr","start","end")
colnames(annotated_h747)[2:4] <-c("chr","start","end")


#unisco le tabelle annotate con quelle generate dal processo di normalizzazione per le coordinate cromosomiche
a667_heat=merge(tc_a667,annotated_a667, by=c("chr","start","end"))
a662_heat=merge(tc_a662,annotated_a662, by=c("chr","start","end"))
a638_heat=merge(tc_a638,annotated_a638, by=c("chr","start","end"))
a669_heat=merge(tc_a669,annotated_a669, by=c("chr","start","end"))
a670_heat=merge(tc_a670,annotated_a670, by=c("chr","start","end"))
a695_heat=merge(tc_a695,annotated_a695, by=c("chr","start","end"))
a739_heat=merge(tc_a739,annotated_a739, by=c("chr","start","end"))
h653_heat=merge(tc_h653,annotated_h653, by=c("chr","start","end"))
h685_heat=merge(tc_h685,annotated_h685, by=c("chr","start","end"))
h704_heat=merge(tc_h704,annotated_h704, by=c("chr","start","end"))
h705_heat=merge(tc_h705,annotated_h705, by=c("chr","start","end"))
h706_heat=merge(tc_h706,annotated_h706, by=c("chr","start","end"))
h747_heat=merge(tc_h747,annotated_h747, by=c("chr","start","end"))

#filtro per la distanza dal TSS piu vicino per ogni *_heat
a667_fil=a667_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
a662_fil=a662_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
a638_fil=a638_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
a669_fil=a669_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
a670_fil=a670_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
a695_fil=a695_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
a739_fil=a739_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
h653_fil=h653_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
h685_fil=h685_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
h704_fil=h704_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
h705_fil=h705_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
h706_fil=h706_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)
h747_fil=h747_heat%>% filter(Distance.to.TSS > -500 & Distance.to.TSS < 500) %>% arrange(chr,start)

#genero tabelle per ogni campione aventi le caratteristiche che mi servono per gli step successivi
a667_useful=as.data.frame(cbind(as.integer(a667_fil$Distance.to.TSS), a667_fil$tpm, as.character(a667_fil$Gene.Name)))
a662_useful=as.data.frame(cbind(as.integer(a662_fil$Distance.to.TSS), a662_fil$tpm, as.character(a662_fil$Gene.Name)))
a638_useful=as.data.frame(cbind(as.integer(a638_fil$Distance.to.TSS), a638_fil$tpm, as.character(a638_fil$Gene.Name)))
a669_useful=as.data.frame(cbind(as.integer(a669_fil$Distance.to.TSS), a669_fil$tpm, as.character(a669_fil$Gene.Name)))
a670_useful=as.data.frame(cbind(as.integer(a670_fil$Distance.to.TSS), a670_fil$tpm, as.character(a670_fil$Gene.Name)))
a695_useful=as.data.frame(cbind(as.integer(a695_fil$Distance.to.TSS), a695_fil$tpm, as.character(a695_fil$Gene.Name)))
a739_useful=as.data.frame(cbind(as.integer(a739_fil$Distance.to.TSS), a739_fil$tpm, as.character(a739_fil$Gene.Name)))
h653_useful=as.data.frame(cbind(as.integer(h653_fil$Distance.to.TSS), h653_fil$tpm, as.character(h653_fil$Gene.Name)))
h704_useful=as.data.frame(cbind(as.integer(h704_fil$Distance.to.TSS), h704_fil$tpm, as.character(h704_fil$Gene.Name)))
h705_useful=as.data.frame(cbind(as.integer(h705_fil$Distance.to.TSS), h705_fil$tpm, as.character(h705_fil$Gene.Name)))
h706_useful=as.data.frame(cbind(as.integer(h706_fil$Distance.to.TSS), h706_fil$tpm, as.character(h706_fil$Gene.Name)))
h747_useful=as.data.frame(cbind(as.integer(h747_fil$Distance.to.TSS), h747_fil$tpm, as.character(h747_fil$Gene.Name)))
h685_useful=as.data.frame(cbind(as.integer(h685_fil$Distance.to.TSS), h685_fil$tpm, as.character(h685_fil$Gene.Name)))

#seleziono per ogni gene quello avente il tpm piu alto da utilizzare come chiave univoca per la tabella da utilizzare nella creazione dell'heatmap
a667_key=ddply(a667_useful, "V3", function(a667_useful) { a667_useful[order(a667_useful$V2, decreasing=FALSE), ][1,] })
a662_key=ddply(a662_useful, "V3", function(a662_useful) { a662_useful[order(a662_useful$V2, decreasing=FALSE), ][1,] })
a638_key=ddply(a638_useful, "V3", function(a638_useful) { a638_useful[order(a638_useful$V2, decreasing=FALSE), ][1,] })
a669_key=ddply(a669_useful, "V3", function(a669_useful) { a669_useful[order(a669_useful$V2, decreasing=FALSE), ][1,] })
a670_key=ddply(a670_useful, "V3", function(a670_useful) { a670_useful[order(a670_useful$V2, decreasing=FALSE), ][1,] })
a695_key=ddply(a695_useful, "V3", function(a695_useful) { a695_useful[order(a695_useful$V2, decreasing=FALSE), ][1,] })
a739_key=ddply(a739_useful, "V3", function(a739_useful) { a739_useful[order(a739_useful$V2, decreasing=FALSE), ][1,] })
h653_key=ddply(h653_useful, "V3", function(h653_useful) { h653_useful[order(h653_useful$V2, decreasing=FALSE), ][1,] })
h704_key=ddply(h704_useful, "V3", function(h704_useful) { h704_useful[order(h704_useful$V2, decreasing=FALSE), ][1,] })
h705_key=ddply(h705_useful, "V3", function(h705_useful) { h705_useful[order(h705_useful$V2, decreasing=FALSE), ][1,] })
h706_key=ddply(h706_useful, "V3", function(h706_useful) { h706_useful[order(h706_useful$V2, decreasing=FALSE), ][1,] })
h747_key=ddply(h747_useful, "V3", function(h747_useful) { h747_useful[order(h747_useful$V2, decreasing=FALSE), ][1,] })
h685_key=ddply(h685_useful, "V3", function(h685_useful) { h685_useful[order(h685_useful$V2, decreasing=FALSE), ][1,] })

main_table=merge(a667_key,a662_key,by="V3")
main_table=merge(main_table,a638_key,by="V3")
main_table=merge(main_table,a669_key,by="V3")
main_table=merge(main_table,a670_key,by="V3")
main_table=merge(main_table,a695_key,by="V3")
main_table=merge(main_table,a739_key,by="V3")
main_table=merge(main_table,h653_key,by="V3")
main_table=merge(main_table,h704_key,by="V3")
main_table=merge(main_table,h705_key,by="V3")
main_table=merge(main_table,h706_key,by="V3")
main_table=merge(main_table,h747_key,by="V3")
main_table=merge(main_table,h685_key,by="V3")


colnames(main_table)=c("Gene","V1.x","a667_tpm","V1.y","a662_tpm","V1.x","a638_tpm","V1.y","a669_tpm","V1.x","a670_tpm","V1.y","a695_tpm","V1.x","a739_tpm","V1.y","h653_tpm","V1.x","h704_tpm","V1.y","h705_tpm","V1","h706_tpm","c","h747_tpm","d","h685_tpm")
#######################################################################
#######################################################################
#######################################################################


#CAGEseq differential analysis performed through EDGEr (This is used for the paper)
library(CAGEr)


library(BSgenome.Hsapiens.UCSC.hg19)
setwd("/mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/")
input_Files= list("/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits738.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits638.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits662.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits667.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits669.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits670.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits695.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits739.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits653.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits685.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits704.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits705.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits706.bam.txt","/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/BAM_convertiti_in_CTSS/concatenate_accepted_hits747.bam.txt")

input_Files=as.character(input_Files)
basename(input_Files)
dirname(input_Files)

myCAGEset <- new("CAGEset", genomeName = "BSgenome.Hsapiens.UCSC.hg19",inputFiles = input_Files, inputFilesType = "ctss",sampleLabels= c("a738","a638","a662","a667","a669","a670","a695","a739","h653","h685","h704","h705","h706","h747"))        

myCAGEset
getCTSS(myCAGEset)
ctss <- CTSStagCount(myCAGEset)
head(ctss)
sampleLabels(myCAGEset)

normalizeTagCount(myCAGEset, method = "none")
clusterCTSS(object = myCAGEset, threshold = 3, thresholdIsTpm = FALSE, nrPassThreshold = 4, method = "paraclu", removeSingletons = FALSE, useMulticore = T, nrCores = 16)
aggregateTagClusters(myCAGEset, tpmThreshold = 0, qLow = NULL , qUp = NULL, maxDist = 100)
head(myCAGEset@consensusClustersTpmMatrix)
to_edger <- myCAGEset@consensusClustersTpmMatrix
dim(to_edger)
for_edger_consensus_cluster <- consensusClusters(myCAGEset)
for_edger_consensus_cluster$id <- paste(for_edger_consensus_cluster$chr, for_edger_consensus_cluster$start, for_edger_consensus_cluster$end, for_edger_consensus_cluster$strand, sep="_")
d <- to_edger
rownames(d) <- for_edger_consensus_cluster$id
library(edgeR)
group <- c(rep("Ashtma",8),rep("Healthy",6))

#creo l'oggetto DGElist fondamentale in edger per ottenere l analisi differenziale
d <- DGEList(counts = d, group=group)

#normalizzo (metodo TMM) il mio set di raw read count associati ad ogni coordinata cromosomica per mezzo di scaling factors che permettono di confrontare i log fold change tra i vari campioni (output object$samples)
#il factor =1 indica una vicinanza tra il set di campioni
d <- calcNormFactors(d)

d <- estimateCommonDisp(d, verbose=T)
d <- estimateTagwiseDisp(d)
#de.poi <- exactTest( d , dispersion = 1e-06 , pair = c( "Ashtma" , "Healthy" ) )

de.tgw <- exactTest(d,pair=c("Healthy", "Ashtma"))
summary(decideTestsDGE(de.tgw, p.value=0.01))

top.tags=topTags(de.tgw, n=2000, adjust.method="BH", sort.by="PValue")
edgeR.hits <- top.tags$table[top.tags$table$PValue< 0.005,] 
write.table(table, file="pvalue_filtered.csv", quote=F, sep="\t", row.names=T, col.names=T)
#decideTestsDGE(de.tgw, adjust.method="BH", p.value=0.05, lfc=0)

detags= rownames(edgeR.hits)
tab_to_heat=cpm(d)[detags,]
#scrivere file in csv nella maniera corretta
write.table(table, file="toptags_DF_ashtma.csv", quote=F, sep="\t", row.names=T, col.names=T)

#siccome le coordinate sono spaziate da _ le sostituisco con TAB in questa maniera. Nel caso in cui di file csv, sostituire il TAB con ,
sed 's/_/  /g' /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/toptags_DF_ashtma.csv > /mnt/NFS_SHARE_3/CAGEr_Analysis/SAMPLES_Analysis/right_coordinates.csv

######################### UTILITIES ############################
##############################################################################################################
#settare una specifica colonna verso come rownames
samp2 <- to_heat[,-14]
rownames(samp2) <- to_heat[,14]


#HEATMAP MEDIAN CENTERED SCRIPT USED FOR THE PAPER
library(RColorBrewer)
library(gplots)
library(matrixStats)
a = log2(a+1)
a = a - rowMedians(a)
colors = c(seq(-2,-0.01,length=200),seq(0.01,2,length=200))
my_palette <- colorRampPalette(c("green", "black", "red"))(n = 399)


hr <- hclust(as.dist(1-cor(t(a), method="kendal")), method="ward.D")
hc <- hclust(as.dist(1-cor(a, method="kendall")), method="ward.D") 
mycl <- cutree(hr, h=max(hr$height)/1.5); 
mycol <- sample(rainbow(256)); 
mycol <- mycol[as.vector(mycl)];
group = as.vector(c(rep("blue",8),rep("red",6)))

tiff("heatmap_complete_asProf2ttttt_want.tiff",width=10,height=10, units= "in", res=300)
heatmap.2(as.matrix(a), Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc),labRow=FALSE,ColSideColors=group,col=my_palette,breaks=colors, density.info="none", trace="none",symm=F,symkey=F,symbreaks=T, scale="none",margin=c(10,10), keysize=2)
dev.off()


#####################################################################
#####################################################################
#####################################################################
#####################################################################

#Grafici aggiuntivicon CAGEr

#write.table(tc_ashtma, file="ashtma.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_ashtma_treated, file="ashtma_treated.bed", quote=F, sep="\t", row.names=F, col.names=T)
write.table(tc_healthy, file="healthy.bed", quote=F, sep="\t", row.names=F, col.names=T)
exportToBed(object = myCAGEset, what = "tagClusters",qLow = 0.1, qUp = 0.9, oneFile = TRUE)

cumulativeCTSSdistribution(myCAGEset, clusters = "tagClusters")
quantilePositions(myCAGEset, clusters = "tagClusters", qLow = 0.1, qUp = 0.9)
plotInterquantileWidth(myCAGEset, clusters = "tagClusters", tpmThreshold = 3, qLow = 0.1, qUp = 0.9)



aggregateTagClusters(myCAGEset, tpmThreshold = 2, qLow = NULL , qUp = NULL, maxDist = 100)
consensus_tc <- consensusClusters(myCAGEset)
plotExpressionProfiles(myCAGEset, what = "consensusClusters")

class0_0 <- extractExpressionClass(myCAGEset, what = "consensusClusters", which = "0_0")

exportToBed(myCAGEset, what = "consensusClusters", colorByExpressionProfile = TRUE)



########cluster dendogram of normalized data merged by end of chromosome##########################################
total_tpm=cbind(healthy,ashtma,ashtma_treated)
 traspose=t(total_tpm)
 plot(hclust(dist(traspose)))

a=main_table_log
traspose=t(a)
plot(hclust(dist(traspose),method="complete"))

###################clustering con hcluster (piu opzioni)#########################################################
a=main_table_log
traspose=t(a)
plot(hcluster(traspose, method = "euclidean", diag = FALSE, upper = FALSE,
         link = "complete", members = NULL, nbproc = 2,
         doubleprecision = TRUE))

pairs(data=a,
   main="Simple Scatterplot Matrix")

plotCorrelation(main_table,samples = "all", method = "pearson", applyThresholdBoth = FALSE)

##############################################pca##############################################################
library(ggplot2)

pca = prcomp(t(main_table_log))
condition = c(rep("ASHTMA",7),rep("HEALTHY",6))
scores = as.data.frame(pca$x)

V = (pca$sdev^2 / sum(pca$sdev^2))*100

ggplot(data = scores, aes(x = PC1, y = PC2,color=condition,label = rownames(scores)))+
  geom_hline(yintercept = 0, colour = "gray65") +
  geom_vline(xintercept = 0, colour = "gray65") +
  xlab(paste0("PC1: ",round(V[1],2),"% variance"))+
  ylab(paste0("PC2: ",round(V[2],2),"% variance"))+
  geom_text(size = 4)+
  geom_point(size=1) 

#heatmap
library(RColorBrewer)
#hmcol = colorRampPalette(brewer.pal(7, "RdYlBu"))(100)
hmcol = colorRampPalette(c("green", "black", "red"))(n = 100)

hr <- hclust(as.dist(1-cor(t(main_table_log), method="pearson")), method="complete") 
hc <- hclust(as.dist(1-cor(main_table_log, method="pearson")), method="complete") 

mycl <- cutree(hr, h=max(hr$height)/1.5); 
mycol <- sample(rainbow(256)); 
mycol <- mycol[as.vector(mycl)]; 
heatmap(main_table_log, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=hmcol, scale="row", ColSideColors=heat.colors(length(hc$labels)), RowSideColors=mycol) 

library("RColorBrewer")
library("gplots")
hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
distsRL <- dist(t(assay(main_table_log)))
mat <- as.matrix(distsRL)
hc <- hclust(distsRL)
heatmap.2(mat, Rowv=as.dendrogram(hc),symm=TRUE, trace="none",col = rev(hmcol), margin=c(13, 13))


