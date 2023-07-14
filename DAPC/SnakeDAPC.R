library("adegenet")
dapc<-fasta2DNAbin("snk.fa")
obj <- DNAbin2genind(dapc, polyThres=0.1)
### find number of clusters for DAPC
grp<-find.clusters(obj,max.n.clust=40)
dapc1 <- dapc(obj, grp$grp)
myCol = c("red", "yellow", "blue", "green", "purple", "black", "orange", "darkgreen")
scatter(dapc1, scree.da=FALSE, bg="white", pch=20, cell=0, cstar=0, col=myCol,solid=.4, cex=3,clab=0, leg=TRUE)


#plot beautification
#colors vector
myCol = c("red", "yellow", "black", "green", "purple", "blue", "orange", "darkgreen")


par(mar = c(4.1, 4.9, 4.1, 1.9)) #adjust margins of the plot

scatter(
  dapc1,
  scree.da = TRUE,
  posi.da = "topleft",
  ratio.da = .25,
  bg = "white",
  pch = 20,
  cstar = 0,
  col = myCol,
  scree.pca = TRUE,
  solid = .5,
  cex = 3,
  clab = 0,
  leg = TRUE,
  posi.leg = "bottomright",
  txt.leg = paste(c(
    "A", "B", "C", "D", "E", "F", "G", "H"))) 

myInset <- function() {
  temp <- dapc1$pca.eig
  temp <- 100 * cumsum(temp) / sum(temp)
  plot(
    temp,
    col = rep(c("black", "lightgrey"),
              c(dapc1$n.pca, 1000)),
    xlim = c(0, 50),
    ylim = c(0, 100),
    xlab = "PCA axis",
    ylab = "Cumulated variance (%)",
    cex = 1,
    pch = 20,
    type = "h",
    lwd = 2
  )
}
add.scatter(
  myInset(),
  posi = "bottomright",
  inset = c(-0.02, -0.08),
  ratio = .15,
  bg = transp("white")
)

#scatter(dapc1, label.inds = list(air=2, pch=NA)) #shows the label of each individual
#scatter(dapc1, scree.da=FALSE, bg="white", pch=20, cell=0, cstar=0, col=myCol,solid=.4, cex=3,clab=0, leg=TRUE)
#scatter(dapc1, xax = 1, yax = 3) #shows PC 1 and PC 3 as the axes
#admixture plot
compoplot(dapc1) #Creates an admixture plot for the dapc data

