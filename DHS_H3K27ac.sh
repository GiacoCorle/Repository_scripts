#######extend 500pb +- H3k27ac peaks each patients NO_G01c3ount_1=0

#for filenames in /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/*.bed ;do

#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
#         echo $filename4
#         let "count_1++"
#        echo $count_1 
#awk '{OFS="\t"} ($2-=500)1 && ($3+=500)1 ' $filenames > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/MACS_peaks_hg38_DKP_extended_500/$filename4."bed"
#awk '{OFS="\t"}  ($2-=500)1 ' $filenames > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/MACS_peaks_hg38_DKP_less_500/$filename4."bed"
#awk '{OFS="\t"}  ($3+=500)1 ' $filenames > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/MACS_peaks_hg38_DKP_plus_500/$filename4."bed"
#done


#####create an unique bed file with all DHS hypersensitivity sites
#cat /Volumes/GIACO/DKP_analysis_june_2016/DHS_sites_hg38/wgEncode* > /Volumes/GIACO/DKP_analysis_june_2016/all_DHS_sites_hg38.bed


#######merge the unique hypersensitivity site with bedfile of each patient keeping just the overlapped region (those are the NFR)
#sort the huge DHS database
#count_1=0
#counting_1=0
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/MACS_peaks_hg38_DKP_extended_500/*.bed ;do

#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
#         echo $filename3
#         let "count_1++"
         #echo $count_1 

#for file in /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/*.bed ;do
#file2=${file##*/}				
#		 file3=${file2%.*}
#        file4=${file3%_*}
      #echo $file4
 #        let "counting_1++"
         #echo $counting_1 
#if [ "$file4 " = "$filename3 " ] ; then
 ##     echo $count_1  $counting_1
#      echo "${file4}    ${filename3}"
#bedtools intersect -wb -F 0.99 -a $filenames  -b /Volumes/GIACO/DKP_analysis_june_2016/sorted_all_DHS_sites_hg38.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Intersection_DKP_DHS/dhs_intersection_$filename4.bed

#echo "Sorting intersected bed"
#sort the identified overlapping peaks
#sort -k1,1 -k2,2n /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Intersection_DKP_DHS/dhs_intersection_$filename4.bed >/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Intersection_DKP_DHS/sorted_dhs_intersection_$filename4.bed
#echo "Merging overlapping features"
#merge all the overlapping region within the file in order to find univoque overlapping peaks
#bedtools merge -i /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Intersection_DKP_DHS/sorted_dhs_intersection_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Unique_DHS_DKP_peaks/unique_DHS_$filename4.bed

#subtract the coordinate in the overlapping file which occurr on the DKP chip seq. We retain just valleys signal
#echo "Subtraction to DKP histone chip peaks"
#bedtools subtract -a /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Unique_DHS_DKP_peaks/unique_DHS_$filename4.bed -b $file  > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Just_DHS_sites/DHS_$filename4.bed
#retain DHS sites fitting between 2 histones
#echo "Keep just the valleys"
##########NOT_used_for_the_analysis########awk ' {OFS="\t"} { if ($3-$2 <500)  print $1,$2,$3,$4 }' /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Just_DHS_sites/DHS_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Final_NFR_DKP_hg38/NFR_$filename4.bed
#eliminate FP occurrance on the left
#bedtools intersect -a /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/MACS_peaks_hg38_DKP_less_500/$filename3."bed" -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Just_DHS_sites/DHS_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Just_DHS_sites_2/DHS_$filename4.bed
#eliminate FP occurrance on the right
#bedtools intersect -a /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/MACS_peaks_hg38_DKP_plus_500/$filename3."bed" -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Just_DHS_siteS_2/DHS_$filename4.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/FINAL_DHS_CHIP_hg38/DHS_$filename4.bed

############NOT USED FOR ANALYSIS#bedtools intersect -v -a /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Final_NFR_DKP_hg38/NFR_$filename4.bed -b $filenames > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Final_NFR_DKP_hg38/NFkkkkkR_$filename4.bed
#echo "Done"
#fi
#done
#done



