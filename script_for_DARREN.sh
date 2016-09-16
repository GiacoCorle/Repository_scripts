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