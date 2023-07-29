seed =  -1

seqfile = all.phylip
Imapfile = snakes.phylo.Imap.txt
outfile = out_GTR_phylo_bppr.txt
mcmcfile = mcmc_GTR_phylo_bppr.txt

speciesdelimitation = 0 * fixed species tree
* speciesdelimitation = 1 0 2   * species delimitation rjMCMC algorithm0 and finetune(e)
* speciesdelimitation = 1 1 2 1  * species delimitation rjMCMC algorithm1 finetune (a m)
* speciestree = 1  0.4 0.2 0.1   * speciestree pSlider ExpandRatio ShrinkRatio

speciesmodelprior = 1  * 0: uniform LH; 1:uniform rooted trees; 2: uniformSLH; 3: uniformSRooted

species&tree = 8  A B C D E F G OG
                  4 3 6 10 4 6 7 5
                (((((G, F), C), E), (D, (A, B))), OG);
* phase =   0  0  0  0

usedata = 1  * 0: no data (prior); 1:seq like
nloci = 4600 * number of data sets in seqfile

*model = gtr
*Qrates = 1 2 1 1 1 2
*basefreqs = 0 10 10 10 10

cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

thetaprior = 3 0.008   # invgamma(a, b) for theta
tauprior = 3 0.036    # invgamma(a, b) for root tau & Dirichlet(a) for other tau's

heredity = 0
locusrate = 0

finetune =  1: .012 .003 .0001 .00005 .004 .01 .01  # auto (0 or 1): finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr

print = 1 0 0 0   * MCMC samples, locusrate, heredityscalars, Genetrees
burnin = 2000
sampfreq = 2
nsample = 20000
