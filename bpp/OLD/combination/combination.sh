for f in data/*.phylip
do
	cp $f ./data.phylip
	for g in run1/*.mcmc.txt  
	do
		cp $g ./r1.mcmc.txt 
		for h in run2/*.mcmc.txt 
		do 
			cp $h ./r2.mcmc.txt
			tail -n +2 r2.mcmc.txt >> r1.mcmc.txt 
      			~/mybpp/bpp --cfile snakes.bpp.A11.ctl || break  
			mv data_combined.txt ./combined_output/$f.combined.txt
		 	mv r1.mcmc.txt ./combined_output/$f.combined.mcmc.txt
			mv $f ./completed/data
			mv $g ./completed/run1
			mv $h ./completed/run2
		done
	done
done
