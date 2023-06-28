for file in don/*.txt 
do 
	cp $file ./f.txt  
	grep -A1 '(A) List of best models (count postP #species SpeciesTree)' ./f.txt > all.txt
mv $file ./ok 
mv all.txt $file.txt 
done
