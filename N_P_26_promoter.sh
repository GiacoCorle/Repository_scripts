###############################MUTECT_analysis sample 26 N_P PROMOTER

#for each file in the folder
#cd /Users/giacomino/Tools/
 #count_1=0
 #for filenames in  /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/SORTED/sorted_Normal_0.*.bam ;do 
  #  filename2=${filenames##*/}				
#    filename3=${filename2%.*}
    #filename4=${filename3%_*}
    #echo $filename4
   
   #echo $filenames
#  let "count_1++"
#  count_2=0
#  for filenameso in /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/SORTED/sorted_Metastatic_0.*.bam ;do
    #get just the filename
 #   filenameo2=${filenameso##*/}				
#    filenameo3=${filenameo2%.*}
    #filenameo4=${filenameo3%_*}
    #echo $filenameo3	
#    let "count_2++"
     
      
#        count_bin=0
#        for bin in /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/PANEL/PROMOTER_HG19/promoter_bin*.bed ;do
        #get just the filename
#		bin2=${bin##*/}				
#		bin3=${bin2%.*}
        #filenameo4=${filenameo3%_*}
		#echo $filenameo3	
 #   let "count_bin++" 
      
    #  if [ "$count_1" = "$count_2" ]  ; then
    #  echo "${filename3}    ${filenameo3}"
    #  echo $count_bin $bin3
    #  echo $bin
      
      
#    java -Xmx15g -jar muTect-1.1.4.jar --analysis_type MuTect --reference_sequence /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta --intervals $bin   --input_file:normal $filenames --input_file:tumor $filenameso --out /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/PROMOTER/N_M/"$filename3"_"$filenameo3"_$bin3.txt
#    grep 'KEEP' /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/PROMOTER/N_M/"$filename3"_"$filenameo3"_$bin3.txt > /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/PROMOTER/N_M/GREP_"$filename3"_"$filenameo3"_$bin3.txt
       
#java -Xmx30g -jar GenomeAnalysisTK.jar -T MuTect2 -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I:tumor /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/BASE_RECALIBRATOR/ind_real_base_recali_GOLDEN_METASTATIC.bam -I:normal /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/BASE_RECALIBRATOR/ind_real_base_recali_GOLDEN_BLOOD.bam  --dbsnp /Users/giacomino/Genomes/GATK_bundle/dbsnp_138.hg19.vcf -L /Volumes/SAM_BAM/TARGETED_seq_26012016/TAG.bed -o /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect2/sample_GOLDEN_Blood_GOLDEN_METASTATIC_RECALIBRATED_INDELS.txt

#fi
#done
#done
#done

#cat /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/N_M/GREP_sorted_Normal_0.8_sorted_Metastatic_0.8_enhancer_bin01.txt | awk '$18>0.0999'

#for filenames in  /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/N_P/GREP*.txt;do 
 #  filename2=${filenames##*/}				
 #  filename3=${filename2%.*}
#   echo $filename3
#   cat $filenames | awk '$18>0.0999' >  /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/N_P/FILT_$filename3.txt
#   done





count_1=0
for filenames in /Volumes/GIACO/TARGET_SEQ_downsampling/Frozen_N_P_L/BAM/*.bam ;do
        filename2=${filenames##*/}				
        filename3=${filename2%.*}
        echo $filename3
        let "count_1++"
        samtools sort -T /tmp/$filename3.sorted -o /Volumes/GIACO/TARGET_SEQ_downsampling/Frozen_N_P_L/SORTED/SORTED_$filename3.bam $filenames
		#bam indexing
        samtools index /Volumes/GIACO/TARGET_SEQ_downsampling/Frozen_N_P_L/SORTED/SORTED_$filename3.bam
        
        done
        
        
        
        
        
        
        
        