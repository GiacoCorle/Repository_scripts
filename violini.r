#make intersactions
bedtools intersect -wb  -a /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_018_Normal_vs_Metastatic.txt  -b /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_018_Normal_vs_Primary.txt > /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_018_N_Met_vs_N_Pri
dyn1107-151:~ giacomino$ bedtools intersect -wb  -a /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_020_Normal_vs_Metastatic.txt  -b /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_020_Normal_vs_Primary.txt > /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_020_N_Met_vs_N_Pri
dyn1107-151:~ giacomino$ bedtools intersect -wb  -a /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_026_Normal_vs_Metastatic.txt  -b /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_026_Normal_vs_Primary.txt > /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_026_N_Met_vs_N_Pri
ERROR: Received illegal bin number 262143 from getBin call.
ERROR: Unable to add record to tree.
dyn1107-151:~ giacomino$ bedtools intersect -wb  -a /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_034_Normal_vs_Metastatic.txt  -b /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_034_Normal_vs_Primary.txt > /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_034_N_Met_vs_N_Pri
















#violin plot allelic fraction
library(ggrepel)
library(ggplot2)
require(gridExtra)
s_18_N_M=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_018_Normal_vs_Metastatic.txt") #file con tadprobes and center
s_20_N_M=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_020_Normal_vs_Metastatic.txt") #file delle mutazioni keep intersected con le probes tad.
s_26_N_M=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_026_Normal_vs_Metastatic.txt")
s_34_N_M=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_034_Normal_vs_Metastatic.txt")
s_18_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_018_Normal_vs_Primary.txt") #file con tadprobes and center
s_20_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_020_Normal_vs_Primary.txt") #file delle mutazioni keep intersected con le probes tad.
s_26_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_026_Normal_vs_Primary.txt")
s_34_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/sample_034_Normal_vs_Primary.txt")

s_18_af=s_18_N_M$V19
s_20_af=s_20_N_M$V19
s_26_af=s_26_N_M$V19
s_34_af=s_34_N_M$V19

s_18_af_2=s_18_N_P$V19
s_20_af_2=s_20_N_P$V18
s_26_af_2=s_26_N_P$V18
s_34_af_2=s_34_N_P$V18

int_18_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_018_N_Met_vs_N_Pri")
int_20_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_020_N_Met_vs_N_Pri")
int_26_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_026_N_Met_vs_N_Pri") #problem
int_34_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/mutect/keep/intersaction_intrapatient/sample_034_N_Met_vs_N_Pri")

int_18_N_M_int_N_P_af=as.data.frame(cbind(int_18_N_M_int_N_P$V1,int_18_N_M_int_N_P$V2,int_18_N_M_int_N_P$V3,int_18_N_M_int_N_P$V55,int_18_N_M_int_N_P$V19))
int_20_N_M_int_N_P_af=as.data.frame(cbind(int_20_N_M_int_N_P$V1,int_20_N_M_int_N_P$V2,int_20_N_M_int_N_P$V3,int_20_N_M_int_N_P$V55,int_20_N_M_int_N_P$V19))
int_26_N_M_int_N_P_af=as.data.frame(cbind(int_26_N_M_int_N_P$V1,int_26_N_M_int_N_P$V2,int_26_N_M_int_N_P$V3,int_26_N_M_int_N_P$V55,int_26_N_M_int_N_P$V19))
int_34_N_M_int_N_P_af=as.data.frame(cbind(int_34_N_M_int_N_P$V1,int_34_N_M_int_N_P$V2,int_34_N_M_int_N_P$V3,int_34_N_M_int_N_P$V55,int_34_N_M_int_N_P$V19))


#violin of allelic frequencies sample by sample
pdf(file="allelic_frequencies.pdf",width=20, heigh=8)

o=ggplot2.violinplot(data=s_18_af_2,mainTitle='18_N_P',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(s_18_af_2)))    
      
