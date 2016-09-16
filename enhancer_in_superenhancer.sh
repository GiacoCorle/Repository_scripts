count_1=0
 for filenames in /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_0* ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         #echo $filename4
   
   #echo $filenames
  let "count_1++"
    count_2=0
    for filenameso in /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/P_DKP_* ;do
        #get just the filename
		filenameo2=${filenameso##*/}				
		filenameo3=${filenameo2%.*}
        filenameo4=${filenameo3%_*}
		#echo $filenameo3	
       # echo $filenameo4
		let "count_2++"
        
        if [ "$count_2" = "$count_1" ] ; then
      echo "${filename3}    ${filenameo3}"
      bedtools intersect -wb -wa -a $filenames -b $filenameso | cut -f4,5,6 | uniq > /Users/giacomino/Desktop/ACT/enhancer_in_superenhancer/enhancer_in_superenhancer_$filenameo3.bed
      
      fi
      done
      done