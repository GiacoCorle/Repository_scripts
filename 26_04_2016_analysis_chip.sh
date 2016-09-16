#alignment darren, ilenia, laura samples

count_1=0
 for filenames in /Volumes/GIACO/26_04_2016/*/*/*CAF*.fastq;do 
    filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         filename5=${filename4%_*}
         #reads 50bp long, I use bowtie mapped to hg19
         echo $filename5
         let "count_1++"
         echo “Bowtie is working…..”
         echo $count_1
		 echo “It’s aligning ${filename5}”
			#reads long less then 50bp
            #from fastq to sam and statistics redirection
	bowtie -q -t --sam -p 8  /Users/giacomino/Genomes/mm9/mm9 $filenames /Volumes/GIACO/26_04_2016/Darren/Aligned/$filename5.sam >>/Volumes/GIACO/26_04_2016/Darren/Aligned/$filename5.log 2>&1 
        
		#from sam to bam
        echo "from sam to bam"
		samtools view -b -S /Volumes/GIACO/26_04_2016/Darren/Aligned/$filename5.sam > /Volumes/GIACO/26_04_2016/Darren/Aligned/$filename5.bam
		echo "bam sorting"
        
        #bam sorting by coordinate
        samtools sort -T /tmp/$filename5.sorted -o /Volumes/GIACO/26_04_2016/Darren/Aligned/sorted_$filename5.bam /Volumes/GIACO/26_04_2016/Darren/Aligned/$filename5.bam
		#bam indexing
        echo "bam indexing"
       samtools index /Volumes/GIACO/26_04_2016/Darren/Aligned/sorted_$filename5.bam
        echo "bam removal"
        rm /Volumes/GIACO/26_04_2016/Darren/Aligned/$filename5.bam
        
done

#ilenia peaks
samtools cat -o /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_Laura_INPUTs.bam  /Volumes/GIACO/26_04_2016/Laura/Aligned/sorted_G1_INPUT_TTAGGC_L008.bam /Volumes/GIACO/26_04_2016/Laura/Aligned/sorted_G2M_INPUT_TAGCTT_L008.bam
samtools sort -T /tmp/$filename3.sorted -o /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_properly_Laura_INPUTs.bam /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_Laura_INPUTs.bam
samtools index /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_properly_Laura_INPUTs.bam

macs2 callpeak -t /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_M7_RM_C20_ACAGTG_L007.bam -c /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_properly_Laura_INPUTs.bam --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/26_04_2016/Ilenia/MACS2/ -n _sorted_M7_RM_C20_ACAGTG_L007_sorted_properly_Laura_INPUTs

macs2 callpeak -t /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_M7_WM_C20_GATCAG_L007.bam -c /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_properly_Laura_INPUTs.bam --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/26_04_2016/Ilenia/MACS2/ -n sorted_M7_WM_C20_GATCAG_L007_sorted_properly_Laura_INPUTs

macs2 callpeak -t /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_M7_WM_E2_C20_TGACCA_L007.bam -c /Volumes/GIACO/26_04_2016/Ilenia/Aligned/sorted_properly_Laura_INPUTs.bam --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/26_04_2016/Ilenia/MACS2/ -n sorted_M7_WM_E2_C20_TGACCA_L007_sorted_properly_Laura_INPUTs

#laura peaks
macs2 callpeak -t /Volumes/GIACO/26_04_2016/Laura/Aligned/sorted_G1_H3_GCCAAT_L008.bam -c /Volumes/GIACO/26_04_2016/Laura/Aligned/sorted_G1_INPUT_TTAGGC_L008.bam --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/26_04_2016/Laura/MACS2/ -n sorted_G1_H3_GCCAAT_L008_sorted_G1_INPUT_TTAGGC_L008

macs2 callpeak -t //Volumes/GIACO/26_04_2016/Laura/Aligned/sorted_G2M_H3_CTTGTA_L008.bam -c /Volumes/GIACO/26_04_2016/Laura/Aligned/sorted_G2M_INPUT_TAGCTT_L008.bam --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/26_04_2016/Laura/MACS2/ -n sorted_G2M_H3_CTTGTA_L008_sorted_G2M_INPUT_TAGCTT_L008




#darren peaks
macs2 callpeak -t /Volumes/GIACO/26_04_2016/Darren/Aligned/sorted_CAF1A_H3_CTTGTA_L007.bam -c /Volumes/GIACO/26_04_2016/Darren/Aligned/sorted_CAF1A_INPUT_GCCAAT_L007.bam --format AUTO  -B --SPMR --call-summits -q 0.01 -g hs --outdir /Volumes/GIACO/26_04_2016/Darren/MACS2/ -n sorted_CAF1A_H3_CTTGTA_L007_sorted_CAF1A_INPUT_GCCAAT_L007