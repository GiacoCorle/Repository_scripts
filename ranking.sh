#RANKING
#PROMOTER
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Normalised_peak_table/norm*.txt ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
#         echo $filename4
#         let "count_1++"
#         echo $count_1  
#keep just coordinates and NORM SCORE
#cut -f 1,2,3,8 $filenames > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/PROMOTER_peaks/FILT/filt_$filename4.bed
#uniq /Volumes/GIACO/DKP_analysis_june_2016/RANKING/PROMOTER_peaks/FILT/filt_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/PROMOTER_peaks/FILT/uniq_$filename4.bed
#bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013_to_.bed.txt -b /Volumes/GIACO/DKP_analysis_june_2016/RANKING/PROMOTER_peaks/FILT/uniq_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/PROMOTER_peaks/INTERSECTED_$filename4.bed
#sort -r  -nk8 /Volumes/GIACO/DKP_analysis_june_2016/RANKING/PROMOTER_peaks/INTERSECTED_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/PROMOTER_peaks/sorted_INTERSECTED_$filename4.bed
#done

#ENHANCER
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Normalised_peak_table/norm*.txt ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
#         echo $filename4
#         let "count_1++"
#         echo $count_1  
#keep just coordinates and NORM SCORE
#cut -f 1,2,3,8 $filenames > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/FILT/filt_$filename4.bed
#uniq /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/FILT/filt_$filename4.bed | sort -r  -nk8 > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/FILT/uniq_$filename4.bed
#bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_Enhancer_counting_post_R_to_format.bed -b /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/FILT/uniq_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/INTERSECTED_$filename4.bed
#sort -r  -nk8 /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/INTERSECTED_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/sorted_INTERSECTED_$filename4.bed
#done



#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/RANKING/ENHANCER_peaks/sorted_INTERSECTED_$filename4.bed ;do
#percentile=$9
#tmp="$(tempfile)"
#total=cat $filenames | wc -l
# (n + 99) / 100 with integers is effectively ceil(n/100) with floats
#count=$(((total * percentile + 99) / 100))
#head -n $count | tail -n 1
#done

cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
count=1
while [ $count -lt 2 ]  
do
echo "0."$count
java -Xmx30g -jar picard.jar DownsampleSam INPUT=/Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_026_Primary_complete.bam  OUTPUT=/Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/Primary_0.$count.bam PROBABILITY=0.$count
 let "count+= 1"
 
