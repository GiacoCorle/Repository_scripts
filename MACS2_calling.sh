#!/bin/bash

#for each file in the folder
count_1=0
 for filenames in /media/giacomo/Extra_Drive_1/DKP_april/*INPUT*.BAM ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         filename5=${filename4%_*}
         #echo $filename5
            
   #echo $filenames
  let "count_1++"
    count_2=0
    for filenameso in /media/giacomo/Extra_Drive_1/DKP_april/*H3K27ac*.BAM ;do
        #get just the filename
		filenameo2=${filenameso##*/}				
		filenameo3=${filenameo2%.*}
        filenameo4=${filenameo3%_*}
        filenameo5=${filenameo4%_*}
		#echo $filenameo3	
       #echo $filenameo5
		let "count_2++"
         
   
      if [ "$filename5" = "$filenameo5"  -a "$count_1" = "$count_2" ]; then
      echo "${filename3}    ${filenameo3}"
             
#Peaks calling MACS2 --SPMR normalization, duplicate are removed by macs2
echo $count_1 $count_2
#peak calling
macs2 callpeak -t $filenameso -c $filenames --format AUTO --nomodel --shift -100 --extsize 200 -B --SPMR --call-summits -q 0.01 -g hs --outdir /media/giacomo/Extra_Drive_1/DKP_chip_result_MACS2   -n $filename4 


           fi
done
done
