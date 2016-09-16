for filenames in /mnt/NFS_SHARE_3/Cell_lines3/*.rnaseq.fastq.gz;do 		#per ogni file nella cartella
		
		if [ "$filenames" != "$result_string" ] 		#se il file[i] non Ã¨ uguale a se stessto _1_2
	        then 
		filename2="${filenames##*/_}"				
		filename3="${filename2#*_}"				
		filename4="$(echo $filename3|cut -d '_' -f1)"		#prendi solo il codice univoco identificativo
		string="_1_2"						#pattern di sostituzione
		result_string="${filenames/_1_1/$string}"		#sostituisci
		
		echo "avvio tophat"					#comando tophat
		/usr/local/bin/tophat-2.0.14.Linux_x86_64/tophat2 -p 8 -o /mnt/NFS_SHARE_3/Breast_Cancer_public_dataset/OUTPUT_TOPHAT2/$filename4/ -G /mnt/NFS_SHARE_1/Genomes/Homo_sapiens/Ensembl/GRCh37/Annotation/Genes/genes.gtf  --library-type fr-firststrand /mnt/NFS_SHARE_1/Genomes/Homo_sapiens/Ensembl/GRCh37/Sequence/Bowtie2Index/genome $filenames $result_string

 		fi		
		echo "fine tophat"



		
done	



#/usr/local/bin/cufflinks-2.2.1.Linux_x86_64/cufflinks  -g /mnt/NFS_SHARE_1/Genomes/Homo_sapiens/Ensembl/GRCh37/Annotation/Genes/genes.gtf -p 8 -o /mnt/NFS_SHARE_1/Breast_Cancer_public_dataset/OUTPUT_CUFFLINKS/587468/ /mnt/NFS_SHARE_1/#Breast_Cancer_public_dataset/OUTPUT_TOPHAT2/587468/accepted_hits.bam 

