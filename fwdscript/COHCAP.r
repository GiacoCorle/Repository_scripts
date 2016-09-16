#running COHCAP
library("COHCAP")
beta.file <- file.path(file.choose())#carico i beta formattati tab delimited no space
sample.file <- file.path(file.choose())#carico il sample formattato tab delimited no space
expression.file <- file.path(file.choose())#carico sample formattato tab delimited no space
project.folder <- getwd()
project.name <- "#chiamare il nome progetto"
beta.table <- COHCAP.annotate(beta.file, project.name, project.folder,platform="450k-UCSC") #beta table annotata
filtered.sites <- COHCAP.site(sample.file, beta.table, project.name, project.folder, ref="C")#valutazione metilazione per ogni sito							 							  

#percorso avg by island da utilizzare quando si dispone di un expression table con solo i valori delle intensitÃ  di ogni gene per ogni campione
filtered.islands <- COHCAP.avg.by.island(sample.file, filtered.sites, beta.table, project.name, project.folder, ref="parental") #percorso avg by island
COHCAP.integrate.avg.by.island(filtered.islands, project.name, project.folder,expression.file, sample.file)#integrazione avg by island

#percorso avg by site da utilizzare quando si dispone di un expression table con GENE,FC, P-value,FDR										   
filtered.islands=COHCAP.avg.by.site(filtered.sites, project.name, project.folder, num.groups=2, output.format = "xls")#trova le isole diff meth percorso avgby site
COHCAP.integrate.avg.by.site(filtered.islands, project.name, project.folder,expression.file)#integrazione con expressio file percorso avg by site
