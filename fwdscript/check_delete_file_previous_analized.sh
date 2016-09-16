#!/bin/bash

#for filename in /mnt/NFS_SHARE_1/Breast_Cancer_Cell_Lines_analyzed/*.rnaseq.fastq.gz;do  #leggo  nella cartella dei file giÃ  analizzati
#filename1="${filename##*/}" #tolgo il path
	#for filenames in /mnt/NFS_SHARE_3/Cell_lines/*.rnaseq.fastq.gz;do #leggo nella cartella con i file non ancora analizzati
	#filename2="${filenames##*/_}"
	#filename3="${filename2#*_}"
		#if [ "$filename1" == "$filename3" ]; then		
		#mv $filenames /mnt/NFS_SHARE_3/rigettati/		#sposta i file giÃ  analizzati presenti nella cartella dei non analizzati nella cartella rigettati
		#fi
	#done
		
#done




for filename in /mnt/NFS_SHARE_3/Breast_Cancer_public_dataset/OUTPUT_TOPHAT2/*;do  #leggo  nella cartella dei file giÃ  analizzati

filename1="${filename##*/}" #tolgo il path

	for filenames in /mnt/NFS_SHARE_3/reloaded/*.rnaseq.fastq.gz;do #leggo nella cartella con i file non ancora analizzati
	filename2="${filenames##*/_}"
	filename3="${filename2#*_}"
	filename4="${filename3%_*}"
	filename5="${filename4%_*}"
		
		if [ "$filename1" == "$filename5" ]; then
		echo $filename5		
		cp   $filenames /mnt/NFS_SHARE_3/rigettati/		#sposta i file giÃ  analizzati presenti nella cartella  nella cartella rigettati
		echo "copio $filenames"		
		rm $filenames
		echo "rimuovo $filenames"
		fi
	done
		
done

        
#587649_1_2.rnaseq.fastq.gz
