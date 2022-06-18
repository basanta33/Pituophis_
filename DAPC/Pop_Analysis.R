library(vcfR)
library(poppr)
library(ape)
library(RColorBrewer)
#DAPC
#Loading the fasta file as DNAbin object
dapc<-fasta2DNAbin("snk.fa")
#convert DNAbin to DNAbin to GENIND
obj <- DNAbin2genind(dapc, polyThres=0.1)
### find number of clusters for DAPC
#clustering
grp<-find.clusters(obj,max.n.clust=40)
# asks for number of PCAs to retain. Choose all of them
#then asks for number of clusters and this is at the lowest point
grp$grp #Shows which sample is in each group
#DAPC
dapc1<- dapc(obj, grp$grp)
dapc1
#Displays the plot of the DAPC
scatter(dapc1)
assignplot(dapc1, only.grp = NULL) #shows which sample is in which group in a graphical format
#colors vector
#myCol = c("purple", "blue", "green", "orange")

plot1 <- scatter(dapc1, scree.da=FALSE, bg="white", pch=20, cell=0, cstar=0, col=myCol,solid=.4, cex=3,clab=0, leg=TRUE)

myInset <- function(){
  temp <- dapc1$pca.eig
  temp <- 100* cumsum(temp)/sum(temp)
  plot(temp, col=rep(c("black", "lightgrey"),
                     c(dapc1$n.pca, 1000)), ylim=c(0,100),
       xlab="PCA axis", ylab="Cumulated variance (%)",
       cex=1, pch=20, type="h", lwd=2)
}
add.scatter(myInset(), posi = "bottomright",
            inset = c(-0.03,-0.01), ratio=.28,
            bg=transp("white"))

scatter(dapc1, label.inds = list(air=2, pch=NA)) #shows the label of each individual

scatter(dapc1, scree.da = TRUE, posi.da = "bottomright", bg="white", pch = 20, cstar = 0, col = myCol, solid = .4, cex=3, clab=0, leg=TRUE, posi.leg = "bottomleft", txt.leg = paste("Mid-East", "Far-East", "Mid-Atlantic", "Outgroup")) #I like the look of this graph

scatter(dapc1, xax = 1, yax = 3) #shows PC 1 and PC 3 as the axes

#admixture plot

compoplot(dapc1) #Creates an admixture plot for the dapc data
