library("adegenet")
dapc<-fasta2DNAbin("snk.fa")
obj <- DNAbin2genind(dapc, polyThres=0.1)
### find number of clusters for DAPC
grp<-find.clusters(obj,max.n.clust=40)
dapc1 <- dapc(obj, grp$grp)
myCol = c("red", "yellow", "blue", "green")
scatter(dapc1, scree.da=FALSE, bg="white", pch=20, cell=0, cstar=0, col=myCol,solid=.4, cex=3,clab=0, leg=TRUE)
