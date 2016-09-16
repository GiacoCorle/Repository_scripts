#!/bin/bash
 
writing_file='/home/genomi/Desktop/SCRIPT/casa.txt'
filename='/mnt/NFS_SHARE_1/Breast_Cancer_public_dataset/OUTPUT_CUFFLINKS/587467/isoforms.fpkm_tracking'

	for files in /mnt/NFS_SHARE_1/Breast_Cancer_public_dataset/OUTPUT_CUFFLINKS/* ;do #leggo la cartella
		echo "$files" >> $writing_file	#stampo il nome di ogni cartella analizzata
		grep 'PIWIL2\|PIWIL4' $files/isoforms.fpkm_tracking >> $writing_file # estragggo tutte le linee con il pattern e poi le stampo in un file dalla fine dell'ultima riga scritta
		
	
	done

#filelines=`cat $filename`
#echo $filelines[3]


#writing_file='/home/genomi/Desktop/SCRIPT/scrittura.txt'
#grep 'PIWIL2\|PIWIL4' $filename > $writing_file


#grep "PIWIL4" $filename > $writing_file
#k=1
#while read line;do
 #       echo "Line # $k: $line"
	        
#	((k++))
	
#done < $filename
#grep 'PIWIL2'


#grep 'PIWIL2' /mnt/NFS_SHARE_1/Breast_Cancer_public_dataset/OUTPUT_CUFFLINKS/587467/isoforms.fpkm_tracking | piwil2.txt