###############################################################################################################################
#defining NucleosomeFreeRegion in broad peaks
#select summits in each sample getting just annotations with a:j endings
#for filenames in /Volumes/SAMSUNG_D3/H3K27ac_ChIP_Tumour/MACS_calling_Giacomo/sorted_*_summits.bed ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
#         echo $filename4
 #        let "count_1++"
#        echo $count_1 
#select just the coordinates which finish with numbers and letters (subpeaks)
#cat $filenames | grep -E  '_[0-9]+[abcdefjhilmnopqrst]' > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Narrow_peaks/$filename4.narrowed.bed
#done

#extending summits
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Narrow_peaks/*.bed ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
#         echo $filename4
#         let "count_1++"
 #       echo $count_1 
#awk '{OFS="\t"} ($2-=71)1 && ($3+=71)1 ' $filenames > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Extended_71plusminus_Narrow_peaks/extended_$filename4.bed

#done

#select broad peaks with subpeaks inside. Here I get all broad peaks showing subpeaks
#for filenames in /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/*.bed ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#       filename4=${filename3%_*}
#         echo $filename4
#         let "count_1++"
#        echo $count_1 
#cat $filenames | grep -E  '_[0-9]+[abcdefjhilmnopqrst]' > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Broad_Peaks_selected/extended_$filename4.bed
#done


#########################NFR in sub peak###########################
#########################               ###########################
#########################               ###########################
#count_1=0
#counting_1=0
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Broad_Peaks_selected/extended*.bed ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#        filename4=${filename3%_*}
         #echo $filename4
#         let "count_1++"
         #echo $count_1 

#for file in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Extended_71plusminus_Narrow_peaks/extended*.bed ;do
#file2=${file##*/}				
#		 file3=${file2%.*}
#        file4=${file3%_*}
      #echo $file3
#    let "counting_1++"
         #echo $counting_1 
#if [ "$file3 " = "$filename4 " ] ; then
 #    echo $count_1  $counting_1
 #     echo "${file4}    ${filename4}"
#echo "subtract"
#bedtools subtract -a $filenames -b $file > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Subtraction_Broad_extended_summits/sub_$file4.bed 
#echo "intersect"
#bedtools intersect -wb -F 0.1 -a /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/Subtraction_Broad_extended_summits/sub_$file4.bed -b /Volumes/GIACO/DKP_analysis_june_2016/sorted_all_DHS_sites_hg38.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/NFR_in_broadpeak/DHS_in_broad_$file4.bed
#sort -k1,1 -k2,2n  /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/NFR_in_broadpeak/DHS_in_broad_$file4.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/NFR_in_broadpeak/sorted_DHS_in_broad_$file4.bed
#echo "merge"
#bedtools merge -i /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/NFR_in_broadpeak/sorted_DHS_in_broad_$file4.bed  > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/FINAL_MERGED_NFR1_in_broadpeak/DHS_in_broad_$file4.bed
#fi
#done 
#done

#######concatenate the NFR intra and interpeaks sample by sample######
#########################
#########################
#########################
#########################
#count_1=0


#merge intrapeaks NFR and narrowPeak NRF
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/FINAL_DHS_CHIP_hg38/DHS_sorted*.bed ;do
#filename2=${filenames##*/}				
#		 filename3=${filename2%.*}
#         filename4=${filename3%_*}
#         echo $filename4
#         let "count_1++"
#         echo $count_1  
#         counting_1=0
#for file in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/FINAL_MERGED_NFR1_in_broadpeak/DHS_in_broad_extended_sorted_*.bed ;do
#file2=${file##*/}				
#		 file3=${file2%.*}
#     file4=${file3%_*}
        #echo $file3
#        let "counting_1++"

#if [ "$count_1 " == "$counting_1 " ] ; then
#    echo $count_1  $counting_1
#      echo "${file4}    ${filename3}"
#echo catto
#cat $filenames $file | uniq > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/$filename4_$file3.bed

#fi
#done
#done


