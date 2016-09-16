reject <- function(Mytable,alpha=0.05){
 ris = NULL	
 for (r in 1:nrow(Mytable)) {
	N = as.numeric(Mytable[r,1:8])
	T = as.numeric(Mytable[r,9:14])
	MN = mean(N)
	MT = mean(T)
	SD = sd(as.numeric(Mytable[r,1:14]))
	e = abs((MT-MN)/SD)
	tmp = pwr.t2n.test(d=e,n1=8,n2=6,alternative="greater")$power
	ris = c(ris,tmp)
	}
	return(ris)
}