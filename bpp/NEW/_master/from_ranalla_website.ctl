    seed = -1
    seqfile = P_mel_SNPs_phased_w_outgroup.min4.phy
    Imapfile = snakes.Imap.txt
    outfile = out.txt
    mcmcfile = mcmc.txt

    speciesdelimitation = 1 0 2
    speciestree = 1
    species&tree = 4  ME  FE  MA  OG
                      0  0  0  0
                    ((ME, (FE, MA)), OG);
    phase =  0 0 0 0
    cleandata = 0
    usedata = 1
    nloci = 1
    thetaprior = 3  NaN
    tauprior = 3  0.1
    finetune = 1: 0.02 0.02 0.02 0.02 0.02 0.02 0.02
    print = 1 0 0 0
    burnin = 2000
    sampfreq = 2
    nsample = 20000