#######Run motif analysis in the concatenated NFR in promoter and ENhancer in 2 separate files
#########################
#########################
#########################
#########################
#Create a Promoter_NFR file
#bedtools intersect -F 0.51  -a  /Users/giacomino/Desktop/bed_to_sottoriva/PROMOTER_HG38.bed -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/DEFINITIVE_uniq_sorted_Whole_dataset_annotation.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/PROMOTER/PROMOTER_NFR_hg38.bed
#Create an ENHANCER_NFR file
#bedtools intersect -F 0.51  -a /Users/giacomino/Desktop/bed_to_sottoriva/ENHANCER_HG38.bed  -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/DEFINITIVE_uniq_sorted_Whole_dataset_annotation.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/ENHANCER/ENHANCER_NFR_hg38.bed


#findMotifsGenome.pl /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/PROMOTER/PROMOTER_NFR_hg38.bed /Users/giacomino/Genomes/hg38/hg38.fa /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/HOMER/PROMOTER/ -size given -preparse


#######Run motif analysis in the concatenated NFR in promoter and ENhancer in 2 separate files
#########################
#########################
#########################
#########################
#match TF name from the motif analysis
#promoter and enhancer TF file already filtered selecting the 50 TF with highest observed/background fold
#head /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/HOMER/ENHANCER/ENHANCER_H3K27ac_1207.txt |  
#grep -o $0 "[^\(]*" /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/HOMER/PROMOTER/PROMOTER_H3K27ac_1207_filtered.txt #it does not work properly, do a manella the filtering ND Lbeling


#Create a polar histogram

#polar histogram PROMOTER

#a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/HOMER/PROMOTER/PROMOTER_H3K27ac_1207_filtered.txt")
#b=a
#c=levels(b$V1)[b$V1]
#rownames(b)=c
#pdf(file="Promoter_total_motifs.pdf",width=20, heigh=20)
#p=ggplot(b,aes(x=V1,y=V4))+geom_bar(width=1, stat='identity',fill="darkGrey", colour="white",size=5) + theme_light() + scale_fill_gradient(low='white', high='darkgrey', limits=c(0.5,3)) + theme(axis.title.y=element_text(angle=0))
#p + theme(axis.text.x = element_text(angle=45, vjust = 1, hjust=1))
#p + coord_polar()
#pdf(file="Promoter_total_motifs.pdf",width=20, heigh=20)
#p + coord_polar() + aes(x=reorder(V1, V4)) + theme(axis.text.x = element_text(angle=0), text = element_text(size=20)) 
#dev.off()



#polar histogram ENHANCER
#a=read.table("/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/HOMER/ENHANCER/ENHANCER_H3K27ac_filtered.txt")
#b=a
#c=levels(b$V1)[b$V1]
#rownames(b)=c
#p=ggplot(b,aes(x=V1,y=V4))+geom_bar(width=1, stat='identity',fill="darkRed", colour="white",size=5) + theme_light() + scale_fill_gradient(low='white', high='darkRed', limits=c(0.5,3)) + theme(axis.title.y=element_text(angle=0))
#p + theme(axis.text.x = element_text(angle=45, vjust = 1, hjust=1))
#p + coord_polar()
#pdf(file="Enhancer_total_motifs.pdf",width=20, heigh=20)
#p + coord_polar() + aes(x=reorder(V1, V4)) + theme(axis.text.x = element_text(angle=0), text = element_text(size=20)) 
#dev.off()
#dev.off()




######DHS-PROMOTER#######################
#bedtools multiinter -header -i /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_001_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_002_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_004_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_005_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_007_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_008_H3K27ac_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_009_H3K27ac_full_sorted_G_DKP.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_010_H3K27ac_full_sorted_G_DKP.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_011_H3K27ac_full_sorted_G_DKP.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_012_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_014_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_015_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_016_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_017_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_018_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_019_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_020_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_G_DKP_021_INPUT_sorted_G.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_001_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_002_H3K27ac_full_sorted_P_DKP.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_003_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_004_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_005_H3K27ac.bam_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_006.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_006_H3K27ac_full_sorted_P_DKP_007.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_008_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_009_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_011_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_012_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_014_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_015_HK27ac.bam_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_016_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_017_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_P_DKP_018_INPUT_sorted_P.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_001_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_002_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_004_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_005_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_006_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_007_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_008_H3K27ac_full_sorted_M_DKP.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_009_H3K27ac_full_sorted_M_DKP.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_011_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_012_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_013_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_014_INPUT_sorted_M.bed /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/unique_selected_sorted_DHS_in_broad_extended_sorted_M_DKP_015_INPUT_sorted_M.bed   > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/DHS_multiintersection.bed

