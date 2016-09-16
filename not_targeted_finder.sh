#!/bin/bash
count=0
#for each file in the folder
for filenames in /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_0*.bam ;do 		
        #get just the filename
		filename2=${filenames##*/}				
		filename3=${filename2%.*}
       count=
        echo $filename3	
        echo "Bedtools create genomic coverage of sample "$filename3
        bedtools genomecov -bg -split -ibam $filenames > /Users/giacomino/Desktop/temp/genome_cov_$filename3.txt
        chmod 777 /Users/giacomino/Desktop/temp/genome_cov_$filename3.txt
        echo intersect our TARGETED bed file with genome_cov_$filename3.txt
        bedtools  intersect -v -a /Users/giacomino/Desktop/temp/genome_cov_$filename3.txt -b /Volumes/SAM_BAM/TARGETED_seq_26012016/amplicons.bed.txt > /Users/giacomino/analysis/not_targeted_finder_DKP_targeted_seq/$filename3.txt
        chmod 777 /Users/giacomino/analysis/not_targeted_finder_DKP_targeted_seq/$filename3.txt

done