m=ggplot2.violinplot(data=s_20_af_2,mainTitle='20_N_P',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(s_20_af_2)))
n=ggplot2.violinplot(data=s_26_af_2,mainTitle='26_N_P',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(s_26_af_2)))
d=ggplot2.violinplot(data=s_34_af_2,mainTitle='34_N_P',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1))  + geom_text(aes(1.4, .9, label=length(s_34_af_2)))    
g=ggplot2.violinplot(data=s_18_af,mainTitle='18_N_M',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(s_18_af)))
i=ggplot2.violinplot(data=s_20_af,mainTitle='20_N_M',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(s_20_af)))
a=ggplot2.violinplot(data=s_26_af,mainTitle='26_N_M',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(s_26_af)))
c=ggplot2.violinplot(data=s_34_af,mainTitle='34_N_M',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(s_34_af)))     
grid.arrange(o,m,n,d,g,i,a,c,ncol=4,nrow=2)
dev.off()

#violin allelic frequencies intersected Normale_met against Normal_Primary
pdf(file="allelic_frequencies_intersect.pdf",width=22, heigh=5)
o=ggplot2.violinplot(data=int_18_N_M_int_N_P_af$V1,mainTitle='18_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_18_N_M_int_N_P_af$V1)))+ geom_jitter(shape=16, position=position_jitter(0.3))   
d=ggplot2.violinplot(data=int_18_N_M_int_N_P_af$V2,mainTitle='18_N_M_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_18_N_M_int_N_P_af$V2)))+ geom_jitter(shape=16, position=position_jitter(0.3))    
f=ggplot2.violinplot(data=int_20_N_M_int_N_P_af$V1,mainTitle='20_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_20_N_M_int_N_P_af$V1)))+ geom_jitter(shape=16, position=position_jitter(0.3))   
l=ggplot2.violinplot(data=int_20_N_M_int_N_P_af$V2,mainTitle='20_N_M_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_20_N_M_int_N_P_af$V2)))+ geom_jitter(shape=16, position=position_jitter(0.3))    
j=ggplot2.violinplot(data=int_26_N_M_int_N_P_af$V1,mainTitle='26_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_26_N_M_int_N_P_af$V2)))+ geom_jitter(shape=16, position=position_jitter(0.3))   
y=ggplot2.violinplot(data=int_26_N_M_int_N_P_af$V2,mainTitle='20_N_M_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_26_N_M_int_N_P_af$V2)))+ geom_jitter(shape=16, position=position_jitter(0.3))   
z=ggplot2.violinplot(data=int_34_N_M_int_N_P_af$V1,mainTitle='34_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_34_N_M_int_N_P_af$V1)))+ geom_jitter(shape=16, position=position_jitter(0.3))
h=ggplot2.violinplot(data=int_34_N_M_int_N_P_af$V2,mainTitle='34_N_m_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=1,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(int_34_N_M_int_N_P_af$V1)))+ geom_jitter(shape=16, position=position_jitter(0.3))
grid.arrange(o,d,f,l,j,y,z,h,ncol=4,nrow=2)
dev.off()



#allelic frequencies going up metastatic
int_18_N_M_int_N_P_af$V6=with(int_18_N_M_int_N_P_af, ifelse(V5 > V4, V5/V4, NA))
int_20_N_M_int_N_P_af$V6=with(int_20_N_M_int_N_P_af, ifelse(V5 > V4, V5/V4, NA))
int_26_N_M_int_N_P_af$V6=with(int_26_N_M_int_N_P_af, ifelse(V5 > V4, V5/V4, NA))
int_34_N_M_int_N_P_af$V6=with(int_34_N_M_int_N_P_af, ifelse(V5 > V4, V5/V4, NA))

diciotto=na.omit(int_18_N_M_int_N_P_af)
venti=na.omit(int_20_N_M_int_N_P_af)
ventisei=na.omit(int_26_N_M_int_N_P_af)
trentaquattro=na.omit(int_34_N_M_int_N_P_af)



write.table(int_18_N_M_int_N_P_af , file = "intersection_18_N_P_vs_N_M.txt" , dec = ".",sep="\t")
write.table(int_20_N_M_int_N_P_af , file = "intersection_20_N_P_vs_N_M.txt" , dec = ".",sep="\t")
write.table(int_26_N_M_int_N_P_af , file = "intersection_26_N_P_vs_N_M.txt" , dec = ".",sep="\t")
write.table(int_34_N_M_int_N_P_af , file = "intersection_34_N_P_vs_N_M.txt" , dec = ".",sep="\t")



#violin allelic frequencies intersected Normale_met against Normal_Primary  going up in met (sample 34 filtered: ratio>2, V5>0.1)
pdf(file="allelic_frequencies_intersect_positive_ratio in met.pdf",width=10, heigh=22)

o=ggplot2.violinplot(data=diciotto$V4,mainTitle='18_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(diciotto$V4)))+ geom_dotplot(binaxis='y',position="dodge", stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,diciotto$V4, label = rownames(diciotto)),nudge_y = 0.01,nudge_x=0.2 ) 
  
  d=ggplot2.violinplot(data=diciotto$V5,mainTitle='18_N_M_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3, meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(diciotto$V5)))+ geom_text(aes(1.4, .9, label=length(diciotto$V5)))+ geom_dotplot(binaxis='y', stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,diciotto$V5, label = rownames(diciotto)),nudge_y = 0.01,nudge_x=0.2 )

m=ggplot2.violinplot(data=venti$V4,mainTitle='20_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(venti$V4)))+ geom_dotplot(binaxis='y',position="dodge", stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,venti$V4, label = rownames(venti)),nudge_y = 0.01,nudge_x=0.2 ) 
  n=ggplot2.violinplot(data=venti$V5,mainTitle='20_N_M_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3, meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(venti$V5)))+ geom_text(aes(1.4, .9, label=length(venti$V5)))+ geom_dotplot(binaxis='y', stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,venti$V5, label = rownames(venti)),nudge_y = 0.01,nudge_x=0.2 )

y=ggplot2.violinplot(data=ventisei$V4,mainTitle='26_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(ventisei$V4)))+ geom_dotplot(binaxis='y',position="dodge", stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,ventisei$V4, label = rownames(ventisei)),nudge_y = 0.01,nudge_x=0.2 ) 
  
  j=ggplot2.violinplot(data=ventisei$V5,mainTitle='26_N_M_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3, meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(ventisei$V5)))+ geom_text(aes(1.4, .9, label=length(ventisei$V5)))+ geom_dotplot(binaxis='y', stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,ventisei$V5, label = rownames(ventisei)),nudge_y = 0.01,nudge_x=0.2 )

g=ggplot2.violinplot(data=trentaquattro_fa$V4,mainTitle='34_N_P_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3,
      meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(trentaquattro_fa$V4)))+ geom_dotplot(binaxis='y',position="dodge", stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,trentaquattro_fa$V4, label = rownames(trentaquattro_fa)),nudge_y = 0.01,nudge_x=0.2 ) 
  f=ggplot2.violinplot(data=trentaquattro_fa$V5,mainTitle='34_N_M_intersected',addMean=TRUE, meanPointShape=23, meanPointSize=3, meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(trentaquattro_fa$V5)))+ geom_text(aes(1.4, .9, label=length(trentaquattro_fa$V5)))+ geom_dotplot(binaxis='y', stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,trentaquattro_fa$V5, label = rownames(trentaquattro_fa)),nudge_y = 0.01,nudge_x=0.2 )

grid.arrange(o,d,m,n,y,j,g,f,ncol=2,nrow=4)
dev.off()

#NEW FIGURE LUCA 19/05/2016
int_18_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/FIGURES/Allelic_frequencies/intersection_18_N_P_vs_N_M.txt")
a=int_18_N_M_int_N_P
a$V6=a$V5/a$V4
b=a
b=subset(a, a$V6>1.1)


library(devtools)
library(easyGgplot2)
library(ggrepel)
library(ggplot2)
require(gridExtra)
pdf(file="allelic_frequencies_intersect_P_M.pdf",width=10, heigh=5)
#par(mfrow=c(2,3), mar=c(2,5,2,1), bty="n")
o=ggplot2.violinplot(data=b$V4, meanPointShape=23,meanPointColor="black",ylim=c(0,1)) + geom_text(aes(1.4, .9, label=length(a$V4)))+ geom_dotplot(binaxis='y',position="dodge", stackdir='centerwhole', stackratio = 1,dotsize=0.3,binwidth = 0.04) + geom_label_repel(aes(1,diciotto$V4, label = rownames(diciotto)),nudge_y = 0.01,nudge_x=0.2 ) 
#m=plot(b[,5])

dev.off()

las=3,


int_18_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/FIGURES/Allelic_frequencies/intersection_18_N_P_vs_N_M.txt")
int_20_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/FIGURES/Allelic_frequencies/intersection_20_N_P_vs_N_M.txt")
int_26_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/FIGURES/Allelic_frequencies/intersection_26_N_P_vs_N_M.txt")
int_34_N_M_int_N_P=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/FIGURES/Allelic_frequencies/intersection_34_N_P_vs_N_M.txt")

dim(int_18_N_M_int_N_P)
dim(int_20_N_M_int_N_P)
dim(int_26_N_M_int_N_P)
dim(int_34_N_M_int_N_P)


int_18_N_M_int_N_P=int_18_N_M_int_N_P[,-6]
int_18_N_M_int_N_P$V6=int_18_N_M_int_N_P$V5/int_18_N_M_int_N_P$V4
write.table(int_18_N_M_int_N_P,int_18_N_M_int_N_P.txt, dec=".", sep="\t")

int_20_N_M_int_N_P$V4=as.numeric(levels(int_20_N_M_int_N_P$V4))[int_20_N_M_int_N_P$V4]
int_20_N_M_int_N_P$V5=as.numeric(levels(int_20_N_M_int_N_P$V5))[int_20_N_M_int_N_P$V5]
int_20_N_M_int_N_P$V6=int_20_N_M_int_N_P$V5/int_20_N_M_int_N_P$V4
write.table(int_20_N_M_int_N_P,"int_20_N_M_int_N_P.txt", dec=".", sep="\t")

int_26_N_M_int_N_P=int_26_N_M_int_N_P[-1,]
int_26_N_M_int_N_P=int_26_N_M_int_N_P[,-6]
int_26_N_M_int_N_P$V4=as.numeric(levels(int_26_N_M_int_N_P$V4))[int_26_N_M_int_N_P$V4]
int_26_N_M_int_N_P$V5=as.numeric(levels(int_26_N_M_int_N_P$V5))[int_26_N_M_int_N_P$V5]
int_26_N_M_int_N_P$V6=int_26_N_M_int_N_P$V5/int_26_N_M_int_N_P$V4
write.table(int_26_N_M_int_N_P,"int_26_N_M_int_N_P.txt", dec=".", sep="\t")

int_34_N_M_int_N_P=int_34_N_M_int_N_P[-1,]
int_34_N_M_int_N_P=int_34_N_M_int_N_P[,-6]
int_34_N_M_int_N_P$V4=as.numeric(levels(int_34_N_M_int_N_P$V4))[int_34_N_M_int_N_P$V4]
int_34_N_M_int_N_P$V5=as.numeric(levels(int_34_N_M_int_N_P$V5))[int_34_N_M_int_N_P$V5]
int_34_N_M_int_N_P$V6=int_34_N_M_int_N_P$V5/int_34_N_M_int_N_P$V4
write.table(int_34_N_M_int_N_P,"int_34_N_M_int_N_P.txt", dec=".", sep="\t")
