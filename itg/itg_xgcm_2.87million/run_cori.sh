#!/bin/bash
#SBATCH -A m499 
#SBATCH --qos=regular
#SBATCH -N 4
#SBATCH -C knl
#SBATCH --time-min=4:00:00 
#SBATCH --time=4:00:00
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=zhangc20@rpi.edu
#SBATCH --job-name=xgcm_N=4_phi=8
#SBATCH -o xgcm_cori.%j.out
#SBATCH -e xgcm_cori.%j.err


export OMP_NUM_THREADS=1

srun -n 256 -c 4 --cpu_bind=cores /global/homes/z/zhangc20/source_code/xgc_scorec/XGC1/XGC1_3fldEMsolver/xgc-es >& xgcm_${SLURM_JOB_ID}.log
