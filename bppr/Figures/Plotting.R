setwd("C:/Users/basan/Projects/Pituophis_/bppr/Two_Pop")
Two_Pop <- bppr::stepping.stones()
Two_Pop
plot(Two_Pop$mean.logl ~ Two_Pop$b, pch=19, ty="b", main = "Two Population Model" , xlab="Stepping Stone", ylab="Mean Log-Likelihood")
text(0.3, -650000, "Log-Marginal Likelihood = -347398.8")

setwd("C:/Users/basan/Projects/Pituophis_/bppr/Three_Pop")
Three_Pop <- bppr::stepping.stones()
Three_Pop
plot(Three_Pop$mean.logl ~ Three_Pop$b, pch=19, ty="b", main = "Three Population Model" , xlab="Stepping Stone", ylab="Mean Log-Likelihood")
text(0.3, -600000,"Log-Marginal Likelihood = -347369.3")

setwd("C:/Users/basan/Projects/Pituophis_/bppr/Four_Pop")
Four_Pop <- bppr::stepping.stones()
Four_Pop
plot(Four_Pop$mean.logl ~ Four_Pop$b, pch=19, ty="b", main = "Four Population Model" , xlab="Stepping Stone", ylab="Mean Log-Likelihood")
text(0.3, -600000,"Log-Marginal Likelihood = -347392.7")

setwd("C:/Users/basan/Projects/Pituophis_/bppr/Four_DAPC")
FD <- bppr::stepping.stones()
FD
plot(FD$mean.logl ~ FD$b, pch=19, ty="b", main = "Four Population Model (DAPC)" , xlab="Stepping Stone", ylab="Mean Log-Likelihood")
text(0.3, -600000,"Log-Marginal Likelihood = -347435.9")

setwd("C:/Users/basan/Projects/Pituophis_/bppr/Seven_POP")
SP <- bppr::stepping.stones()
SP
plot(SP$mean.logl ~ SP$b, pch=19, ty="b", main = "Seven Population Model" , xlab="Stepping Stone", ylab="Mean Log-Likelihood")
text(0.3, -550000,"Log-Marginal Likelihood = -347435.6")
