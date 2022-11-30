###############################################
#										      #
#											  #
#			  Pinesnake UCE data			  #	
#				   README					  #
#											  #
###############################################

- Zipped folder - Pituophis_UCE_data contains directory 'mafft-nexus-edge-trim-45-clean'

BACKGROUND:This dataset is from the Eastern Pinesnake complex that is comprised of three 
subspecies
1. P. melanoleucus melanoleucus - Northern Pinesnake
2. P. m. mugitus - Florida Pinesnake
3. P. m. lodingi - Black Pinesnake

Idea was to test the hypothesis that it was comprised of more than species (all subspecies
are distinct lineages) or that it was all one species across a wide range.

Subspecies are designated in the labels as 
1. P.m.mel - Northern Pinesnake
2. P.m.mg - Florida Pinesnake
3. P.m.l - Black Pinesnake

Outgroup labels
P.ruthveni - Louisiana Pinesnake - OUTGROUP
P.catenifer - Gopher/Bullsnake
Pantherophis obsoletus - Ratsnake

Species tree approaches have not been run on this dataset and no explicit species delimitation
hypotheses have been tested so this might be something worthwhile to do.

MATERIALS:
'mafft-nexus-edge-trim-45-clean'

These are all the single alignment nexus files for each individual UCE - there should be
roughly 8,000 of them. 

These have not been filtered for missing data and I know there are some of loci that have 
alot of missing data and contain very little informative sites.


These files were generated using Brant Faircloth's UCE tutorial - 
https://phyluce.readthedocs.io/en/latest/tutorial-one.html

Below is the popmap with all the individuals labeled with their groupings (In vs. out)

~OUTGROUP~
Pantherophis_obsoletusJeffersonLA
P.catenifer_Sioux_NE
P.catenifer_Wheeler_TX
P.ruthveni_Bienville_LA_1
P.ruthveni_Bienville_LA_2

~INGROUP~
P.m.mel._Autauga_AL 
P.m.mel._Humphreys_TN
P.m.mel._Huntingdon_TN
P.m.mel._Winston_AL
P.m.mel._Baker_GA	
P.m.mel._Pierce_GA	
P.m.mel._Scotland_NC
P.m.mel._Turner_GA
P.m.mel._Hoke_NC	
P.m.mel._Richmond_NC
P.m.mel._Rockingham_NC
P.m.mg._Alachua_FL
P.m.mg._Highlands_FL
P.m.mg._Lafayette_FL
P.m.mg._Marion_FL
P.m.mg._Okeechobee_FL_1
P.m.mg._Okeechobee_FL_2
P.m.mg_Hernando_FL
P.m.mel._Burlington_NJ_1
P.m.mel._Burlington_NJ_2
P.m.mel._Ocean_NJ	
P.m.l._Jackson_MS_2	
P.m.l._Jackson_MS_3	
P.m.l._Mobile_AL	
P.m.l._Perry_MS_1	
P.m.l._Perry_MS_2	
P.m.l._Perry_MS_3	
P.m.mel._Covington_AL_1
P.m.mel._Covington_AL_2
P.m.mel._Marion_GA_1
P.m.mel._Marion_GA_2
P.m.mg._Bristol_FL
P.m.mg._Cantonment_FL
P.m.mg._Hamilton_FL
P.m.mg._Liberty_FL
P.m.mg._Okaloosa_FL
P.m.mg._PDLe_FL
P.m.mg._SanRos_FL

There will also be an excel file with all the localities to put this into a geographical perspective.

The main tree based analyses that were done on this data set were concatenated RAxML & MP(TnT) runs for 50%/75% datasets. 

