N=0
cat /Users/giacomino/Downloads/sorted_peaks_formatted.txt
while read LINE ; do 
N=$((N+1))  
echo $N 
done file.txt 
