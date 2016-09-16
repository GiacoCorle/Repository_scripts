#Targeted seq Sample 26 Normal - Primary - Metastatic and Fresh Frozen Normal - Primary




#Sample 26 NORMAL 6.84 orignal
#cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
#count=1
#while [ $count -lt 10 ]  
#do
#echo "0."$count
#java -Xmx30g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_026_Normal_complete.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/Normal_0.$count.bam PROBABILITY=0.$count
# let "count+= 1"
 
#done


#Sample 26 PRIMARY original 13.4Gb
#cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
#count=1
#while [ $count -lt 10 ]  
#do
#echo "0."$count
#java -Xmx30g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_026_Primary_complete.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/Primary_0.$count.bam PROBABILITY=0.$count
# let "count+= 1"
 
#done


#Sample 26 METASTATIC original 13.23Gb
#cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
#count=1
#while [ $count -lt 10 ]  
#do
#echo "0."$count
#java -Xmx30g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_026_Metastatic_complete.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/Metastatic_0.$count.bam PROBABILITY=0.$count
# let "count+= 1"
 
#done

#Sample 26 NORMAL 6.84 orignal
cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
count=1
while [ $count -lt 10 ]  
do
echo "0."$count
java -Xmx10g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_blood.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/FROZEN_N_P_L/BAM/Blood_0.$count.bam PROBABILITY=0.$count
 let "count+= 1"
 
done

















#count_1=0
#for filenames in /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/*.bam ;do
#        filename2=${filenames##*/}				
#        filename3=${filename2%.*}
#        filename4=${filename3%_*}
#        let "count_1++"
#        echo $filename3
#        samtools sort -T /tmp/$filename3.sorted -o /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/SORTED/sorted_$filename3.bam $filenames

#        samtools index /Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/SORTED/sorted_$filename3.bam
        
#        done