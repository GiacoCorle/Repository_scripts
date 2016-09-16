#counting the peaks related samples in PROMOTER _NO_G013

bedtools multiinter -header -i /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_001.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_002.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_004.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_005.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_007.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_008.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_009.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_010.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_011.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_012.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_013.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_014.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_015.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_016.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_017.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_018.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_019.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_020.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_021.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_001.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_002.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_003.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_004.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_005.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_006.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_007.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_008.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_009.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_011.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_012.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_014.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_015.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_016.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_017.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_018.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_001.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_002.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_004.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_005.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_006.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_007.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_008.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_009.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_011.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_012.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_013.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_014.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_015.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/Promoter_table_mutation_full_dataset.txt

#unique Promoter Peak full dataset 
cat /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_Full_dataset_peaks_promoter.txt | uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/uniq_sorted_Full_dataset_peaks_promoter.txt
#number of unique peaks mapping to PROMOTER in the dataset  579949

#PROMOTER
#intersect the Promoter_table_peaks_full_dataset with the full dataset filtering out regions covering less then 40% original peak
bedtools intersect -wa -wb -f 0.40 -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/uniq_sorted_Full_dataset_peaks_promoter.txt -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_multiintersect_Promoter_table_peaks_full_dataset.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/intersect_PROMOTER_fulldataset_multiintersect_peaks_20_overlap.txt #numer of peaks 154445

cat /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/intersect_PROMOTER_fulldataset_multiintersect_peaks_20_overlap.txt |uniq  > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/uniq_intersect_PROMOTER_fulldataset_multiintersect_peaks_20_overlap.txt #number of peaks 150262

cut -f1,2,3,4,5,6,7,8  /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/uniq_intersect_PROMOTER_fulldataset_multiintersect_peaks_20_overlap.txt |uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/intersect_PROMOTER_fulldataset_multiintersect_peaks_20_overlap_8col.txt

#Promoter peak full dataset merged 
bedtools merge -c 1,2,3 -o count -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/intersect_PROMOTER_fulldataset_multiintersect_peaks_20_overlap_8col.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/Merged_peaks_PROMOTER.txt


bedtools intersect  -a  /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/intersect_PROMOTER_fulldataset_multiintersect_peaks_20_overlap_8col.bed.txt  -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/Merged_peaks_PROMOTER.bed.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts.bed #peaks 150262

cut -f 4,5,6,7,8 /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts.bed | uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts_merged_uniq.bed #peaks 75280

bedtools sort -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts_merged_uniq.bed >/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_final_promoter_set_with_peak_counts_merged_uniq.bed

bedtools merge -c 1,2,3 -o count -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_final_promoter_set_with_peak_counts_merged_uniq.bed > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/MERGED_final_promoter_set_with_peak_counts_merged_uniq.bed #peaks 49708

bedtools intersect -wa -wb -a /Users/giacomino/Downloads/promoter_DKP.bed  -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_final_promoter_set_with_peak_counts_merged_uniq.bed > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure.bed

#R analysis
#########
###################################
#######################################
##########################################
##########################################

a=read.table("/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure.bed")
a=a[,c(1:3,7)]
a$V4 <- apply( a[ ,1:3 ] , 1 , paste , collapse = "-" )
a=cbind(a$V4,a$V7)
a=as.data.frame(a)
#values need to be values not factors
a$V2=as.numeric(levels(a$V2))[a$V2]
#get the maximum value related from factor
final=aggregate(.~V1, a, FUN=max)
c=str_split_fixed(a$V1, "-", 3)
c=as.data.frame(c)
#original_promoter_dataset_from_genome_browser_hg38_with the_relative_peak_counting_in_our_samples
portable=cbind(c, a$V2)
pdf(file="promoter_peaks_sharing.pdf",width=20, heigh=15) #the figure contains 25184 peaks with the relative counting
hist(final$V2,breaks=c(0:50),xlim=c(1,50),ylim=c(0,3500),border="darkGrey")
dev.off()




#########
###################################
#######################################
##########################################
##########################################
#counting the peaks related samples in ENHANCER

bedtools multiinter -header -i /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_001.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_002.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_004.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_005.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_007.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_008.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_009.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_010.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_011.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_012.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_013.txt	 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_014.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_015.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_016_sorted.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_017.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_018.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_019.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_020.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_021.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_001.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_002.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_003.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_004.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_005.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_006.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_007.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_008.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_009.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_011.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_012.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_014.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_015.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_016.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_017.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_018.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_001.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_002.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_004.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_005.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_006.txt		 	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_007.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_008.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_009.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_011.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_012.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_013.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_014.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_015.txt > /Users/giacomino/Desktop/ACT/set_regulatory_region/Regulatory_region_table.txt 

#unique Promoter Peak full dataset 
cat /Users/giacomino/Desktop/ACT/set_regulatory_region/Regulatory_region_table.txt  | uniq >  /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/uniq_sorted_Full_dataset_peaks_enhancer.txt  
#number of unique peaks mapping to ENHANCER in the dataset 3067988

bedtools intersect -wa -wb -f 0.40 -a  /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/uniq_sorted_Full_dataset_peaks_enhancer.txt   -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Full_dataset_NO_promoter.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap.txt #peaks 62371032


cut -f1,2,3,4,5,54,55,56 /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap.txt |uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/essential_intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap.txt #peaks 25085518

bedtools merge -c 1,2,3 -o count -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/essential_intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER.txt #434900


bedtools intersect -wa -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER.txt  -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/essential_intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap.txt  > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/final_ENHANCER_set_with_peak_counts.bed

cut -f 1,2,3,10,11 /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/final_ENHANCER_set_with_peak_counts.bed | uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_ENHANCER_set_with_peak_counts_merged_uniq.bed

bedtools sort -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_ENHANCER_set_with_peak_counts_merged_uniq.bed >/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sort_final_ENHANCER_set_with_peak_counts_merged_uniq.bed #peaks 3066152

bedtools merge -c 1,2,3 -o count -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sort_final_ENHANCER_set_with_peak_counts_merged_uniq.bed > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER.txt #peaks 434900

bedtools intersect -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER.txt -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sort_final_ENHANCER_set_with_peak_counts_merged_uniq.bed >/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Enhancer_counting_before_R.bed #3066152



a=read.table("/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Enhancer_counting_before_R.bed")
a=a[,7:10]
a$V1 <- apply( a[ ,1:3 ] , 1 , paste , collapse = "-" )
a=cbind(a$V1,a$V10)
a=as.data.frame(a)
#values need to be values not factors
a$V2=as.numeric(levels(a$V2))[a$V2]
#get the maximum value related from factor
final=aggregate(.~V1, a, FUN=max)
c=str_split_fixed(a$V1, "-", 3)
c=as.data.frame(c)
#original_promoter_dataset_from_genome_browser_hg38_with the_relative_peak_counting_in_our_samples
portable=cbind(c, a$V2)
pdf(file="enhancer_peaks_sharing.pdf",width=20, heigh=15) #the figure contains 25184 peaks with the relative counting
hist(final$V2,breaks=c(0:50),xlim=c(1,50),ylim=c(0,270000),border="darkRed")
dev.off()

pdf(file="Enhancer_shared.pdf",width=10, heigh=10)
boxplot(final$V2,medcol="darkGrey",border="darkRed",whiskcol="black",staplecol="black",outline=FALSE )
dev.off()
#########
###################################
#######################################
##########################################
##########################################
#counting the peaks related samples in SUPERENHANCER









