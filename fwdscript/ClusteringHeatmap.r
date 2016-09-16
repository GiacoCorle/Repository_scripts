library(RColorBrewer)
#hmcol = colorRampPalette(brewer.pal(7, "RdYlBu"))(100)
hmcol = colorRampPalette(c("green", "black", "red"))(n = 100)

hr <- hclust(as.dist(1-cor(t(y), method="kendal")), method="ward.D") 
hc <- hclust(as.dist(1-cor(y, method="kendal")), method="ward.D") 

mycl <- cutree(hr, h=max(hr$height)/1.5); 
mycol <- sample(rainbow(256)); 
mycol <- mycol[as.vector(mycl)]; 
heatmap(y, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=hmcol, scale="row", ColSideColors=heat.colors(length(hc$labels)), RowSideColors=mycol) 

#library(gplots)
#heatmap.2(y, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=hmcol, scale="row", ColSideColors=group, RowSideColors=mycol,trace="none",margin=c(10,10))   
   
#HEATMAP Expression
hmcol = colorRampPalette(brewer.pal(9, "GnBu"))(100)
#hmcol = colorRampPalette(c("blue", "yellow"))(256)
hr <- hclust(as.dist(1-cor(t(y), method="kendal")), method="ward.D")
mycl <- cutree(hr, h=max(hr$height)/1.5); 
mycol <- sample(rainbow(256)); 
mycol <- mycol[as.vector(mycl)];
group = as.vector(c(rep("orange",10),rep("grey",6),rep("red",10)))
heatmap(y,Rowv=as.dendrogram(hr), Colv=NA, col=hmcol, scale="row",ColSideColors=group,RowSideColors=mycol)



#scale
colors = c(seq(-2,-0.01,length=100),seq(0.01,2,length=100))
my_palette <- colorRampPalette(c("green", "black", "red"))(n = 199)

#median centering library(matrixStats)
y = log2(y+1)
y = y - rowMedians(y)

group = as.vector(c(rep("blue",10),rep("red",10)))

#kendal-complete
hr <- hclust(as.dist(1-cor(t(y), method="kendal")), method="complete") 
hc <- hclust(as.dist(1-cor(y, method="kendal")), method="complete") 

#euclidean-ward
hr <- hclust(dist(y, method="euclidean"), method="ward.D") 
hc <- hclust(dist(t(y), method="euclidean"), method="ward.D") 

#kendal-ward
hr <- hclust(as.dist(1-cor(t(y), method="kendal")), method="ward.D") 
hc <- hclust(as.dist(1-cor(y, method="kendal")), method="ward.D") 


mycl <- cutree(hr, h=max(hr$height)/1.5); 
mycol <- sample(rainbow(256)); 
mycol <- mycol[as.vector(mycl)];
heatmap.2(y, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc),ColSideColors=group,RowSideColors=mycol,col=my_palette,breaks=colors, density.info="none", trace="none",symm=F,symkey=F,symbreaks=T, scale="none",margin=c(15,15))
