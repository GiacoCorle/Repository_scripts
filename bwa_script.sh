count_1=0
 for filenames in /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/*R1.fastq ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         #echo $filename4
   
   #echo $filenames
  let "count_1++"
    count_2=0
    for filenameso in /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/*R2.fastq ;do
		filenameo2=${filenameso##*/}				
		filenameo3=${filenameo2%.*}
        filenameo4=${filenameo3%_*}
		#echo $filenameo3	
        #echo $filenameo4
		let "count_2++"
        
   
     if [ "$count_1" = "$count_2" ] ; then
      echo "${filename3}    ${filenameo3}"
      
bwa mem -t 16 -M -k 10 -R '@RG\tID:"$filename4"\tSM:bar\tLB:library1' /Users/giacomino/Genomes/hg19/BWA/ucsc.hg19.fasta  $filenames $filenames > /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/$filename4.sam

samtools flagstat /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/$filename4.sam > /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/$filename4.log

samtools view -b -S /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/$filename4.sam > /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/$filename4.bam

samtools sort -T /tmp/$filename3.sorted -o /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/sorted_$filename4.bam /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/$filename4.bam

samtools index /Volumes/GIACO/TARGETED_SEQ_FASTQ_concatenated/Aligned_BAM/sorted_$filename4.bam

fi
done
done