seed =  -1

seqfile = P_mel_SNPs_phased_w_outgroup.min4.phy
Imapfile = snakes.Imap.txt
outfile = out_GTR.txt
mcmcfile = mcmc_GTR.txt

speciesdelimitation = 0 * fixed species tree
* speciesdelimitation = 1 0 2   * species delimitation rjMCMC algorithm0 and finetune(e)
speciesdelimitation = 1 1 2 1  * species delimitation rjMCMC algorithm1 finetune (a m)
speciestree = 1  0.4 0.2 0.1   * speciestree pSlider ExpandRatio ShrinkRatio

speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

species&tree = 2  One OG
                    38 5
                  (One,OG);
phase =   0  0  0  0

usedata = 1  * 0: no data (prior); 1:seq like
nloci = 1  * number of data sets in seqfile

model = gtr
*Qrates = 1 2 1 1 1 2
*basefreqs = 0 10 10 10 10

cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

thetaprior = 3 0.004   # invgamma(a, b) for theta
tauprior = 3 0.002    # invgamma(a, b) for root tau & Dirichlet(a) for other tau's

*     heredity = 1 4 4
*    locusrate = 1 5

finetune =  1: 5 0.001 0.001  0.001 0.3 0.33 1.0  # finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr

print = 1 0 0 0   * MCMC samples, locusrate, heredityscalars, Genetrees
burnin = 4000
sampfreq = 2
nsample = 100000
