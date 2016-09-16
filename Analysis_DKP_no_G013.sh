bedtools multiinter -header -i /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_001.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_002.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_004.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_005.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_007.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_008.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_009.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_010.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_011.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_012.txt  /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_014.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_015.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_016.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_017.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_018.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_019.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_020.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_G_DKP_021.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_001.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_002.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_003.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_004.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_005.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_006.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_007.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_008.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_009.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_011.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_012.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_014.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_015.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_016.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_017.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_P_DKP_018.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_001.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_002.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_004.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_005.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_006.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_007.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_008.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_009.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_011.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_012.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_013.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_014.txt /Users/giacomino/Desktop/ACT/set_promoter/sorted_Promoter_M_DKP_015.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/Promoter_table_mutation_full_dataset_NO_G013.txt #peaks=618263

#unique Promoter Peak full dataset 
cat /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/Promoter_table_mutation_full_dataset_NO_G013.txt | uniq > /Users/giacomino/Desktop/DKP_NO_G013_figures/uniq_Promoter_table_mutation_full_dataset_NO_G013.txt
#number of unique peaks mapping to PROMOTER in the dataset 618263

#PROMOTER
#intersect the Promoter_table_peaks_full_dataset with the full dataset filtering out regions covering less then #40% original peak


bedtools intersect -wa -wb -f 0.40 -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/uniq_sorted_Full_dataset_peaks_promoter.txt -b /Users/giacomino/Desktop/DKP_NO_G013_figures/uniq_Promoter_table_mutation_full_dataset_NO_G013.txt > /Users/giacomino/Desktop/DKP_NO_G013_figures/intersect_PROMOTER_fulldataset_multiintersect_peaks_40_overlap_NO_G013.txt #numer of peaks 158566




cat /Users/giacomino/Desktop/DKP_NO_G013_figures/intersect_PROMOTER_fulldataset_multiintersect_peaks_40_overlap_NO_G013.txt |uniq  > /Users/giacomino/Desktop/DKP_NO_G013_figures/uniq_intersect_PROMOTER_fulldataset_multiintersect_peaks_40_overlap_NO_G013.txt #number of peaks 154290

cut -f1,2,3,4,5,6,7,8  /Users/giacomino/Desktop/DKP_NO_G013_figures/uniq_intersect_PROMOTER_fulldataset_multiintersect_peaks_40_overlap_NO_G013.txt |uniq > /Users/giacomino/Desktop/DKP_NO_G013_figures/uniq_intersect_PROMOTER_fulldataset_multiintersect_peaks_40_overlap_NO_G013_8col.txt

#Promoter peak full dataset merged 
bedtools merge -c 1,2,3 -o count -i /Users/giacomino/Desktop/DKP_NO_G013_figures/uniq_intersect_PROMOTER_fulldataset_multiintersect_peaks_40_overlap_NO_G013_8col.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/Merged_peaks_PROMOTER_NO_G13.txt


bedtools intersect  -a  /Users/giacomino/Desktop/DKP_NO_G013_figures/uniq_intersect_PROMOTER_fulldataset_multiintersect_peaks_40_overlap_NO_G013_8col.txt  -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/Merged_peaks_PROMOTER_NO_G13.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts_NO_G013.bed #peaks 154290


cut -f 4,5,6,7,8 /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts_NO_G013.bed | uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts_NO_G013_uniq.bed #peaks 73419

bedtools sort -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/final_promoter_set_with_peak_counts_NO_G013_uniq.bed >/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_final_promoter_set_with_peak_counts_NO_G013_uniq.bed

bedtools merge -c 1,2,3 -o count -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_final_promoter_set_with_peak_counts_NO_G013_uniq.bed > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/merged-sorted_final_promoter_set_with_peak_counts_NO_G013_uniq.bed #peaks 47335 was 49708 with G013

bedtools intersect -wa -wb -a /Users/giacomino/Downloads/promoter_DKP.bed  -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/sorted_final_promoter_set_with_peak_counts_NO_G013_uniq.bed > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013.txt

#R analysis
#########
###################################
#######################################
##########################################
##########################################

a=read.table("/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013.txt")
a=a[,c(1:3,7)]
a$V4 <- apply( a[ ,1:3 ] , 1 , paste , collapse = "-" )
a=cbind(a$V4,a$V7)
a=as.data.frame(a)
#values need to be values not factors

