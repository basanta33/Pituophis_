setwd("D:/SELU/RAdseq/C_venusta") #sets the work directory to external hard drive

library(vcfR)
library(poppr)
library(ape)
library(RColorBrewer)

c_ven_pop_5.VCF <- read.vcfR("c_ven_60_pop_5.vcf") #creates a VCF file on R from the vcf file already created
c_ven_pop_5.VCF #validates the data

pop.data <- read.table("c_ven_pop_3.txt", sep = "\t", header = TRUE) #Loading table with population data
all(colnames(c_ven_pop_5.VCF@gt)[-1] == pop.data$sample) #makes sure all samples are included in both the vcf and pop data

#converting the dataset to a genlight object

gl.c_ven_pop_3 <- vcfR2genlight(c_ven_pop_5.VCF)
ploidy(gl.c_ven_pop_3) <- 2 #specifying the ploidy of the data set
pop(gl.c_ven_pop_3) <- pop.data$location #signify what population data you want to use
gl.c_ven_pop_3

#Population analyses

#PCA

c_ven_3.pca <- glPca(gl.c_ven_pop_3, nf=NULL) #runs a pca on the data

c_ven_3.pca.scores <- as.data.frame(c_ven_3.pca$scores) #converts data frame into new object that contains the scores
c_ven_3.pca.scores$pop <- pop(gl.c_ven_pop_3) #creates a column for the population data (location)

library(ggplot2)
set.seed(9) #This has something to do with random generated and reproducibility
pca_plot_3 <- ggplot(c_ven_3.pca.scores, aes(x=PC1, y=PC2, colour=pop)) #Creates scatter plot of pca
pca_plot_3 <- pca_plot_3 + geom_point(size=2) #Chooses the size for the dots on the PCA
pca_plot_3 #shows the plot itself
pca_plot_3 <- pca_plot_3 + geom_text(aes(label=pop.data$sample),hjust=0,vjust=0) #labels each point with the sample name

#DAPC
#clustering

c_ven_cluster_3 <- find.clusters(gl.c_ven_pop_3, glPca = c_ven_3.pca) #Finds number of clusters for further analysis
# asks for number of PCAs to retain. Choose all of them
#then asks for number of clusters and this is at the lowest point
c_ven_cluster_3$grp #Shows which sample is in each group

#DaPC

c_ven_clu_dapc_3 <- dapc(gl.c_ven_pop_3, c_ven_cluster_3$grp) #Creates a dapc for the data, for number of PCA's to retain go with around 80% explained
c_ven_clu_dapc_3
scatter(c_ven_clu_dapc_3) #Displays the plot of the DAPC
assignplot(c_ven_clu_dapc_3, only.grp = NULL) #shows which sample is in which group in a graphical format
c_ven_dapc_3 <- dapc(gl.c_ven_pop_3, glPca = c_ven_3.pca, n.pca = 70, n.da = 3) #creates a DAPC from the PCA data
scatter(c_ven_dapc_3)

myInset <- function(){
  temp <- c_ven_clu_dapc_3$pca.eig
  temp <- 100* cumsum(temp)/sum(temp)
  plot(temp, col=rep(c("black", "lightgrey"),
                     c(c_ven_clu_dapc_3$n.pca, 1000)), ylim=c(0,100),
       xlab="PCA axis", ylab="Cumulated variance (%)",
       cex=1, pch=20, type="h", lwd=2)
}

add.scatter(myInset(), posi = "bottomright",
            inset = c(-0.03,-0.01), ratio=.28,
            bg=transp("white"))

scatter(c_ven_clu_dapc_3, label.inds = list(air=2, pch=NA)) #shows the label of each individual

scatter(c_ven_clu_dapc_5, scree.da = TRUE, posi.da = "bottomright", bg="white", pch = 20, cstar = 0, col = myCol, solid = .4, cex=3, clab=0, leg=TRUE, posi.leg = "bottomleft", txt.leg = paste("Cluster",1:4)) #I like the look of this graph

scatter(c_ven_clu_dapc_5, xax = 1, yax = 3) #shows PC 1 and PC 3 as the axes

#admixture plot

compoplot(c_ven_clu_dapc_3) #Creates an admixture plot for the dapc data

