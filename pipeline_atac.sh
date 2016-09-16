#!/bin/bash

#for each file in the folder
for filenames in /Users/Giacomino/Desktop/ATAC_seq/fastq/*.fastq ;do 		
        #get just the filename
		filename2=${filenames##*/}				
		filename3=${filename2%.*}
		echo $filename3		
		echo “Bowtie is working…..”
		echo “It’s aligning ${filename3}”
			#reads long less then 50bp
            #from fastq to sam and statistics redirection
		bowtie -q -t --sam -p 8  /Users/Shared/Genomes/hg19/BowtieIndex/hg19 $filenames /Users/Giacomino/Desktop/ATAC_seq/Alignment/$filename3.sam >>/Users/Giacomino/Desktop/ATAC_seq/Alignment/$filename3.log 2>&1   
		#from sam to bam
		samtools view -b -S /Users/Giacomino/Desktop/ATAC_seq/Alignment/$filename3.sam > /Users/Giacomino/Desktop/ATAC_seq/Alignment/$filename3.bam 
		
        #bam sorting by coordinate
        samtools sort -T /tmp/$filename3.sorted -o /Users/Giacomino/Desktop/ATAC_seq/Alignment/sorted_$filename3.bam /Users/Giacomino/Desktop/ATAC_seq/Alignment/$filename3.bam
		#bam indexing
        samtools index /Users/Giacomino/Desktop/ATAC_seq/Alignment/sorted_$filename3.bam
done

#COMMANDS TO MACS2
#in case concatenation is needed
samtools cat -o /Users/Giacomino/Desktop/ATAC_seq/Alignment/concatenated_MCF7_HIGH.bam /Users/Giacomino/Desktop/ATAC_seq/Alignment/sorted_MCF7_HIGH_ATAC_CGTACTA_L001_R1_001.bam /Users/Giacomino/Desktop/ATAC_seq/Alignment/sorted_MCF7_HIGH_ATAC_CGTACTA_L002_R1_001.bam /Users/Giacomino/Desktop/ATAC-seq/MCF7_HIGHATAC_TAAGGCG_L007_R1_001.BAM 

samtools cat -o /Users/Giacomino/Desktop/ATAC_seq/Alignment/concatenated_MCF7_LOW.bam /Users/Giacomino/Desktop/ATAC_seq/Alignment/sorted_MCF7_LOW_ATAC_TAAGGCG_L001_R1_001.bam /Users/Giacomino/Desktop/ATAC_seq/Alignment/sorted_MCF7_LOW_ATAC_TAAGGCG_L002_R1_001.bam /Users/Giacomino/Desktop/ATAC-seq/MCF7_LOWATAC_TAAGGCG_L007_R1_001.BAM 


#Peaks calling MACS2 --SPMR normalization, duplicate are removed by macs2

#peak MCF7_HIGH
macs2 callpeak -t /Users/Giacomino/Desktop/ATAC_seq/Alignment/concatenated_MCF7_HIGH.bam --format AUTO --nomodel --shift -100 --extsize 200 -B --SPMR --call-summits -q 0.01 -g hs --outdir /Users/Giacomino/Desktop/ATAC_seq/MACS/ -n CONCATENATE_MCF7_HIGH

#peak MCF7_LOW
macs2 callpeak -t /Users/Giacomino/Desktop/ATAC_seq/Alignment/concatenated_MCF7_LOW.bam --format AUTO --nomodel --shift -100 --extsize 200 -B --SPMR --call-summits -q 0.01 -g hs --outdir /Users/Giacomino/Desktop/ATAC_seq/MACS/ -n CONCATENATE_MCF7_LOW >> /Users/Giacomino/Desktop/ATAC_seq/MACS/concatenated_MCF7_LOW.log 2>&1