library(stringr)
a$V2=as.numeric(levels(a$V2))[a$V2]
#get the maximum value related from factor
final=aggregate(.~V1, a, FUN=max)
#file created to be read by bedtools containg promoter and sharings
write.table(final,file="/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013_to_format", dec=".", sep="\t")
#original_promoter_dataset_from_genome_browser_hg38_with the_relative_peak_counting_in_our_samples
portable=cbind(c, a$V2)
pdf(file="promoter_peaks_sharing_NO_G013.pdf",width=20, heigh=15) #the figure contains 25184 peaks with the relative counting
hist(final$V2,breaks=c(0:50),xlim=c(1,50),ylim=c(0,2500),border="darkGrey")
dev.off()

pdf(file="Promoter_shared_NO_G013.pdf",width=10, heigh=10)
boxplot(final$V2,medcol="darkGrey",border="darkGrey",whiskcol="black",staplecol="black",outline=FALSE )
dev.off()


#########
###################################
#######################################
##########################################
##########################################
#counting the peaks related samples in ENHANCER

bedtools multiinter -header -i /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_001.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_002.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_004.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_005.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_007.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_008.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_009.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_010.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_011.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_012.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_014.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_015.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_016_sorted.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_017.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_018.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_019.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_020.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_G_DKP_021.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_001.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_002.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_003.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_004.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_005.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_006.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_007.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_008.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_009.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_011.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_012.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_014.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_015.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_016.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_017.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_P_DKP_018.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_001.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_002.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_004.txt		 /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_005.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_006.txt		 	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_007.txt	/Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_008.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_009.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_011.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_012.txt  /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_013.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_014.txt /Users/giacomino/Desktop/ACT/set_regulatory_region/sorted_M_DKP_015.txt > /Users/giacomino/Desktop/ACT/set_regulatory_region/Regulatory_region_table_NO_G013.txt #merge 2662975

#unique Promoter Peak full dataset 
cat /Users/giacomino/Desktop/ACT/set_regulatory_region/Regulatory_region_table_NO_G013.txt   | uniq >  /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/uniq_sorted_Full_dataset_peaks_enhancer_NO_G013.txt  
#number of unique peaks mapping to ENHANCER in the dataset 2662975

bedtools intersect -wa -wb -f 0.40 -a  /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/uniq_sorted_Full_dataset_peaks_enhancer_NO_G013.txt   -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Full_dataset_NO_promoter.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap_NO_G013.txt #peaks 59545047 

#####arrived here!!!!!!!!!!!!!!!!!let s start by the next command

cut -f1,2,3,4,5,54,55,56 /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap_NO_G013.txt |uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/essential_intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap_NO_G013.txt #peaks 23783469

bedtools merge -c 1,2,3 -o count -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/essential_intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap_NO_G013.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER_NO_G013.txt #peaks 326720


bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER_NO_G013.txt  -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/essential_intersect_ENHANCER_fulldataset_multiintersect_peaks_20_overlap_NO_G013.txt > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_final_ENHANCER_set_with_peak_counts.bed

#arrived here!!!!!!!!!!!!!!!!!let s start by the next command

cut -f 1,2,3,10,11 /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_final_ENHANCER_set_with_peak_counts.bed | uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/final_NO_G013_final_ENHANCER_set_with_peak_counts.bed

bedtools sort -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/final_NO_G013_final_ENHANCER_set_with_peak_counts.bed >/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/sort_final_NO_G013_final_ENHANCER_set_with_peak_counts.bed #peaks 2661564

bedtools merge -c 1,2,3 -o count -i /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/sort_final_NO_G013_final_ENHANCER_set_with_peak_counts.bed > /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER_NO_G013.txt #peaks 326720

bedtools intersect -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Merged_peaks_ENHANCER_NO_G013.txt -b /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/sort_final_NO_G013_final_ENHANCER_set_with_peak_counts.bed >/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_Enhancer_counting_before_R.bed #2661564



a=read.table("/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_Enhancer_counting_before_R.bed")
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
pdf(file="enhancer_NO_G013_peaks_sharing.pdf",width=20, heigh=15) #the figure contains 25184 peaks with the relative counting
hist(final$V2,breaks=c(0:50),xlim=c(1,50),ylim=c(0,200000),border="darkRed")
dev.off()