#cat /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/DHS_multiintersection.bed | uniq > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/unique_DHS_multiintersection.bed

#bedtools intersect -wa -wb -f 0.10 -a /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/PROMOTER/PROMOTER_NFR_hg38.bed -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/unique_DHS_multiintersection.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/Intersect_PROMOTER_unique_DHS_multiintersection.bed

#cut -f1,2,3,4,5,6,7,8  /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/Intersect_PROMOTER_unique_DHS_multiintersection.bed |uniq > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_Intersect_PROMOTER_unique_DHS_multiintersection.bed

#sort -k1,1 -k2,2n /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_Intersect_PROMOTER_unique_DHS_multiintersection.bed >/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/sorted_uniq_Intersect_PROMOTER_unique_DHS_multiintersection.bed

#bedtools merge -c 1,2,3 -o count -i /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/sorted_uniq_Intersect_PROMOTER_unique_DHS_multiintersection.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/merged_PROMOTER.bed

#bedtools intersect -a  /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_Intersect_PROMOTER_unique_DHS_multiintersection.bed  -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/merged_PROMOTER.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_promoter_merged_PROMOTER.bed

#cut -f 4,5,6,7,8 /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_promoter_merged_PROMOTER.bed | uniq >  /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_PROMOTER_uniq_set.bed

#bedtools sort -i /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_PROMOTER_uniq_set.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/sorted_final_PROMOTER_uniq_set.bed


#########FIRST APPROACH #####################using file obtained by row 250
 #bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013_to_.txt  -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_TEMPORARY_FILES/merged_sorted_final_PROMOTER_uniq_set.bed  > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/First_approach_merged_sorted_final_PROMOTER_uniq_set.bed

#then format the file obtain a final full /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_PROMOTER_DHS_index_to_motif.bed.txt 
#COUNTER=1
#for i in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_PROMOTER_DHS_index_to_motif.bed.txt ; do
#while [ $COUNTER -lt 49 ]  
#do
#echo $COUNTER
#seleziono la colonna 5 e la filtro iterativamente seguendo l index. Creo ogni file in base all indice, corrispondente alnumero di shared dhs sites based on shared promoters. 
#awk '$5 ~ /^'$COUNTER'_/ ' /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_PROMOTER_DHS_index_to_motif.bed.txt> /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/DHS_coordinate_promoter_index_$COUNTER.txt
#cat /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/DHS_coordinate_promoter_index_$COUNTER.txt | uniq > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/DHS_coordinate_promoter_index_unique_$COUNTER.txt
#echo $COUNTER
#let "COUNTER++"
#done
#done



#count=0
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/*unique*.txt ;do
#filename2=${filenames##*/}				
#		filename3=${filename2%.*}
#        filename4=${filename3%_*}
#         echo $filename3
#        let "count++"
#if [ "$count" -gt "22" ] ; then
#echo $filename3
#findMotifsGenome.pl $filenames /Users/giacomino/Genomes/hg38/hg38.fa /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/HOMER_ANALYSIS/$filename3 -size given -preparse
#fi
#done





#########SECOND APPROACH #####################

#second approach
#bedtools intersect -wa -wb -a /Users/giacomino/Downloads/promoter_DKP.bed  -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/sorted_final_PROMOTER_uniq_set.bed |uniq > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/DHS_PROMOTER_merged.bed

#cut -f 4,5,6,7,8 /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/DHS_PROMOTER_merged.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/DHS_PROMOTER_merged_just_DHS.bed

#bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_promoter/PROMOTER_peaks_merged_to_figure_NO_G013_to_format -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/DHS_PROMOTER_merged_just_DHS.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/Both_index_DHS_PROMOTER_merged_just_DHS.bed



