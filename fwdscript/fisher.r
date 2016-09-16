###########################################################################  
##	Copyright 2013 Giorgio Giurato										 ##
##																		 ##
##  This file is part of iMir.											 ##
##																		 ##
##  iMir is free software: you can redistribute it and/or modify		 ##
##  it under the terms of the GNU General Public License as published by ##
##  the Free Software Foundation, either version 3 of the License, or	 ##
##  (at your option) any later version.									 ##
##																		 ##		
##  iMir is distributed in the hope that it will be useful,				 ##
##  but WITHOUT ANY WARRANTY; without even the implied warranty of		 ##
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the	 	 ##
##  GNU General Public License for more details.						 ##
##																		 ##
##  You should have received a copy of the GNU General Public License	 ##
##  along with iMir.  If not, see <http://www.gnu.org/licenses/>.		 ##
###########################################################################

## To transform counts from two samples into a contingency table

tablacont <- function (x, total) {  # x; total: 2 x 1
  m1 <- round(c(x[1], total[1]-x[1]), 0)
  m2 <- round(c(x[2], total[2]-x[2]), 0)
  tt <- rbind(m1, m2)
  colnames(tt) <- c("yes", "no")
  tt
}

## Fisher's exact test


fisher.ngs <- function(datos1, datos2, adjP = "fdr") {

  suma1 <- apply(as.matrix(datos1), 1, sum)
  suma2 <- apply(as.matrix(datos2), 1, sum)
 
  tot <- c(sum(suma1), sum(suma2))

  dat <- cbind(suma1, suma2)

  totfi <- apply(dat, 2, sum)

  pValue <- NULL

  for (g in 1:nrow(dat)) {
    ttt <- tablacont(dat[g,], totfi)
    pValue <- c(pValue, fisher.test(ttt)$p.value)
  }

  names(pValue) <- rownames(dat)

  pAdj <- p.adjust(pValue, method = adjP)

  cbind(pValue,pAdj)
}
