#N_P_26_M_Matrix_enhancer

n=matrix(, nrow=10,ncol=5)
files <- list.files(path="/Volumes/GIACO/TARGET_SEQ_downsampling/26_N_P_M/MUTECT_analysis/ENHANCER/N_P", pattern="FILT_GREP", full.names=T, recursive=FALSE)
#a=read.table("/Users/giacomino/Desktop/dati_matrix_np26_enhancer/GREP_sorted_Normal_0.1_sorted_Primary_0.1_enhancer_bin01.txt", fill=TRUE, header=FALSE)
#a=a$V22 #t_alt_count
#a=median(a)
#n[1,1]=a
c=lapply(files, function(x) {
    a <- tryCatch(read.table(x, fill=TRUE, header=FALSE), error=function(e) NULL) # load file
    # #apply function
   a=a$V22
   
a=length(a)
#a=as.matrix(a)
#a=as.data.frame(a)
#a$V1=as.character(levels(a$V1))[a$V1]
#a$V3=as.numeric(levels(a$V3))[a$V3]
#a$V4=as.numeric(levels(a$V4))[a$V4]
#a$V2=as.numeric(levels(a$V2))[a$V2]
#a$V5=a$V3/a$V4
#a
 }
)




string="ok"
n=matrix(, nrow=10,ncol=45)
for (z in 1:length(c))
{
a=c[[z]]
FLAG=0
#print("var")
#print (a)
    if (is.null(a)){
    
        a=toString(a)
        a=as.numeric(a)
        a=0
    }
    for (i in 1:nrow(n))
        {
            
        #print(i)
                
            for (j in 1:ncol(n)) {
                #print(j)
                if ( FLAG==0 && is.na(n[i,j])) {
                #print(string)
                n[i,j]=a
                
                FLAG=1
                #break
                }
                
            
            
            }
            #break
        
        
        }
        }
  matplot(n,type="l")  
def=t(n)
    
    
    
        






