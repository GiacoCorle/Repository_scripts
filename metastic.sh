#Sample 26 METASTATIC origina 13.4Gb
#cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
#count=8
#while [ $count -lt 10 ]  
#do
#echo "0."$count
#java -Xmx30g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_026_Metastatic_complete.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/Metastatic_0.$count.bam PROBABILITY=0.$count
# let "count+= 1"
 
#done


#cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
#count=1
#while [ $count -lt 10 ]  
#do
#echo "0."$count
#java -Xmx10g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_primary.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/FROZEN_N_P_L/BAM/Primary_0.$count.bam PROBABILITY=0.$count
# let "count+= 1"
 
# done
 
 cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
count=1
while [ $count -lt 10 ]  
do
echo "0."$count
java -Xmx10g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_Lesion.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/FROZEN_N_P_L/BAM/Lesion_0.$count.bam PROBABILITY=0.$count
 let "count+= 1"
 
 done