pdf(file="Enhancer_shared_NO_G013.pdf",width=10, heigh=10)
boxplot(final$V2,medcol="darkGrey",border="darkRed",whiskcol="black",staplecol="black",outline=FALSE )
dev.off()


#uniq file enhancer noG013
cut -f1,2,3 /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/Enhancer_counting_before_R.bed | uniq > /Users/giacomino/Desktop/bed_to_sottoriva/ENHANCER_NO_G013.txt #we got the same number of enhancer as with G013


############
###############
##############
#Superenhancer_shared

bedtools multiinter -header -i /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_001_INPUT_sorted_G_DKP_001_H3K27ac_peaks_SuperEnhancers.table.bed.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_002_INPUT_sorted_G_DKP_002_H3K27ac_peaks_SuperEnhancers.table.bed.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_004_INPUT_sorted_G_DKP_004_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_005_INPUT_sorted_G_DKP_005_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_007_INPUT_sorted_G_DKP_007_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_009_H3K27ac_full_sorted_G_DKP_009_INPUT_full_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_010_H3K27ac_full_sorted_G_DKP_010_INPUT_full_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_011_H3K27ac_full_sorted_G_DKP_011_INPUT_full_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_012_INPUT_sorted_G_DKP_012_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_014_INPUT_sorted_G_DKP_014_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_015_INPUT_sorted_G_DKP_015_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_016_INPUT_sorted_G_DKP_016_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_017_INPUT_sorted_G_DKP_017_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_018_INPUT_sorted_G_DKP_018_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_019_INPUT_sorted_G_DKP_019_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_020_INPUT_sorted_G_DKP_020_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_G_DKP_021_INPUT_sorted_G_DKP_021_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_001_INPUT_sorted_M_DKP_001_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_002_INPUT_sorted_M_DKP_002_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_004_INPUT_sorted_M_DKP_004_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_005_INPUT_sorted_M_DKP_005_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_006_INPUT_sorted_M_DKP_006_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_007_INPUT_sorted_M_DKP_007_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_008_H3K27ac_full_sorted_M_DKP_008_INPUT_full_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_009_H3K27ac_full_sorted_M_DKP_009_INPUT_ful_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_012_INPUT_sorted_M_DKP_012_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_013_INPUT_sorted_M_DKP_013_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_014_INPUT_sorted_M_DKP_014_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_M_DKP_015_INPUT_sorted_M_DKP_015_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_001_INPUT_sorted_P_DKP_001_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_002_H3K27ac_full_sorted_P_DKP_002_INPUT_full_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_003_INPUT_sorted_P_DKP_003_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_004_INPUT_sorted_P_DKP_004_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_005_H3K27ac_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_006_INPUT_full_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_007_INPUT_full_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_008_INPUT_sorted_P_DKP_008_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_009_INPUT_sorted_P_DKP_009_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_011_INPUT_sorted_P_DKP_011_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_012_INPUT_sorted_P_DKP_012_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_014_INPUT_sorted_P_DKP_014_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_015_HK27ac_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_016_INPUT_sorted_P_DKP_016_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_017_INPUT_sorted_P_DKP_017_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_P_DKP_018_INPUT_sorted_P_DKP_018_H3K27ac_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_z_sorted_G_DKP_008_H3K27ac_sorted_G_DKP_005_INPUT_peaks_SuperEnhancers.table.txt /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_z_sorted_M_DKP_011_INPUT_sorted_M_DKP_011_H3K27ac_peaks_SuperEnhancers.table.txt > /Users/giacomino/Desktop/ACT/super_enhancer_tables/Full_SE_noG013_hg38.bed #52101 pieces

bedtools intersect -wa -wb -v -a /Users/giacomino/Desktop/ACT/super_enhancer_tables/Full_SE_noG013_hg38.bed -b /Users/giacomino/Desktop/hg38_promoter_plu2000bp.bed > /Users/giacomino/Desktop/ACT/super_enhancer_tables/no_promoter_Full_SE_noG013_hg38.bed #35660

cut -f1,2,3,4,5 /Users/giacomino/Desktop/ACT/super_enhancer_tables/no_promoter_Full_SE_noG013_hg38.bed > /Users/giacomino/Desktop/ACT/super_enhancer_tables/no_zero_no_promoter_Full_SE_noG013_hg38.bed #35660

