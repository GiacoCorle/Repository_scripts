
#count=1
#while [ $count -lt 46 ]  
#do

#       echo $count
       #read the enhancer_panel get the panel coordinates used for targeted sequencing  and the index got from our annotation matching the panel and creat 45 files containing the binned index. 
       # awk command explaination: -v insert bash variable ; c="count" import bash variable
# awk -v c="$count" ' $1 == c' /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/panel_hg38_enhancer.txt | cut -f2,3,4> /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/ENHANCER/enhancer_bin$count.txt
#let "count++"
#done


#count=1
#while [ $count -lt 46 ]  
#do

#       echo $count
       #read the enhancer_panel get the panel coordinates used for targeted sequencing  and the index got from our annotation matching the panel and creat 45 files containing the binned index. 
       # awk command explaination: -v insert bash variable ; c="count" import bash variable
#  awk -v c="$count" ' $1 == c' /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/panel_hg38_promoter.txt | cut -f2,3,4> /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/PROMOTER/promoter_bin$count.txt
#let "count++"
#done


#convert hg38 panel bins in hg19 PROMOTER
#count=1
#for filenames in /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/PROMOTER_hg38/*.txt ;do
#         filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         echo $filename3
#         echo $count1 
#         let "count++"
#         CrossMap.py bed /Users/giacomino/Downloads/hg38ToHg19.over.chain.gz $filenames /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/PROMOTER_hg19/$filename3.bed
#         done
         
#convert hg38 panel bins in hg19 ENHANCER
#count=1
#for filenames in /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/ENHANCER_hg38/*.txt ;do
#         filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         echo $filename3
#         echo $count1 
#         let "count++"
#         CrossMap.py bed /Users/giacomino/Downloads/hg38ToHg19.over.chain.gz $filenames /Volumes/GIACO/TARGET_SEQ_downsampling/PANEL/ENHANCER_hg19/$filename3.bed
#         done

###############################MUTECT_analysis

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
  for filenameso in /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/SORTED/sorted_Primary_0.*.bam ;do
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
      
      
    java -Xmx30g -jar muTect-1.1.4.jar --analysis_type MuTect --reference_sequence /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta --intervals $bin   --input_file:normal $filenames --input_file:tumor $filenameso --out /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/"$filename3"_"$filenameo3"_$bin3.txt
    grep 'KEEP' /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/"$filename3"_"$filenameo3"_$bin3.txt > /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/GREP_"$filename3"_"$filenameo3"_$bin3.txt
       
#java -Xmx30g -jar GenomeAnalysisTK.jar -T MuTect2 -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I:tumor /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/BASE_RECALIBRATOR/ind_real_base_recali_GOLDEN_METASTATIC.bam -I:normal /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/BASE_RECALIBRATOR/ind_real_base_recali_GOLDEN_BLOOD.bam  --dbsnp /Users/giacomino/Genomes/GATK_bundle/dbsnp_138.hg19.vcf -L /Volumes/SAM_BAM/TARGETED_seq_26012016/TAG.bed -o /Volumes/SAM_BAM/TARGETED_seq_26012016/mutect2/sample_GOLDEN_Blood_GOLDEN_METASTATIC_RECALIBRATED_INDELS.txt

fi
done
done
done