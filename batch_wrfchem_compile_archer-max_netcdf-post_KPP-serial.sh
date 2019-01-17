#!/bin/bash --login

#PBS -l select=serial=true:ncpus=2
#PBS -l walltime=12:00:00
#PBS -A n02-weat
#PBS -N wrf-compile

cd ${PBS_O_WORKDIR}

module swap PrgEnv-cray PrgEnv-intel
module load netcdf-nc-max-vars
module load cray-hdf5
export NETCDF=$NETCDF_DIR
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export WRF_CHEM=1
export WRF_KPP=1
export FLEX_LIB_DIR=/usr/lib64
./compile.post_kpp -j 2 em_real 2>&1 | tee z_wrf_compile_log.txt 
