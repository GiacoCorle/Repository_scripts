#!/bin/bash
#get every single file in your sam folder
for filenames in /path_of_to_your_sam_folder/*.sam ;do    		
        #get just the filename
		filename2=${filenames##*/}				
		filename3=${filename2%.*}
        #print names of the current .sam file
		echo $filename3		
		echo “samtools is working…..”
		echo “It’s working on file ${filename3}”
        #samtools calling_converting in .bam
		samtools view -b -S /path/to/your/folder/$filename3.sam > /path/to/folder/where/you/want/put/your_bam/$filename3.bam 
		
        echo “It’s working sorting ${filename3}”
        #bam sorting by coordinate
        samtools sort -T /tmp/$filename3.sorted -o /path/where/you/wanna/put_your_bam/sorted_$filename3.bam /path_from_you get_your_not_sorted_bam/$filename3.bam
		echo “It’s working indexing
        #bam indexing
        samtools index /path/to/the/sorted/bam/sorted_$filename3.bam
        
        echo “It’s MACS2ing file ${filename3}”


        
        
done