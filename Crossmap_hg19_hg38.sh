count_1=0

for filenames in /Volumes/GIACO/DKP_analysis_june_2016/DHS_sites_DUKE_macs_calling/*peaks.narrowPeak ;do

filename2=${filenames##*/}				
		 filename3=${filename2%.*}
         filename4=${filename3%_*}
         echo $filename4
         let "count_1++"
         echo $count_1 
echo "from hg19 to hg38"
Crossmap.py bed /Users/giacomino/Downloads/hg19ToHg38.over.chain.gz $filenames /Volumes/GIACO/DKP_analysis_june_2016/DHS_sites_hg38/$filename4

done