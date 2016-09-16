#deduplicate reads of our  48 BC Eralpha samples
cd /Users/giacomino/Tools/picard/picard-tools-2.1.1/
count_1=0
 for filenames in /Volumes/SAMSUNG_D3/H3K27ac_ChIP_Tumour/BAM-MACS2/BAM_Sorted_Indexed/*.BAM ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         
   let "count_1++"

echo $filename4
echo $count
java -jar picard.jar MarkDuplicates REMOVE_DUPLICATES=true I= $filenames O=/Volumes/GIACO/DKP_deduplicated/deduplicated_$filename4.bam M=/Volumes/GIACO/DKP_deduplicated/deduplicated_$filename4.txt
samtools sort -T /tmp/filename.sorted -o /Volumes/GIACO/DKP_deduplicated/sorted_deduplicated_$filename4.bam /Volumes/GIACO/DKP_deduplicated/deduplicated_$filename4.bam 
samtools index /Volumes/GIACO/DKP_deduplicated/sorted_deduplicated_$filename4.bam
#merge input and chip of our samples in an unique bam
#run bedtools multicov for every bed matched bam
#intersect all the reads coverage in our Total_enhancer and total_promoter bedfile
#normalize reads as for atac in r creating a new column matched location
#plot the normalized reads value matched coordinate 
#split the obtained distribution in 100 percentiles
done