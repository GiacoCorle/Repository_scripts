#linead di comando per l'allineamento dei fastq di CAGEseq

/usr/local/bin/tophat-2.0.14.Linux_x86_64/tophat2 -p 8 -o /mnt/NFS_SHARE_3/Breast_Cancer_public_dataset/OUTPUT_TOPHAT2/$filename4/ -G /mnt/NFS_SHARE_1/Genomes/Homo_sapiens/Ensembl/GRCh37/Annotation/Genes/genes.gtf  --library-type fr-firststrand /mnt/NFS_SHARE_1/Genomes/Homo_sapiens/Ensembl/GRCh37/Sequence/Bowtie2Index/genome $filenames $result_string