cat /Users/giacomino/Desktop/ACT/super_enhancer_tables/ordinato_sorted_* > /Users/giacomino/Desktop/ACT/super_enhancer_tables/Raw_FULL_SE.txt #SE 29271
sort -k1,1n -k2,2n /Users/giacomino/Desktop/ACT/super_enhancer_tables/Raw_FULL_SE.txt > /Users/giacomino/Desktop/ACT/super_enhancer_tables/sort_Raw_FULL_SE.txt #29271

bedtools intersect -wa -wb -f 0.1 -a /Users/giacomino/Desktop/ACT/super_enhancer_tables/sort_Raw_FULL_SE.bed.txt  -b /Users/giacomino/Desktop/ACT/super_enhancer_tables/Full_SE_noG013_hg38.bed > /Users/giacomino/Desktop/ACT/super_enhancer_tables/intersect_SE_fulldataset_multiintersect_peaks_10_overlap_NO_G013.txt
 #34841


cut -f1,2,3,7,8 /Users/giacomino/Desktop/ACT/super_enhancer_tables/intersect_SE_fulldataset_multiintersect_peaks_10_overlap_NO_G013.txt |uniq > /Users/giacomino/Desktop/ACT/super_enhancer_tables/row_SE_with_count_no_promoter_overlap_NO_G013.bed
#sort -k1,1n -k6,6n /Users/giacomino/Desktop/ACT/super_enhancer_tables/essential_intersect_SE_fulldataset_multiintersect_peaks_10_overlap_NO_G013.txt > /Users/giacomino/Desktop/ACT/super_enhancer_tables/sorted_pieces_SE_related_NOG013.txt

#cut -f 1,6,7,4,5,2,3 /Users/giacomino/Desktop/ACT/super_enhancer_tables/sorted_pieces_SE_related_NOG013.txt | uniq > /Users/giacomino/Desktop/ACT/super_enhancer_tables/uniq_sorted_pieces_SE_related_NOG013.txt

a=read.table("/Users/giacomino/Desktop/ACT/super_enhancer_tables/row_SE_with_count_no_promoter_overlap_NO_G013.bed")



#the script is not the proper one, but the logic and the main function are common
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
pdf(file="SE_NO_G013_sharing.pdf",width=20, heigh=15) #the figure contains 25184 peaks with the relative counting
hist(final$V2,breaks=c(0:50),xlim=c(1,50),ylim=c(0,2500),border="darkRed")
dev.off()

pdf(file="Super_Enhancer_shared_NO_G013.pdf",width=10, heigh=10)
boxplot(final$V2,medcol="darkGrey",border="darkRed",whiskcol="black",staplecol="black",outline=FALSE )
dev.off()






############################
############################
############################FIG2A
#############################
#divide promoter in 11 groups (nevers used, 10th, 20th, 90th, 100th)
#creating_promoter_dataset_never_used
#never_used
bedtools intersect -v  -a /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/promoter_DKP_hg38_full.bed -b /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/promoter_peaks_no_G013.bed.txt | uniq > /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/not_catched_promoter_DKP_hg38.bed
#


