#!/bin/bash

#for each file in the folder
count_1=0
 for filenames in /media/giacomo/Extra_Drive_1/DKP_april/DKP_ALL_BAM_SORTED/sorted_G*INPUT*.bam ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         echo $filename4
   
   #echo $filenames
  let "count_1++"
    count_2=0
    for filenameso in /media/giacomo/Extra_Drive_1/DKP_april/DKP_ALL_BAM_SORTED/sorted_G*H3K27ac*.bam ;do
        #get just the filename
		filenameo2=${filenameso##*/}				
		filenameo3=${filenameo2%.*}
        filenameo4=${filenameo3%_*}
		#echo $filenameo3	
       #echo $filenameo4
		let "count_2++"
        #count_3=0
		#echo “It’s calling ${filename3}”
            #for filemacs in /media/giacomo/Extra_Drive_1/DKP_chip_result_MACS2/*_peaks.xls ;do
             #   filemacs2=${filemacs##*/}				
		      #  filemacs3=${filemacs2%.*}
               # filemacs4=${filemacs3%_*}
                #echo $filemacs4
                #let "count_3++"
   
   
   
   
   #if [ "$filename4" = "$filenameo4" ] && [ "$filename4" != "$filemacs4" ] ; then
     if [ "$filename4" = "$filenameo4" ]  ; then
      echo "${filename3}    ${filenameo3}"
       #if [ "$filename4" != "$filemacs4" ] ; then
      
     #echo $filename4 "already analyzed"
     # break
      
     
      #elif [ "$filename4" = "$filenameo4" ] && [ "$filename4" != "$filemacs4" ] && [ "$count_2" = "$count_3" ] ; then     
       #count=$((count+1))
          # if [ "$filename4" != "$filemacs4" ] ; then
            echo $count_1 $count_2
#            echo $filename4 "not analyzed"
           
        
#Peaks calling MACS2 --SPMR normalization, duplicate are removed by macs2
#echo $count_1 $count_2 $count_3
#peak calling
macs2 callpeak -t $filenameso -c $filenames --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir  /media/giacomo/Extra_Drive_1/DKP_april/MACS2_CALLING/GOOD/  -n $filename3"_"$filenameo3 

#peak MCF7_LOW
#macs2 callpeak -t /Users/Giacomino/Desktop/ATAC_seq/Alignment/concatenated_MCF7_LOW.bam --format AUTO --nomodel --shift -100 --extsize 200 -B --SPMR --call-summits -q 0.01 -g hs --outdir /Users/Giacomino/Desktop/ATAC_seq/MACS/ -n CONCATENATE_MCF7_LOW >> /Users/Giacomino/Desktop/ATAC_seq/MACS/concatenated_MCF7_LOW.log 2>&1
           fi
done
done
#done