#polar histogram PROMOTER

a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/HOMER/PROMOTER/PROMOTER_H3K27ac_1207_filtered.txt")
b=a
c=levels(b$V1)[b$V1]
rownames(b)=c
#pdf(file="Promoter_total_motifs.pdf",width=20, heigh=20)
p=ggplot(b,aes(x=V1,y=V4))+geom_bar(width=1, stat='identity',fill="darkGrey", colour="white",size=5) + theme_light() + scale_fill_gradient(low='white', high='darkgrey', limits=c(0.5,3)) + theme(axis.title.y=element_text(angle=0))
p + theme(axis.text.x = element_text(angle=45, vjust = 1, hjust=1))
p + coord_polar()
pdf(file="Promoter_total_motifs.pdf",width=20, heigh=20)
p + coord_polar() + aes(x=reorder(V1, V4)) + theme(axis.text.x = element_text(angle=0), text = element_text(size=30)) 
dev.off()



#polar histogram ENHANCER
a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/HOMER/ENHANCER/ENHANCER_H3K27ac_filtered.txt")
b=a
c=levels(b$V1)[b$V1]
rownames(b)=c
p=ggplot(b,aes(x=V1,y=V4))+geom_bar(width=1, stat='identity',fill="darkRed", colour="white",size=5) + theme_light() + scale_fill_gradient(low='white', high='darkRed', limits=c(0.5,3)) + theme(axis.title.y=element_text(angle=0))
p + theme(axis.text.x = element_text(angle=45, vjust = 1, hjust=1))
p + coord_polar()
pdf(file="Enhancer_total_motifs.pdf",width=20, heigh=20)
p + coord_polar() + aes(x=reorder(V1, V4)) + theme(axis.text.x = element_text(angle=0), text = element_text(size=30)) 
dev.off()


#dev.off()
