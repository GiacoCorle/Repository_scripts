for filenames in /mnt/NFS_SHARE_3/Breast_Cancer_public_dataset5/*;do 		#per ogni file nella cartella
		
		 
		filename2="${filenames##*/}"				
			
		
		echo "avvio cufflink $filename2"					#comando tophat
		/usr/local/bin/cufflinks-2.2.1.Linux_x86_64/cufflinks -g /mnt/NFS_SHARE_1/Genomes/Homo_sapiens/Ensembl/GRCh37/Annotation/Genes/genes.gtf -p 8 -o /mnt/NFS_SHARE_3/Breast_Cancer_public_dataset/OUTPUT_CUFFLINKS/$filename2/ /mnt/NFS_SHARE_3/Breast_Cancer_public_dataset5/$filename2/accepted_hits.bam 
 				
		echo "fine tophat $filename2"



		
done	



