# Seed for the random number generator (-1 selects a random seed)
seed =  -1

# input and output files
seqfile  = ../P_mel_SNPs_phased_w_outgroup.min4.phy           # sequence file (per-locus alignments)
Imapfile = ../snakes.Imap.txt    # assignments of samples to species
outfile  = out.txt                 # output log file
mcmcfile = mcmc.txt                # file to log mcmc samples

# Selection of analysis type by setting options "speciesdelimitation" and "speciestree"
# A00 - estimation of parameters on fixed phylogeny
# A10 - species delimitation using a guide tree
# A01 - species tree inference
# A11 - joint species tree inference and species delimitation

# enable species delimitation (two available algorithms):
# speciesdelimitation = 0          # species delimitation disabled (default)
# speciesdelimitation = 1 0 2      # species delimitation algorithm 0 finetune (e)
speciesdelimitation = 1 1 2 0.5    # species delimitation algorithm 1 finetune (a m)

# enable species tree inference
speciestree = 1

# specification of: # of species, whitespace-separated list of species
# followed by max number of sequences for each species at a locus,
# and a starting (fixed for A00 and A10) species tree
species&tree = 4  ME FE MA OG
                  7  24 7  5
                  ((ME,FL,MA)OG)


usedata = 1      #  0: do no use data (prior); 1: use sequence data
nloci = 1        # number of data sets (alignments) in seqfile

cleandata = 0    # remove sites with ambiguity data (1:yes, 0:no)?

# species model prior (four potential priors: 0,1,2,3)
# Method A01 (species tree inference) uses speciesmodelprior = 1
# Method A10 (species delimitation with a fixed guide tree) uses either speciesmodelprior=0,1
# Method A11 (joint species delimitation and species tree inference) uses either speciesmodelprior=0,1,2,3
speciesmodelprior = 0         * 0: uniform labeled histories; 1:uniform rooted trees

# theta and gamma priors
thetaprior = 3 0.008        # Inverse-Gamma(a, b) for theta
tauprior   = 3 0.036         # Inverse-Gamma(a, b) for root tau
#thetaprior = gamma 2 1000     # Gamma(a,b) for theta
#tauprior   = gamma 2 1000     # Gamma(a,b) for root tau

# auto-tune step-length parameters during burnin (1: yes, 0: no)
# Potentially, followed by a colon and starting values (otherwise defaults are used)
#finetune = 1
finetune = 1: .012 .003 .0001 .00005 .004 .01 .01 # GBtj, GBspr, theta, tau, mix, locusrate, ...

# binary flags on what to log
print = 1 0 0 0    # MCMC samples, locusrate, heredity scalars, Gene trees

# MCMC chain information
# Total chain length is: burnin + sampfreq*nsample
# First burnin samples are discarded, then we log every sampfreq-th sample
burnin = 2000       # discard first 2000 steps
sampfreq = 10        # log sample every 10TH step (after burnin)
nsample = 100000    # number of samples to log in mcmcfile

# threads
# threads = 2          # threads = threads
threads = 2 1 1        # threads = threads starting_core step
BayesFactorBeta = 0.000244140625
