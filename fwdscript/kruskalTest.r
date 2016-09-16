
ktest <- function(Mytable){
	ris <- NULL
 for (r in 1:nrow(Mytable)) {
	N = as.numeric(Mytable[r,1:6])
	I = as.numeric(Mytable[r,7:13])
	T = as.numeric(Mytable[r,14:22])
	dati = list(g1=N,g2=I,g3=T)
	ris = c(ris,kruskal.test(dati)$p.value)
 }
 return(ris)
}