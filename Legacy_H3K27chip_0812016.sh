#bowtie_indexing_sorting

#for filenames in /Volumes/GIACO/Legacy_Patient_001_August2016/FASTQ/*.fastq ;do 		
        #get just the filename
#		filename2=${filenames##*/}				
#		filename3=${filename2%.*}
#		echo $filename3		
#		echo “Bowtie is working….. hg19”
#		echo “It’s aligning ${filename3}”
			#reads long less then 50bp
            #from fastq to sam and statistics redirection
#		bowtie -q -t --sam -p 16   /Users/giacomino/Genomes/hg19/BOWTIE/hg19 $filenames /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/$filename3.sam >>/Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/$filename3.log 2>&1   
		#from sam to bam
#		samtools view -b -S /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/$filename3.sam > /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/$filename3.bam 
		
        #bam sorting by coordinate
 #       samtools sort -T /tmp/$filename3.sorted -o /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/sorted_$filename3.bam /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/$filename3.bam
		#bam indexing
#        samtools index /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/sorted_$filename3.bam
        
#        echo $filename3		
#        echo “Bowtie is working….. hg38”
#        bowtie -q -t --sam -p 8   /Users/giacomino/Genomes/hg38/BOWTIE/GRCh38_no_alt/GCA_000001405.15_GRCh38_no_alt_analysis_set $filenames /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/$filename3.sam >>/Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/$filename3.log 2>&1   
		#from sam to bam
#		samtools view -b -S /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/$filename3.sam > /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/$filename3.bam 
		
        #bam sorting by coordinate
 #      samtools sort -T /tmp/$filename3.sorted -o /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/sorted_$filename3.bam /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/$filename3.bam
		#bam indexing
  #      samtools index /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/sorted_$filename3.bam
#done
#MACS2 calling


#count_1=0
# for filenames in /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/sorte*INPUT*.bam ;do 
#    filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
         #echo $filename4
   
   #echo $filenames
#  let "count_1++"
#    count_2=0
 #   for filenameso in /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg19/sorte*H3*.bam ;do
        #get just the filename
#		filenameo2=${filenameso##*/}				
#		filenameo3=${filenameo2%.*}
 #       filenameo4=${filenameo3%_*}
		#echo $filenameo3	
       # echo $filenameo4
#		let "count_2++"
        
   
#     if [ "$count_1" = "$count_2" -a "$count_1" -gt 2 ] ; then
#      echo "${filename3}    ${filenameo3}"
     
#     macs2 callpeak -t $filenameso -c $filenames --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/Legacy_Patient_001_August2016/MACS2_hg19 -n $filenameo4"_"$filename4

     
     
     
     
     
#fi
#done 
#done

count_1=0
 for filenames in /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/sorte*INPUT*.bam ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         #echo $filename4
   
   #echo $filenames
  let "count_1++"
    count_2=0
    for filenameso in /Volumes/GIACO/Legacy_Patient_001_August2016/Alignment_hg38/sorte*H3*.bam ;do
        #get just the filename
		filenameo2=${filenameso##*/}				
		filenameo3=${filenameo2%.*}
        filenameo4=${filenameo3%_*}
		#echo $filenameo3	
       # echo $filenameo4
		let "count_2++"
        
   
     if [ "$count_1" = "$count_2" ] ; then
      echo "${filename3}    ${filenameo3}"
     
     macs2 callpeak -t $filenameso -c $filenames --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/Legacy_Patient_001_August2016/MACS2_hg38  -n $filenameo4"_"$filename4
     
     fi
     done 
     done