a=read.table("/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013.txt")
a=a[,c(1:3,7)]
a$V4 <- apply( a[ ,1:3 ] , 1 , paste , collapse = "-" )
a=cbind(a$V4,a$V7)
a=as.data.frame(a)
#values need to be values not factors
library(stringr)
a$V2=as.numeric(levels(a$V2))[a$V2]
#get the maximum value related from factor
final=aggregate(.~V1, a, FUN=max)
c=str_split_fixed(a$V1, "-", 3)
c=as.data.frame(c)
#original_promoter_dataset_from_genome_browser_hg38_with the_relative_peak_counting_in_our_samples
#never used (present in 1 group)
ten=final[which(final$V2==1),]
write.table(ten, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_001.txt", sep="\t", dec=".")
twenty=final[which(final$V2>1 & final$V2<=4),]
write.table(twenty, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_002.txt", sep="\t", dec=".")
thirty=final[which(final$V2>4 & final$V2<=7),]
write.table(thirty, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_003.txt", sep="\t", dec=".")
fourty=final[which(final$V2>7 & final$V2<=12),]
write.table(fourty, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_004.txt", sep="\t", dec=".")
fifty=final[which(final$V2>12 & final$V2<=18),]
write.table(fifty, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_005.txt", sep="\t", dec=".")
sixty=final[which(final$V2>18 & final$V2<=23),]
write.table(sixty, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_006.txt", sep="\t", dec=".")
seventy=final[which(final$V2>23 & final$V2<=27),]
write.table(seventy, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_007.txt", sep="\t", dec=".")
eighty=final[which(final$V2>27 & final$V2<=30),]
write.table(eighty, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_008.txt", sep="\t", dec=".")
ninethy=final[which(final$V2>30 & final$V2<=33),]
write.table(ninethy, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_009.txt", sep="\t", dec=".")
hundred=final[which(final$V2>33 & final$V2<=45),]
write.table(hundred, file="/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dec_010.txt", sep="\t", dec=".")


#all promoter shared and not present in our dkp samples tagged with decil count #37919extended promoter sites +-50kb
cat /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/full_dataset_dkp_promoter_50kb_extended.txt | wc -l
#intersect the full_dataset_dkp_promoter_50kb_extended.txt with all our dataset enhancer
bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/full_dataset_dkp_promoter_50kb_extended.txt -b /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dataset_enhancer_dkp.txt  > /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/intersection_promoter_50kb_extended_enhancer_dkp_dataset.txt
# /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/intersection_promoter_50kb_extended_enhancer_dkp_dataset.txt shows promoter coordinate, patient promoters sharing, and decile of apartenence enhancer coordinate, patien enhancer sharing
a=read.table("/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/intersection_promoter_50kb_extended_enhancer_dkp_dataset.txt")
a$V10=apply(a[,1:3],1, paste, collapse="-")
a$V11=apply(a[,6:8],1, paste, collapse="-")
b=cbind(a$V10,a$V5)
b=as.data.frame(b)
#b$V2=as.numeric(levels(b$V2))[b$V2]
final=aggregate(.~V1, b, FUN=length)
c=cbind(a$V10,a$V5)
c=as.data.frame(c)
c=unique(c)
tot=merge(c,final, by="V1")
tot1=tot[,1:3]
tot=tot1
tot$V2.x=as.numeric(levels(tot$V2.x))[tot$V2.x]
tot$V2.x[tot$V2.x ==10] = 99
table(tot$V2.x)
pdf(file="promoter_enhancer_composition_50kb.pdf",width=20, heigh=15) 
boxplot(V2.y ~V2.x,data=tot)
dev.off()




cat /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/*25kb* > /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/full_dataset_dkp_promoter_25kb_extended.txt
bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/full_dataset_dkp_promoter_25kb_extended.txt -b /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/dataset_enhancer_dkp.txt  > /Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/intersection_promoter_25kb_extended_enhancer_dkp_dataset.txt
#load intersection promoter extended 25kb  with enhancer
a=read.table("/Volumes/SAM_BAM/DKP_H3K27ac_april/FIG2/intersection_promoter_25kb_extended_enhancer_dkp_dataset.txt")
#creat chr start end columns for promoter and enhancer
a$V10=apply(a[,1:3],1, paste, collapse="-")
a$V11=apply(a[,6:8],1, paste, collapse="-")
#creat matched dataframe promoter enhancer V5 is the index referring at which decile it appartains

b=cbind(a$V10,a$V5)
b=as.data.frame(b)
#b$V2=as.numeric(levels(b$V2))[b$V2]
#just promoter numeber of time promoter is recalled
final=aggregate(.~V1, b, FUN=length)
#how many enhancers are in the promoter ? V5 is the number of time the promoter has been recalled
c=cbind(a$V10,a$V5)
c=as.data.frame(c)
c=unique(c)
tot=merge(c,final, by="V1")
tot1=tot[,1:3]
tot=tot1
tot$V2.x=as.numeric(levels(tot$V2.x))[tot$V2.x]
tot$V2.x[tot$V2.x ==10] = 99
table(tot$V2.x)
pdf(file="promoter_enhancer_composition_25kb.pdf",width=20, heigh=15) 
boxplot(V2.y ~V2.x,data=tot,medcol="darkGrey",border="darkRed",whiskcol="black",staplecol="black",outline=FALSE)
dev.off()

#TUKEYtest
#deciles in factor
tot1$V2.x=factor(tot1$V2.x)
#Tukey test
TukeyHSD(aov(V2.y~V2.x, data=tot1))



###########################
############################
#BoxPlot of MACS2 score in shared peaks
####PROMOTER#################

promoter_shared=/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013_to_.bed.txt

bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013_to_.bed.txt -b /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_001_INPUT_sorted_G_DKP_001_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_002_INPUT_sorted_G_DKP_002_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_004_INPUT_sorted_G_DKP_004_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_005_INPUT_sorted_G_DKP_005_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_007_INPUT_sorted_G_DKP_007_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_009_H3K27ac_full_sorted_G_DKP_009_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_010_H3K27ac_full_sorted_G_DKP_010_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_011_H3K27ac_full_sorted_G_DKP_011_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_012_INPUT_sorted_G_DKP_012_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_014_INPUT_sorted_G_DKP_014_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_015_INPUT_sorted_G_DKP_015_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_016_INPUT_sorted_G_DKP_016_H3K27ac_peaks.narrowPeak.bed.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_017_INPUT_sorted_G_DKP_017_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_018_INPUT_sorted_G_DKP_018_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_019_INPUT_sorted_G_DKP_019_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_020_INPUT_sorted_G_DKP_020_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_021_INPUT_sorted_G_DKP_021_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_001_INPUT_sorted_M_DKP_001_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_002_INPUT_sorted_M_DKP_002_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_004_INPUT_sorted_M_DKP_004_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_005_INPUT_sorted_M_DKP_005_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_006_INPUT_sorted_M_DKP_006_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_007_INPUT_sorted_M_DKP_007_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_008_H3K27ac_full_sorted_M_DKP_008_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_009_H3K27ac_full_sorted_M_DKP_009_INPUT_ful_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_012_INPUT_sorted_M_DKP_012_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_013_INPUT_sorted_M_DKP_013_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_014_INPUT_sorted_M_DKP_014_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_015_INPUT_sorted_M_DKP_015_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_001_INPUT_sorted_P_DKP_001_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_002_H3K27ac_full_sorted_P_DKP_002_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_003_INPUT_sorted_P_DKP_003_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_004_INPUT_sorted_P_DKP_004_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_005_H3K27ac.bam_sorted_P_DKP_005_Input.bam_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_006_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_007_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_008_INPUT_sorted_P_DKP_008_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_009_INPUT_sorted_P_DKP_009_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_011_INPUT_sorted_P_DKP_011_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_012_INPUT_sorted_P_DKP_012_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_014_INPUT_sorted_P_DKP_014_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_015_HK27ac.bam_sorted_P_DKP_015_INPUT.bam_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_016_INPUT_sorted_P_DKP_016_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_017_INPUT_sorted_P_DKP_017_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_018_INPUT_sorted_P_DKP_018_H3K27ac_peaks.narrowPeak.bed > /Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/shared_PROMOTER_peaks_MACS_score.bed

a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/shared_PROMOTER_peaks_MACS_score.bed")
#seleziono shared peaks e MACS related score
b=a[,c(1:4,13)]
library(stringr)
b$V1 <- apply( b[ ,1:3 ] , 1 , paste , collapse = "-" )
c=b[,c(1,4,5)]
final=aggregate(.~V1, c, FUN=median)
write.table(final,file="/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/promoter_sharing_macs_score.bed", dec=".", sep="\t")
pdf(file="promoter_shared_macs_score.pdf",width=20, heigh=15) 
boxplot(V13 ~V4,data=final,medcol="darkGrey",border="darkGrey",whiskcol="black",staplecol="black",outline=FALSE )
dev.off()



#########ENHANCER#################

enhancer_shared=/Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_Enhancer_counting_post_R_to_format.bed
bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_Enhancer_counting_post_R_to_format.bed -b /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_001_INPUT_sorted_G_DKP_001_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_002_INPUT_sorted_G_DKP_002_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_004_INPUT_sorted_G_DKP_004_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_005_INPUT_sorted_G_DKP_005_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_007_INPUT_sorted_G_DKP_007_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_009_H3K27ac_full_sorted_G_DKP_009_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_010_H3K27ac_full_sorted_G_DKP_010_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_011_H3K27ac_full_sorted_G_DKP_011_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_012_INPUT_sorted_G_DKP_012_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_014_INPUT_sorted_G_DKP_014_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_015_INPUT_sorted_G_DKP_015_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_016_INPUT_sorted_G_DKP_016_H3K27ac_peaks.narrowPeak.bed.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_017_INPUT_sorted_G_DKP_017_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_018_INPUT_sorted_G_DKP_018_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_019_INPUT_sorted_G_DKP_019_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_020_INPUT_sorted_G_DKP_020_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_G_DKP_021_INPUT_sorted_G_DKP_021_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_001_INPUT_sorted_M_DKP_001_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_002_INPUT_sorted_M_DKP_002_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_004_INPUT_sorted_M_DKP_004_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_005_INPUT_sorted_M_DKP_005_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_006_INPUT_sorted_M_DKP_006_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_007_INPUT_sorted_M_DKP_007_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_008_H3K27ac_full_sorted_M_DKP_008_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_009_H3K27ac_full_sorted_M_DKP_009_INPUT_ful_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_012_INPUT_sorted_M_DKP_012_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_013_INPUT_sorted_M_DKP_013_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_014_INPUT_sorted_M_DKP_014_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_M_DKP_015_INPUT_sorted_M_DKP_015_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_001_INPUT_sorted_P_DKP_001_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_002_H3K27ac_full_sorted_P_DKP_002_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_003_INPUT_sorted_P_DKP_003_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_004_INPUT_sorted_P_DKP_004_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_005_H3K27ac.bam_sorted_P_DKP_005_Input.bam_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_006_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_007_INPUT_full_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_008_INPUT_sorted_P_DKP_008_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_009_INPUT_sorted_P_DKP_009_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_011_INPUT_sorted_P_DKP_011_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_012_INPUT_sorted_P_DKP_012_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_014_INPUT_sorted_P_DKP_014_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_015_HK27ac.bam_sorted_P_DKP_015_INPUT.bam_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_016_INPUT_sorted_P_DKP_016_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_017_INPUT_sorted_P_DKP_017_H3K27ac_peaks.narrowPeak.bed /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_P_DKP_018_INPUT_sorted_P_DKP_018_H3K27ac_peaks.narrowPeak.bed > /Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/shared_ENHANCER_peaks_MACS_score.bed


a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/shared_ENHANCER_peaks_MACS_score.bed")
b=a[,c(1:4,13)]
library(stringr)
b$V1 <- apply( b[ ,1:3 ] , 1 , paste , collapse = "-" )
c=b[,c(1,4,5)]
final=aggregate(.~V1, c, FUN=median)
write.table(final,file="/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/enhancer_sharing_macs_score.bed", dec=".", sep="\t")
pdf(file="enhancer_shared_macs_score.pdf",width=20, heigh=15) 
boxplot(V13 ~V4,data=final,medcol="darkGrey",border="darkRed",whiskcol="black",staplecol="black",outline=FALSE  )
dev.off()

#Let s do the same figure with MACS FOLD instead MACS SCORE
###PROMOTER#############
a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/shared_PROMOTER_peaks_MACS_score.bed")
b=a[,c(1:4,12)]
library(stringr)
b$V1 <- apply( b[ ,1:3 ] , 1 , paste , collapse = "-" )
c=b[,c(1,4,5)]
final=aggregate(.~V1, c, FUN=median)
write.table(final,file="/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/promoter_sharing_macs_FOLD.bed", dec=".", sep="\t")
pdf(file="promoter_shared_macs_FOLD.pdf",width=20, heigh=15) 
boxplot(V12 ~V4,data=final,medcol="darkGrey",border="darkGrey",whiskcol="black",staplecol="black",outline=FALSE )
dev.off()



###ENHANCER#############
a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/shared_ENHANCER_peaks_MACS_score.bed")
b=a[,c(1:4,12)]
library(stringr)
b$V1 <- apply( b[ ,1:3 ] , 1 , paste , collapse = "-" )
c=b[,c(1,4,5)]
final=aggregate(.~V1, c, FUN=median)
write.table(final,file="/Volumes/GIACO/DKP_analysis_june_2016/MACS_SCORE_shared/ENHANCER_sharing_macs_FOLD.bed", dec=".", sep="\t")
pdf(file="enhancer_shared_macs_FOLD.pdf",width=20, heigh=15) 
boxplot(V12 ~V4,data=final,medcol="darkGrey",border="darkRed",whiskcol="black",staplecol="black",outline=FALSE )
dev.off()




