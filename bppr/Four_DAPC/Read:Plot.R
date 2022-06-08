
FD <- stepping.stones()

FD

plot(FD$mean.logl ~ FD$b, pch=19, ty="b", main="Four Population (DAPC Clusters)", xlab="Stepping Stones", ylab="Mean Log-Likelihood")
text(0.3, -600000, "Log-Marginal Likelihod: -347435.5")