#COUNTER="1"
#for i in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_DHS_index_to_motif.txt; do
#while [ $COUNTER -lt 49 ]  
#do
#echo $COUNTER
#seleziono la colonna 5 e la filtro iterativamente seguendo l index. Creo ogni file in base all indice, corrispondente alnumero di shared dhs sites based on shared promoters. 
#awk '$5 ~ /^'$COUNTER'_/ ' /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_DHS_index_to_motif.txt > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/PROMOTER_DHS_$COUNTER.txt
#cat /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/PROMOTER_DHS_$COUNTER.txt | uniq > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/uniq_PROMOTER_DHS_$COUNTER.txt
#echo $COUNTER
#let "COUNTER++"
#done
#done


######DHS-ENHANCER#######################
###from row 243
#bedtools intersect -wa -wb -f 0.10 -a /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/CONCATENATION_FINAL_INTRA_INTER_PEAKS/ENHANCER/ENHANCER_NFR_hg38.bed -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/unique_DHS_multiintersection.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/Intersect_ENHANCER_unique_DHS_multiintersection.bed

#cut -f1,2,3,4,5,6,7,8  /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/Intersect_ENHANCER_unique_DHS_multiintersection.bed |uniq > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_Intersect_ENHANCER_unique_DHS_multiintersection.bed

#sort -k1,1 -k2,2n /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_Intersect_ENHANCER_unique_DHS_multiintersection.bed >/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/sorted_uniq_Intersect_ENHANCER_unique_DHS_multiintersection.bed

#bedtools merge -c 1,2,3 -o count -i /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/sorted_uniq_Intersect_ENHANCER_unique_DHS_multiintersection.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/merged_ENHANCER.bed

#bedtools intersect -a  /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_Intersect_ENHANCER_unique_DHS_multiintersection.bed  -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/merged_ENHANCER.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_enhancer_merged_ENHANCER.bed

#cut -f 4,5,6,7,8 /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_enhancer_merged_ENHANCER.bed | uniq >  /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_final_enhancer_merged_ENHANCER.bed

#bedtools sort -i /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_final_enhancer_merged_ENHANCER.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/sorted_uniq_final_enhancer_merged_ENHANCER.bed


#bedtools intersect -wa -wb -a /Volumes/SAM_BAM/DKP_H3K27ac_april/ACT/set_for_act_no_PROM/NO_G013_Enhancer_counting_post_R_to_format.bed  -b /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/merged_ENHANCER.bed > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_First_approach_merged_sorted_final_ENHANCER_uniq_set.bed


#then format the file obtain a final full Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/uniq_Intersect_ENHANCER_unique_DHS_multiintersection.bed 
#COUNTER=1
#for i in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/First_approach_merged_sorted_final_ENHANCER_uniq_set ; do
#while [ $COUNTER -lt 49 ]  
#do
#echo $COUNTER
#seleziono la colonna 5 e la filtro iterativamente seguendo l index. Creo ogni file in base all indice, corrispondente alnumero di shared dhs sites based on shared promoters. 
#awk '$5 ~ /^'$COUNTER'_/ ' /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/final_First_approach_merged_sorted_final_ENHANCER_uniq_set.txt> #/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/ENHANCER_files_for_motifs/First_approach/DHS_coordinate_enhancer_index_$COUNTER.txt
#cat /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/ENHANCER_files_for_motifs/First_approach/DHS_coordinate_enhancer_index_$COUNTER.txt | uniq > #/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/ENHANCER_files_for_motifs/First_approach/DHS_coordinate_enhancer_index_unique_$COUNTER.txt
#echo $COUNTER
#let "COUNTER++"
#done
#done



#count=0
#for filenames in /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/ENHANCER_files_for_motifs/First_approach/*unique*.txt ;do
#filename2=${filenames##*/}				
#		filename3=${filename2%.*}
#        filename4=${filename3%_*}
        #echo $count
#        let "count++"
#         if [ "$count" -gt "21" ]; then
         #echo $filename3
        

#echo $filename3
#findMotifsGenome.pl $filenames /Users/giacomino/Genomes/hg38/hg38.fa /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/ENHANCER_files_for_motifs/First_approach/HOMER_ANALYSIS/$filename3 -size given -preparse -p 10
#fi
#done







##############
#################
######################
#####################
#CREATING TF observed/expected matrix#####

