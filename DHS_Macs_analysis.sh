#!/bin/bash

#for each file in the folder
count_1=0
 for filenames in /Volumes/GIACO/Encode_DHS_sites_Washington/*.bam ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         echo $filename4
   let "count_1++"
#Peaks calling MACS2 --SPMR normalization, duplicate are removed by macs2
echo $count_1 
#peak calling
macs2 callpeak -t $filenames  --format AUTO --nomodel --shift -100 --extsize 200 -B --SPMR --call-summits -q 0.01 -g hs --outdir  /Volumes/GIACO/DHS_sites_Washington_macs_calling/  -n $filename4 


           
done
done