#pipeline Targeted_seq_third_bit_analysis

#bowtie2_GOLDEN_Primary
bowtie2 -p 8 -t -q -local -x /Users/giacomino/Genomes/hg19/BOWTIE2/ -1 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004628/160302_SN172_0529_BC8NC6ACXX_CGAACTTA_L001_R1_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004628/160302_SN172_0529_BC8NC6ACXX_CGAACTTA_L002_R1_001.fastq -2 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004628/160302_SN172_0529_BC8NC6ACXX_CGAACTTA_L001_R2_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004628/160302_SN172_0529_BC8NC6ACXX_CGAACTTA_L002_R2_001.fastq -S /Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_GOLDEN_primary.sam >>/Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_log_GOLDEN_primary.log 2>&1

#bowtie2_GOLDEN_Lesion
bowtie2 -p 8 -t -q --local -x /Users/giacomino/Genomes/hg19/BOWTIE2/ -1 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004629/160302_SN172_0529_BC8NC6ACXX_GATAGACA_L001_R1_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004629/160302_SN172_0529_BC8NC6ACXX_GATAGACA_L002_R1_001.fastq -2 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004629/160302_SN172_0529_BC8NC6ACXX_GATAGACA_L001_R2_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004629/160302_SN172_0529_BC8NC6ACXX_GATAGACA_L002_R2_001.fastq -S /Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_GOLDEN_Lesion.sam >>/Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_log_GOLDEN_Lesion.log 2>&1



#bowtie2_GOLDEN_Metastatic
bowtie2 -p 8 -t -q --local -x /Users/giacomino/Genomes/hg19/BOWTIE2/ -1 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004630/160302_SN172_0529_BC8NC6ACXX_AAGGACAC_L001_R1_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004630/160302_SN172_0529_BC8NC6ACXX_AAGGACAC_L002_R1_001.fastq -2 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004630/160302_SN172_0529_BC8NC6ACXX_AAGGACAC_L001_R2_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004630/160302_SN172_0529_BC8NC6ACXX_AAGGACAC_L002_R2_001.fastq -S /Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_GOLDEN_Metastatic.sam >>/Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_log_GOLDEN_Metastatic.log 2>&1


#bowtie2_ sample034_Metastatic
bowtie2 -p 8 -t -q --local -x /Users/giacomino/Genomes/hg19/BOWTIE2/ -1 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004642/160302_SN172_0529_BC8NC6ACXX_GACAGTGC_L001_R1_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004642/160302_SN172_0529_BC8NC6ACXX_GACAGTGC_L002_R1_001.fastq -2 /Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004642/160302_SN172_0529_BC8NC6ACXX_GACAGTGC_L001_R2_001.fastq,/Volumes/FASTQ/TARGETED_SEQ_third/DKP_TARGETED_last_run/2016-03-02/IGF0004642/160302_SN172_0529_BC8NC6ACXX_GACAGTGC_L002_R2_001.fastq -S /Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_034_Metastatic.sam >>/Volumes/SAM_BAM/TARGETED_seq_26012016/bowtie_third_bit/sample_log_sample_0034_Metastatic.log 2>&1





#proper_mutect_run
java -Xmx30g -jar muTect-1.1.4.jar --analysis_type MuTect --reference_sequence /Users/giacomino/Genomes/GATK_bundle/ucsc.hg19.fasta --intervals /Volumes/SAM_BAM/TARGETED_seq_26012016/amplicons.bed  --input_file:normal /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_034_Normal_complete.bam --input_file:tumor /Volumes/SAM_BAM/TARGETED_seq_26012016/sample_ready_to_be_analysed/sample_034_Primary_complete.bam --out /Users/giacomino/analysis/prova.txt