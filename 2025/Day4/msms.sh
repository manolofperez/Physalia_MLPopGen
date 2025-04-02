

DIRMSMS=/home/matteo/Software/msms/msms/lib/msms.jar

## standard parameters

# effective population size (reference, everything is scaled according to this value)
NREF=10000

# number of chromosomal copies to simulate
NCHROMS=20

# number of replicates (nr of simulations)
NREPL=1

# mutation and recombination rate
THETA=4.8
RHO=3.2
LEN=8000

## demographic parameters

# model
DEMO='-eN 0.0875 1 -eN 0.075 0.2 -eN 0 2'

## selection parameters

# position of the selected variant [0-1]
SELPOS=`bc <<< 'scale=1; 1/2'`

# time of selection start in 4*Ne generations ago
TIME=`bc <<< 'scale=4; 10000/25/40000'` # eg 10kya

# initial allele frequency of selected variant
FREQ=`bc <<< 'scale=2; 1/100'`

# selection coefficient (allelic, assuming additive selection), in 2*Ne units
SEL=100

java -jar $DIRMSMS -N $NREF -ms $NCHROMS $NREPL -t $THETA -r $RHO $LEN -Sp $SELPOS -SI $TIME 1 $FREQ -SAA $(($SEL*2)) -SAa $SEL -Saa 0 $DEMO -threads 2


# test also for balancing selection?

# java -jar $DIRMSMS -N $NREF -ms $NCHROMS $NREPL -t $THETA -r $RHO $LEN -Sp $SELPOS -SI $TIME 1 $FREQ -SAa $(($SEL*2)) -SAA $SEL -Saa $SEL $DEMO -threads 2






