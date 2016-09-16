cd /Users/giacomino/Tools/
count_1=0
 for filenames in /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/GO*.bam ;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}

let "count_1++"

#realigner target creator
echo "realigner target creator for ${filename3}"
java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator --num_threads 16 -R /Users/giacomino/Genomes/hg19/BOWTIE2/ucsc.hg19.fasta -I $filenames -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_$filename3.txt


#IndelRealigner
echo "Indel realigner for ${filename4}"
java -jar GenomeAnalysisTK.jar -T IndelRealigner --num_threads 16 -R /Users/giacomino/Genomes/hg19/BOWTIE2/ucsc.hg19.fasta -I $filenames -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -targetIntervals /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_$filename3.txt -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/realigned_$filename3.bam

done




#Indels realignemt GOLDEN
#prepare the reference dictionary
java -jar picard.jar CreateSequenceDictionary R= /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta  O= /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.dict
#prepare the reference fasta.fai
samtools faidx /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta
#run gatk realigner target creator GOLDEN_LESION
java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator --num_threads 16 -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_Lesion.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Lesion.txt
#run gatk realigner target creator GOLDEN_PRIMARY
java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator --num_threads 16 -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_primary.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Primary.txt
#run gatk realigner target creator GOLDEN_BLOOD
java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator --num_threads 16 -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_blood.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Blood.txt
#run gatk realigner target creator GOLDEN_METASTATIC
java -jar GenomeAnalysisTK.jar -T RealignerTargetCreator --num_threads 16 -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_Metastatic.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Metastatic.txt

#echo "Indel realigner for GOLDEN_LESION"
java -jar GenomeAnalysisTK.jar -T IndelRealigner -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_Lesion.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -targetIntervals /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Lesion.intervals -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/INDEL_REALIGNER/indel_realigned_GOLDEN_Lesion.bam
#echo "Indel realigner for GOLDEN_PRIMARY"
java -jar GenomeAnalysisTK.jar -T IndelRealigner -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_Primary.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -targetIntervals /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Primary.intervals -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/INDEL_REALIGNER/indel_realigned_GOLDEN_Primary.bam
##echo "Indel realigner for GOLDEN_METASTATIC"
java -jar GenomeAnalysisTK.jar -T IndelRealigner -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_Metastatic.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -targetIntervals /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Metastatic.intervals -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/INDEL_REALIGNER/indel_realigned_GOLDEN_Metastatic.bam
##echo "Indel realigner for GOLDEN_BLOOD"
java -jar GenomeAnalysisTK.jar -T IndelRealigner -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_GOLDEN_Blood.bam -known /Users/giacomino/Genomes/GATK_bundle/Mills_and_1000G_gold_standard.indels.hg19.vcf -targetIntervals /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/REALIGNER_TARGET_CREATOR/indel_target_GOLDEN_Blood.intervals -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/INDEL_REALIGNER/indel_realigned_GOLDEN_Blood.bam


#base recalibrator
#GOLDEN_LESION
java -jar GenomeAnalysisTK.jar -T BaseRecalibrator -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/INDEL_REALIGNER/indel_realigned_GOLDEN_Lesion.bam -knownSites /Users/giacomino/Genomes/GATK_bundle/dbsnp_138.hg19.vcf -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/BASE_RECALIBRATOR/GOLDEN_LESION.grp


java -jar GenomeAnalysisTK.jar -T PrintRead -R /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta -I /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/INDEL_REALIGNER/indel_realigned_GOLDEN_Lesion.bam -BQSR recalibration_report.grp -o /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/BASE_RECALIBRATOR/ind_real_base_recali_GOLDEN_LESION.bam



