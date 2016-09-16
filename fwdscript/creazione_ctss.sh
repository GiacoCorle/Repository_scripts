#i bam ottenuti dall'allineamento devo essere convertiti in un formato accettato da CageR. Con questo script converto i bam in formato CTSS (cage tag starting site)



for filenames in /mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/*.bam ;do
	#echo $filenames
filename1="${filenames##*/}"
echo $filename1

#script for positive strand
samtools view -uq 20  $filenames \
| bamToBed -i stdin \
| awk 'BEGIN{OFS="\t"}{if($6=="+"){print $1,$2,$5}}' \
| sort -k1,1 -k2,2n \
| groupBy -i stdin -grp 1,2 -opCols 3 -ops count \
| awk 'BEGIN{OFS="\t"}{print "chr"$1,$2,"+",$3}' >/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/PROVA_FILE/test1_positive_strand.txt
echo "concluso $filename1"
echo "apro $filename1"



#script for negative strand
samtools view -uq 20 $filenames \
| bamToBed -i stdin \
| awk 'BEGIN{OFS="\t"}{if($6=="-"){print $1,$3,$5}}' \
| sort -k1,1 -k2,2n \
| groupBy -i stdin -grp 1,2 -opCols 3 -ops count \
| awk 'BEGIN{OFS="\t"}{print "chr"$1,$2-1,"-",$3}' >/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/PROVA_FILE/test1_negative_strand.txt
echo "concluso $filename1"

echo "lego e ordino $filename1"
cat /mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/PROVA_FILE/test1_positive_strand.txt /mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/PROVA_FILE/test1_negative_strand.txt >/mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/PROVA_FILE/concatenate"_$filename1".txt   
sort -nk2 /mnt/NFS_SHARE_3/Cage_data_TOPHAT/CAGE_DATA_BAM/PROVA_FILE/concatenate"_$filename1".txt
echo "completato estrazione file CTSS $filename1"
 done



