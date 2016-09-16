###############################MUTECT_analysis sample 26 N_P ENHANCER

#for each file in the folder
cd /Users/giacomino/Tools/
 count_1=0
 for filenames in  /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/SORTED/sorted_Normal_0.*.bam ;do 
    filename2=${filenames##*/}				
    filename3=${filename2%.*}
    #filename4=${filename3%_*}
    #echo $filename4
   
   #echo $filenames
  let "count_1++"
  count_2=0
  for filenameso in /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/SORTED/sorted_Metastatic_0.*.bam ;do
    #get just the filename
    filenameo2=${filenameso##*/}				
    filenameo3=${filenameo2%.*}
    #filenameo4=${filenameo3%_*}
    #echo $filenameo3	
    let "count_2++"
     
      
        count_bin=0
        for bin in /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/PANEL/ENHANCER_HG19/enhancer_bin*.bed ;do
        #get just the filename
		bin2=${bin##*/}				
		bin3=${bin2%.*}
        #filenameo4=${filenameo3%_*}
		#echo $filenameo3	
    let "count_bin++" 
      
      if [ "$count_1" = "$count_2" ]  ; then
      echo "${filename3}    ${filenameo3}"
      echo $count_bin $bin3
      echo $bin
      
      
    java -Xmx10g -jar muTect-1.1.4.jar --analysis_type MuTect --reference_sequence /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta --intervals $bin   --input_file:normal $filenames --input_file:tumor $filenameso --out /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/N_M/"$filename3"_"$filenameo3"_$bin3.txt
    grep 'KEEP' /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/N_M/"$filename3"_"$filenameo3"_$bin3.txt > /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/N_M/GREP_"$filename3"_"$filenameo3"_$bin3.txt

fi
done
done
done