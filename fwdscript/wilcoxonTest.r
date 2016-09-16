
wtest <- function(Mytable){
	ris <- NULL
 for (r in 1:nrow(Mytable)) {
	N = as.numeric(Mytable[r,1:6])
	#I = as.numeric(Mytable[r,11:16])
	T = as.numeric(Mytable[r,7:13])
	ris = c(ris,wilcox.test(N,T,paired=FALSE,exact = FALSE, correct = FALSE)$p.value)
 }
 return(ris)
}