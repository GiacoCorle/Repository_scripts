#!/bin/bash
for filename in /mnt/NFS_SHARE_3/Cell_lines/*.rnaseq.fastq.gz.cip; do
   
java -jar /home/genomi/Downloads/EgaDemoClient.jar -p aweisz@unisa.it LMMGe_15 -dc $filename  -dck giacomino1
       echo $filename
        
    done



java -jar /home/genomi/Downloads/EgaDemoClient.jar -p aweisz@unisa.it LMMGe_15 -rfd EGAD00001000725 -re giacomino1 -label request_18_05


java -jar /home/genomi/Downloads/EgaDemoClient.jar -p aweisz@unisa.it LMMGe_15 -path /mnt/NFS_SHARE_3/new_download/ -nt 8 -dr request_18_05
