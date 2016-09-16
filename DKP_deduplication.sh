#deduplication H3K27ac

#cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
#count=0
#for filenames in /Volumes/SAM_BAM/DKP_H3K27ac_april/SORTED_BAM/four_samples/*.bam ;do
#filename2=${filenames##*/}				
#		filename3=${filename2%.*}
#        filename4=${filename3%_*}
#        echo $filename3
#        let "count++"
#        java -jar picard.jar  MarkDuplicates REMOVE_DUPLICATES=true I=$filenames O=/Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/deduplicated_$filename4.bam M=/Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/deduplicated_$filename4.txt
#       samtools sort -T /tmp/filename.sorted -o /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/sorted_deduplicated_$filename4.bam /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/deduplicated_$filename4.bam
#      samtools index /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/sorted_deduplicated_$filename4.bam
        
#done

        
#count_1=0
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/sorted_deduplicated*.bam ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#        filename4=${filename3%_*}
#         #echo $filename4
#         let "count_1++"
#         #echo $count_1 
#counting_1=0
#for file in /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_*.bed ;do
#file2=${file##*/}				
#		 file3=${file2%.*}
#        file4=${file3%_*}
#      #echo $file3
#   let "counting_1++"
         #echo $counting_1 
#if [ "$count_1 " = "$counting_1 " ] ; then
     
#     echo $count_1  $counting_1
#      echo "${file4}    ${filename2}"
#      bedtools multicov -bams $filenames -bed $file > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/$filename3_$file4.txt
# fi

# done
 
# done

#cat /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/* > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/TOT_peaks.bed
#cut -f1,2,3,4,11 /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/TOT_peaks.bed > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/depth_TOT_peaks.bed 
#awk '{OFS="\t"} ($6=$3-$2)1 ' /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/depth_TOT_peaks.bed > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/length_depth_TOT_peaks.bed


#create a file with the reads counting sample by sample
#touch /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/mapped_reads.txt
count_1=0
for filenames in /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/sorted_deduplicated*.bam ;do
filename2=${filenames##*/}				
		 filename3=${filename2%.*}
        filename4=${filename3%_*}
        let "count_1++"
        if [ "$count_1 " -gt "44" ] ; then
         echo $filename3 >> /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/mapped_reads.txt
         #let "count_1++"
         samtools view -F 0x904 -c $filenames >> /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/mapped_reads.txt
         fi
         done
         
        # =C2-B2
        # normalization
        # =(((K2/L2)*1000000)/M2)*1000
        # equal
        # =(1000000*K2)/(L2*M2)*1000