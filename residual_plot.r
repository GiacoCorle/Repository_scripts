#SE
pdf(file="/Users/giacomino/Desktop/residual_graph_lines.pdf",width=25, heigh=10)
plot(dist,main = "sample_018_Normal_vs_Metastatic", xlab = "from chr1 to chrX", ylab = "Distance to putative",pch=19, cex=.5, ylim=c(-400,400))
lines(dist)
abline(0,0)
abline(10,0)
abline(-10,0)
dev.off()

#TAD
pdf(file="/Users/giacomino/Desktop/residual_graph_lines_TAD.pdf",width=25, heigh=10)
plot(TAD_dist,main = "sample_018_Normal_vs_Metastatic_CTCF", xlab = "from chr1 to chrX", ylab = "Distance to CTCF binding site",pch=19, cex=.5, ylim=c(-20,20))
#lines(TAD_dist)
abline(0,0)
#abline(10,0)
#abline(-10,0)
dev.off()






#sum(dist[dist>-10&dist<10])
#dist[dist>-20&dist<20]
#table(dist[dist>-10&dist<10])



pdf(file="/Users/giacomino/Desktop/residual_graph_lines_no_outlier.pdf",width=25, heigh=10)
plot(dist_no_up_100,main = "sample_018_Normal_vs_Metastatic", xlab = "from chr1 to chrX", ylab = "Distance to putative",pch=19, cex=.5, ylim=c(-200,200))
lines(dist_no_up_100)
abline(0,0)
abline(10,0)
abline(-10,0)
dev.off()


#TAD figure_distance_to transcription_factor_binding
TAD_a=read.table("/Volumes/SAM_BAM/TARGETED_seq_26012016/CTCF_probes_with_CTCF_binding_regions.txt") #file con tadprobes and center
TAD_b=read.table("/Users/giacomino/analysis/Alona_mutation_finder/TAD_vs_sample_018_N_M_mut.txt") #file delle mutazioni keep intersected con le probes tad.
TAD_c=merge(TAD_a,TAD_b,by=c("V1","V2","V3")) #merge the targeted probes
TAD_dist=TAD_c$V12-TAD_c$V9.x

pdf(file="/Users/giacomino/Desktop/simak/simak_sample20_N_M.pdf",width=25, heigh=10)
plot(TAD_dist,main = "sample_020_Normal_vs_Metastatic_CTCF", xlab = "from chr1 to chrX", ylab = "Distance to CTCF binding site",pch=19, cex=.0, ylim=c(-6,6))
text(TAD_dist,labels=TAD_c$V16,cex=4,col=c("red"))
dev.off()