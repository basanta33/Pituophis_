* This is a BPP 4.0 control file !!!

          seed = -1

       seqfile = ../P_mel_SNPs_phased_w_outgroup.min4.phy
      Imapfile = ../snakes.Imap.txt
       outfile = out.txt
      mcmcfile = mcmc.txt

  speciesdelimitation = 0     * fixed species tree

speciesmodelprior = 1         * 0: uniform labeled histories; 1:uniform rooted trees; 2:user probs

  species&tree = 3 FE ME OG
                   18 10 5
                  ((ME,FE),OG);

       usedata = 1    * 0: no data (prior); 1:seq like
         nloci = 1   * number of data sets in seqfile

     cleandata = 0      * remove sites with ambiguity data (1:yes, 0:no)?

    thetaprior = 3 0.008   * 2 500    # invgamma(a, b) for theta
      tauprior = 3 0.036   * 4 219 1  # invgamma(a, b) for root tau & Dirichlet(a) for other tau's

      locusrate = 0       # (0: No variation, 1: estimate, 2: from file) & a_Dirichlet (if 1)
       heredity = 0       # (0: No variation, 1: estimate, 2: from file) & a_gamma b_gamma (if 1)

      finetune = 1: .012 .003 .0001 .00005 .004 .01 .01  # auto (0 or 1): finetune for GBtj, GBspr, theta, tau, mix, locusrate, seqerr

         print = 1 0 0 0   * MCMC samples, locusrate, heredityscalars Genetrees
        burnin = 2000
      sampfreq = 10
       nsample = 100000
BayesFactorBeta = 0.019775390625
