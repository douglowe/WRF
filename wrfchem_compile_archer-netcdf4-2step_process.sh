
module swap PrgEnv-cray PrgEnv-intel
module load cray-netcdf
module load cray-hdf5
export NETCDF=$NETCDF_DIR
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
export WRF_CHEM=1
export WRF_KPP=1
export NETCDF4=1
export FLEX_LIB_DIR=/usr/lib64
# step 1 - generate KPP chemistry code on login node
chem/KPP/compile_wkc 2>&1 | tee z_chem_kpp_precompile_log.txt
# step 2 - compile model on serial node
qsub batch_wrfchem_compile_archer-netcdf4-post_KPP-serial.sh