#TF analysis MANIFEST ENHANCER############
#sort -t _ -k 6 -g /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/ENHANCER_files_for_motifs/First_approach/HOMER_ANALYSIS/* #and then fare a manella
#TF analysis MANIFEST PROMOTER############
#sort -t _ -k 6 -g /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/SHARED_DHS_amongst_patients/PROMOTER_files_for_motifs/First_approach/HOMER_ANALYSIS/* #and then fare a manella

########ENHANCER#####################
#read manifest and loop in lines, keep just TFs,qvalue,observed,expected, remove percentage(the sed command)
count=0 ; cat /Volumes/GIACO/ENHANCER_files_TF_manifest.txt |   while read line ;do line2=${line##*/}; line3=${line2%.*}; line4=${line3%_*}  let "count++" ; cat $line"/knownResults.txt" |  cut -f1,5,7,9 |sed 's/%//g'  > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/TF_MATRIX/ENHANCER/$line3.txt ;done

#PROMOTER##############
#######################
###################
#count=0 ; cat /Volumes/GIACO/PROMOTER_files_TF_manifest.txt |   while read line ;do line2=${line##*/}; line3=${line2%.*}; line4=${line3%_*}  let "count++" ; cat $line"/knownResults.txt" |  cut -f1,5,7,9 |sed 's/%//g'  > /Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/TF_MATRIX/PROMOTER/$line3.txt ;done

#this is the script developed to obtain the matrix. For ENHANCER and PROMOTER we need just to change the input file path
n=matrix(, nrow=400,ncol=55)
files <- list.files(path="/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/TF_MATRIX/ENHANCER/", pattern="*.txt", full.names=T, recursive=FALSE)
c=lapply(files, function(x) {
    a <- read.table(x, fill=TRUE, header=FALSE) # load file
    # #apply function
   a=a[-(1:1),]
    a$V5=0
a=as.matrix(a)
a=as.data.frame(a)
a$V1=as.character(levels(a$V1))[a$V1]
a$V3=as.numeric(levels(a$V3))[a$V3]
a$V4=as.numeric(levels(a$V4))[a$V4]
a$V2=as.numeric(levels(a$V2))[a$V2]
a$V5=a$V3/a$V4
a
 }
)

ns="NS"
for (z in 1:length(c)){
a=c[[z]]
a=na.omit(a)
print(a)
    for (i in 1:nrow(a))
        {
        #print (i)
        var=a[i,1]
        score=a[i,5]
        sig=a[i,2]
        #print(var)
            FLAG=0
            for ( j in 1:nrow(n))
                    {
                    #print(j)
                    mas=nrow(a)
                    #print(n[j,1])
                    if (is.na(n[j,1]) && FLAG==0 && sig<0.051 )   {
                    #print(j)
                    #print(n[j,1])
                    n[j,1]=var
                    n[j,z+1]=score
                    print(n[j,1])
                    break
                            }
                    if (is.na(n[j,1]) && FLAG==0 && sig>0.051 ){
                            n[j,1]=var
                            n[j,z+1]=ns
                    
                   }
                    if  (n[j,1]==var && sig<0.051){
                     #break
                    
                    n[j,z+1]=score
                    FLAG=1
                    break
                        }
                        if  (n[j,1]==var && sig>0.051) {
                             n[j,z+1]=ns
                                FLAG=1
                                break
                        
                        
                        }
                        #print(n)
                        }
                   
                }
                      
        }
 # write.table(n,file="/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/TF_MATRIX/PROMOTER/PROMOTER_MATRIX_SIGNIFICANCE.txt",dec=".",sep="\t")



#heatmap#######
###############
library(RColorBrewer)
library(gplots)
library(matrixStats)
tab=read.table("/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/TF_MATRIX/ENHANCER/ENHANCER_MATRIX_SIGNIFICANCE.txt")
a = tab
a=as.matrix(a)
a[a=="NS"]=0
a[is.na(a)]=0
a=as.data.frame(a)
a=a[-1,]
rownames(a)=a[,1]
a=a[,-1]
b=a
b=as.matrix(b)
b=as.data.frame(b, stringsAsFactors=FALSE)
b=as.data.frame(sapply(b,as.numeric))
b[b=="Inf"]=0
rownames(b)=rownames(a)

###ENHANCER#########
####################
############b = (b - rowmeans(b))
setwd("/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/TF_MATRIX/ENHANCER")
colors = c(seq(-0.1,-0.01,length=200),seq(0.01,3,length=200))
my_palette <- colorRampPalette(c("white","white","white","white","white","white","ghostwhite","indianred2","brown2","brown4" ))
hr <- hclust(dist(b, method="euclidean"), method="ward.D") 
hc <- hclust(dist(t(b), method="euclidean"), method="ward.D") 
mycl <- cutree(hr, h=max(hr$height)/1.5); 
mycol <- sample(rainbow(256)); 
mycol <- mycol[as.vector(mycl)];
group = as.vector(c(rep("blue",20),rep("red",25)))
jpeg("heatmap_enhenacer_TFs.jpg",width=20,height=40, units= "in", res=300)
heatmap.2(as.matrix(b),Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc),col=my_palette,breaks=colors, density.info="none", trace="none",symm=F,symkey=F,symbreaks=T, scale="none",margin=c(10,10), keysize=2)
dev.off()

