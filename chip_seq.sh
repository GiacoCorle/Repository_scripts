#!/bin/bash

#for each file in the folder
count_1=0
 for filenames in /path_to_your_sorted_bam_folder/sorted*INPUT*.bam ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         #echo $filename4
   
   #echo $filenames
  let "count_1++"
    count_2=0
    for filenameso in /path_to_your_sorted_bam_folder/sorted*H3K27ac*.bam ;do
        #get just the filename
		filenameo2=${filenameso##*/}				
		filenameo3=${filenameo2%.*}
        filenameo4=${filenameo3%_*}
		#echo $filenameo3	
       # echo $filenameo4
		let "count_2++"
        
   
     if [ "$filename4" = "$filenameo4" ] ; then
      echo "${filename3}    ${filenameo3}"
             
#Peaks calling MACS2 --SPMR normalization, duplicate are removed by macs2
echo $count_1 $count_2
#peak calling
macs2 callpeak -t $filenameso -c $filenames --format AUTO --nomodel --shift -100 --extsize 200 -B --SPMR --call-summits -q 0.01 -g hs --outdir  /path_to_the_folder_you_create_mac2_output/  -n $filename4 


           fi
done
done