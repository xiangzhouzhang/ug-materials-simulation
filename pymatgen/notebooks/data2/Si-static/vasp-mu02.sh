#!/bin/sh -f

#PBS -N result
#PBS -l nodes=1:ppn=4
#PBS -l walltime=1200:00:00
#PBS -q batch
#PBS -V


cd $PBS_O_WORKDIR
NP=`cat $PBS_NODEFILE | wc -l`
NN=`cat $PBS_NODEFILE | sort | uniq | tee /tmp/nodes.$$ | wc -l`
cat $PBS_NODEFILE > /tmp/nodefile.$$
mpirun -genv I_MPI_DEVICE ssm -machinefile /tmp/nodefile.$$ -n $NP /home/share/software/vasp5.3.5

rm -rf /tmp/nodefile.$$
rm -rf /tmp/nodes.$$