#PROMOTER########
#setwd("/Volumes/GIACO/DKP_analysis_june_2016/Trascription_factor_bind_figure/TF_MATRIX/PROMOTER")
#colors = c(seq(-0.1,-0.01,length=200),seq(0.01,3,length=200))
#my_palette <- colorRampPalette(c("white","white","white","white","white","white","ghostwhite","grey80","grey50","grey30"))
#hr <- hclust(dist(b, method="euclidean"), method="ward.D") 
#hc <- hclust(dist(t(b), method="euclidean"), method="ward.D") 
#mycl <- cutree(hr, h=max(hr$height)/1.5); 
#mycol <- sample(rainbow(256)); 
#mycol <- mycol[as.vector(mycl)];
#group = as.vector(c(rep("blue",20),rep("red",25)))
#jpeg("heatmap_promoter_TFs.jpg",width=20,height=40, units="in",res=300)
#heatmap.2(as.matrix(b),Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc),col=my_palette,breaks=colors, density.info="none", trace="none",symm=F,symkey=F,symbreaks=T, scale="none",margin=c(10,10), keysize=2)
#dev.off()

#####################RANKING####################
################################################
################################################

#####BAM deduplication#######
#cd /Users/giacomino/Tools/picard/picard-tools-2.1.1
#count=0
#for filenames in /Volumes/SAM_BAM/DKP_H3K27ac_april/SORTED_BAM/sorted_*H3K27*.bam ;do
#filename2=${filenames##*/}				
#		filename3=${filename2%.*}
#        filename4=${filename3%_*}
#        echo $filename3
#        let "count++"
#        java -jar picard.jar  MarkDuplicates REMOVE_DUPLICATES=true I=$filenames O=/Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/deduplicated_$filename4.bam            M=/Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/deduplicated_$filename4.txt
#        samtools sort -T /tmp/filename.sorted -o /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/sorted_deduplicated_$filename4.bam /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/deduplicated_$filename4.bam
#        samtools index /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/sorted_deduplicated_$filename4.bam
        
#done

#####BAM_PEAKS coverage depth####
################################
#################

count_1=0
for filenames in /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Deduplicated_raw_fastq/sorted_deduplicated*.bam ;do
filename2=${filenames##*/}				
		 filename3=${filename2%.*}
        filename4=${filename3%_*}
         #echo $filename4
         let "count_1++"
         #echo $count_1 
counting_1=0
for file in /Volumes/SAM_BAM/DKP_H3K27ac_april/MACS2_DKP_april_h3k27ac/sorted_*.bed ;do
file2=${file##*/}				
		 file3=${file2%.*}
        file4=${file3%_*}
      #echo $file3
   let "counting_1++"
         #echo $counting_1 
if [ "$count_1 " = "$counting_1 " ] ; then
     
     echo $count_1  $counting_1
      echo "${file4}    ${filename3}"
      bedtools multicov -bams $filenames -bed $file > /Volumes/GIACO/DKP_analysis_june_2016/RANKING/Peak_coverage/$filename3_$file4.txt
 fi

 done
 
 done
        
#notmalization applied to peaks in excel

        # =(((K2/L2)*1000000)/M2)*1000
