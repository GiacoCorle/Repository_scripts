library(ggplot2)


pca = prcomp(t(DT))
condition = c(rep("CIRR",17),rep("HCC",23))
scores = as.data.frame(pca$x)
V = (pca$sdev^2 / sum(pca$sdev^2))*100

ggplot(data = scores, aes(x = PC1, y = PC2,color=rownames(scores),label = rownames(scores)))+
  geom_hline(yintercept = 0, colour = "gray65") +
  geom_vline(xintercept = 0, colour = "gray65") +
  xlab(paste0("PC1: ",round(V[1],2),"% variance"))+
  ylab(paste0("PC2: ",round(V[2],2),"% variance"))+
  geom_text(size = 4)+
  geom_point(size=1) 