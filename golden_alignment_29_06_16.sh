#!/bin/bash

#for each file in the folder
for filenames in /Volumes/SAM_BAM/GOLDEN/DKP_001_017_*.fastq ;do 		
        #get just the filename
		filename2=${filenames##*/}				
		filename3=${filename2%.*}
		echo $filename3		
		echo “Bowtie is working…..”
		echo “It’s aligning ${filename3}”
			#reads long less then 50bp
            #from fastq to sam and statistics redirection
		bowtie -q -t --sam -p 8  /Users/giacomino/Genomes/hg19/BOWTIE/hg19 $filenames /Volumes/SAM_BAM/GOLDEN/Alignment_hg19/$filename3.sam >>/Volumes/SAM_BAM/GOLDEN/Alignment_hg19/$filename3.log 2>&1   
		#from sam to bam
		samtools view -b -S /Volumes/SAM_BAM/GOLDEN/Alignment_hg19/$filename3.sam > /Volumes/SAM_BAM/GOLDEN/Alignment_hg19/$filename3.bam 
		
        #bam sorting by coordinate
        samtools sort -T /tmp/$filename3.sorted -o /Volumes/SAM_BAM/GOLDEN/Alignment_hg19/sorted_$filename3.bam /Volumes/SAM_BAM/GOLDEN/Alignment_hg19/$filename3.bam
		#bam indexing
        samtools index /Volumes/SAM_BAM/GOLDEN/Alignment_hg19/sorted_$filename3.bam
done
