#!/bin/bash

#in tools/rose/annotation hg19 is actually the annotation related to hg38. the real hg19 is called hg19_reference.
#this script has been run against hg38 annotation
#need to run a manella enhancer calling for sampleg008_input005 peak
python ROSE_main.py -g hg19 -i /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/z_sorted_G_DKP_008_H3K27ac_sorted_G_DKP_005_INPUT_peaks.narrowPeak.bed  -r /Volumes/SAM_BAM/DKP_H3K27ac_april/SORTED_BAM/z_sorted_G_DKP_008_H3K27ac.bam -o /Volumes/SAM_BAM/DKP_H3K27ac_april/ROSE/GOOD/ -c /Volumes/SAM_BAM/DKP_H3K27ac_april/SORTED_BAM/sorted_G_DKP_005_INPUT.bam


cd /Users/giacomino/Tools/rose/

count_1=0
for filenames in /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G* ;do
        filename2=${filenames##*/}				
        filename3=${filename2%.*}
        filename4=${filename3%_*}
        let "count_1++"
        #echo "bedfile numero $count_1 nome $filename4"

count_2=0
for bam in /Volumes/SAM_BAM/DKP_H3K27ac_april/SORTED_BAM/sorted_G*H*.bam ;do
        bam2=${bam##*/}				
        bam3=${bam2%.*}
        bam4=${bam3%_*}
        let "count_2++"
        #echo "bam numero $count_2 nome $bam3"
        
count_3=0
for input in /Volumes/SAM_BAM/DKP_H3K27ac_april/SORTED_BAM/sorted_G*I*.bam ;do
        input2=${input##*/}				
        input3=${input2%.*}
        input4=${input3%_*}
        let "count_3++"
        #echo "bam numero $count_3 nome $input3"

      if [ "$count_1" = "$count_2"  -a "$count_1" = "$count_3" -a "$count_2" = "$count_3" ] ; then
      echo $filename4 $bam4 $input4
      
python ROSE_main.py -g hg19 -i $filenames -r $bam -o /Volumes/SAM_BAM/DKP_H3K27ac_april/ROSE/GOOD/ -c $input
fi
done
done
done