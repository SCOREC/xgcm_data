.SUFFIXES: .o .F90

%.o: %.mod


OBJ_SHARE = elliptics.o lbal_mod.o $(EXTRA_OBJ) psmooth.o bicub_mod.o one_d_cub_mod.o \
        interfaces.o $(MPI_OBJ) interpolation.o read.o bounce.o push.o 
 
OBJ_REMAINING = charge.o diagnosis.o qevaluateandtrapped.o  poisson_extra_xgc1.o \
        gen_perm.o sort_particles.o  pushe.o \
	efield.o   \
        limiter.o diagnosis2.o collision.o collision2.o  \
          heat.o \
	    turbulence.o neutral.o  neutral2.o  neutral3.o linearsolver.o fem2d.o \
	    fem_ops.o poisson_extra_common.o petsc_solve.o 

#OBJ_EM=module-em.o bicub_mod.o one_d_cub_mod.o  search-em.o pol_decomp.o f0module.o em_advance_petsc.o  interfaces-em.o  em_main.o em_hyb.o em_poisson.o charge-em.o diagnosis-em.o poisson_extra_xgc1-em.o collisionf.o setup-em.o 
OBJ_EM=em_main.o em_hyb.o em_poisson.o em_advance_petsc.o 

#OBJ_ES=es_poisson.o  

OBJ_GPU=push_mod_gpu.o cscan.o csort.o cbicub.o 

ifeq ($(XGCORG), 1)
OBJ = module.o pol_decomp.o search.o module_psn.o f0module.o $(OBJ_SHARE)
OBJ += setup.o collisionf.o collisionf2.o  
OBJ_ES += es_main.o
OBJ += load.o

else

# Note that pol_decomp.o should be removed later
OBJ = scorec_util.o scorec_field.o module.scorec.o scorec_mesh_mod.o scorec_xgc_bind.o scorec_solve.o search.scorec.o module_psn.scorec.o f0module.scorec.o efield.scorec.o $(OBJ_SHARE)
OBJ += collisionf.scorec.o collisionf2.o setup.scorec.o charge.scorec.o es_poisson.o 
OBJ += load.scorec.o poisson_extra_common.o
OBJ_ES += es_main.scorec.o
endif



#
# These are added into EXTRA_OBJ & MPI_OBJ in makefiles, funny dependancy
#
IMSL_OBJ=my_imsl.o
PORT_OBJ=bspline90_22.o taus88.o derf.o datanh.o pppack.o fmin.o 
SER_OBJ=mpisingle.o
PAR_OBJ=mpi.o

GPU_SRC =   push_mod_gpu.F90 \
        dimensions_mod_gpu.F90  \
        precision_mod_gpu.F90  \
        sml_module_gpu.F90  \
        eq_module_gpu.F90  \
        itp_module_gpu.F90  \
        one_d_cub_mod_gpu.F90  \
        bicub_mod_gpu.F90  \
        ptl_module_gpu.F90  \
        grid_class_gpu.F90  \
        boundary_class_gpu.F90  \
        psn_class_gpu.F90  \
        diag_module_gpu.F90  \
        bnc_module_gpu.F90  \
        push_update_device_gpu.F90  \
        psi_interpol_gpu.F90  \
        I_interpol_wo_pspline_gpu.F90  \
        I_interpol_gpu.F90  \
        psi_der_all_gpu.F90  \
        field_gpu.F90  \
        b_interpol_gpu.F90  \
        rho_mu_to_ev_pitch2_gpu.F90  \
        remove_particle_gpu.F90  \
        efield_gk_gpu.F90  \
        derivs_sp_gpu.F90  \
        efield_gpu.F90  \
        diag_1d_port1_gpu.F90  \
        derivs_single_gpu.F90  \
        derivs_single_with_e_gpu.F90  \
        push_single_gpu.F90  \
        z_psi_min_gpu.F90  \
        b_interpol_sym_gpu.F90  \
        bounce_gpu.F90  \
        push_kernel_gpu.F90  \
        push_update_host_gpu.F90  \
        guess_gpu.F90 \
        search_tr2_gpu.F90 \
        bvec_interpol_gpu.F90 \
        derivs_gpu.F90 \
        field_following_pos2_gpu.F90 \
        pushe_gpu.F90 \
        pushe_kernel_gpu.F90 \
        t_coeff_gpu.F90 \
        dreorder1d_gpu.F90 \
        dreorder2d_gpu.F90 \
        dreorder_gpu.F90 \
        ireorder1d_gpu.F90 \
        ireorder2d_gpu.F90 \
        ireorder_gpu.F90 \
        lreorder1d_gpu.F90 \
        lreorder2d_gpu.F90 \
        lreorder_gpu.F90 \
        reorder_gpu_mod.F90 \
        sreorder1d_gpu.F90 \
        sreorder2d_gpu.F90 \
        sreorder_gpu.F90 \
        gen_perm_gpu.F90 \
        gen_perm_gpu_mod.F90 \
        gen_perm_gpu_pass1.F90 \
        gen_perm_gpu_pass2.F90 \
        isetval_gpu.F90 \
        isum_col_gpu.F90 \
        iprefix_sum_gpu.F90 \
        setup_lcount_gpu.F90


PSPLINE_DIR=/global/u2/e/eyoon/xgc_scorec_cori/xgc_scorec/XGC1/pspline/LINUX
PSPLINE=-L$(PSPLINE_DIR)/lib -I$(PSPLINE_DIR)/mod -lpspline -lezcdf
PSPLINE_INC=-I$(PSPLINE_DIR)/mod

PERFMOD_DIR=/global/u2/e/eyoon/xgc_scorec_cori/xgc_scorec/XGC1/camtimers
PERFMOD_INC=-L${PERFMOD_DIR} -I${PERFMOD_DIR} -ltimers

#NETCDF_DIR=/usr/local/netcdf/4.3.2
#NETCDF=-I$(NETCDF_DIR)/include \
#           -L$(NETCDF_DIR) -lnetcdf #-lnetcdff_pgi -lnetcdff -lnetcdf

#ADIOS_DIR=/lore/esyoon/openlib/adios-mpich3-gcc-4.9.2
#ADIOS_FLIB= -L${ADIOS_DIR}/lib -ladios -ladiosf -L/lore/esyoon/openlib/mxml-2.9-gcc-4.9.2/lib -lmxml -Wl,-rpath=/lore/esyoon/openlib/mxml-2.9-gcc-4.9.2/lib 
#ADIOS_INC=-I${ADIOS_DIR}/include
ADIOS_INC=$(shell adios_config -f -c)
ADIOS_LIB=$(shell adios_config -f -l)

METIS_DIR=/global/u2/e/eyoon/xgc_scorec_cori/libs/metis-5.1.0
METIS_LIB=-L$(METIS_DIR)/lib -lmetis -Wl,-rpath=$(METIS_DIR)/lib

PUMI_DIR=/global/u2/e/eyoon/xgc_scorec_cori/libs
SCOREC_INC=-I$(PUMI_DIR)/include 
SCOREC_LIB=-L$(PUMI_DIR)/lib  -lpumi -lcrv -lph \
       -lsam -lspr -lma -lapf_zoltan -lparma -lmds -lapf -llion -lmth -lgmi -lpcu -lxgc_scorec_petsc -lmsi \
       -Wl,-rpath="$(PUMI_DIR)/lib"

#PETSC_DIR=/global/project/projectdirs/m499/scorec/dep-lib/petsc-3.8.1
#PETSC_ARCH=
#include ${PETSC_DIR}/lib/petsc/conf/variables

ifeq ($(DEBUG),1)
  OPT_FLAGS= -O0 -no-ipo -traceback -g -C
else
  OPT_FLAGS= -O3 -no-ipo -traceback
endif

FC_FLAGS = -qopenmp  ${OPT_FLAGS}
FC_FLAGS_DEBUG = -qopenmp -O0 -no-ipo -traceback -g -C

XGC_FLAGS = -DSCOREC_ONLY\
		-DPARASOL \
		-DDELTAF_MODE2 \
		-DPROFILE_SEARCH_ADJ \
		-DPSPLINE \
		-DUSE_BICUB_MOD \
		-DUSE_ONE_D_I_CUB_MOD \
		-DCAM_TIMERS \
		-DADIOS \
		-DSOLVERLU \
		-DITER_GRID \
                -DF_USE_MARKER_DEN \
		-DF0_TOR_LINEAR \
		-DF_USE_MARKER_DEN2 \
		-DV_PERP \
		-DRK4_ACCURATE_EFIELD \
		-DOLD_CONVERT_GRID \
		-DXGC1 

# ESY: OLD_CONVERT_GRID is used to avoid matrix setup for converting a field on 2d grid to 1d, which will be implememted later due to time limit

#LIB= ${PSPLINE} ${ADIOS_LIB} ${PERFMOD_INC} $(SCOREC_LIB) $(ZOLTAN_LIB) $(PARMETIS_LIB) ${SCOREC_LIB} ${SCOREC_INC} -fopenmp 
LIB= ${PSPLINE} ${ADIOS_LIB} ${PERFMOD_INC} $(SCOREC_LIB) $(METIS_LIB) ${SCOREC_LIB} ${SCOREC_INC} -fopenmp -lstdc++ 

#OPT=${FFLAGS} ${FC_FLAGS} ${FCPPFLAGS} ${PSPLINE} ${PERFMOD} ${ADIOS_POST_COMPILE_OPTS} $(SCOREC_INC)
#OPT=${FFLAGS} ${FC_FLAGS} ${PSPLINE} ${PERFMOD} ${ADIOS_POST_COMPILE_OPTS} $(SCOREC_INC)

#XGC_INCLUDE = ${PSPLINE_INC} ${PERFMOD_INC} ${PETSC_INCLUDE_OPTS} ${ADIOS_INC} ${SCOREC_INC} -I./
XGC_INCLUDE = ${PSPLINE_INC} ${PERFMOD_INC} ${PETSC_FCPPFLAGS} ${ADIOS_INC} ${SCOREC_INC} -I./

CMP=ftn 
# -C -Mbounds 

ACC_FFLAGS= -Mfree -acc -ta=tesla:cc35,nollvm,ptxinfo,maxrregcount:128 -I. -Minfo=accel -Mnostack_arrays  -UUSE_ASYNC

GPU_FFLAGS= ${XGC_FLAGS} -module . ${ACC_FFLAGS} \
		-Mcuda=7.5,cc35,maxregcount:80,madconst \
		-nofma -mp \
		-Minfo=all  \
		-Mlist \
		-DUSE_ONE_D_I_CUB_MOD=1 \
		-DUSE_BICUB_MOD=1 \
		-DUSE_STATIC=1 \
		-DUSE_GPU=1 \
		-DUSE_TR_CHECK=1 \
		-DUSE_GRID_TEXTURE=1 \
		-DUSE_PSN_TEXTURE=1 \
		-DUSE_C_BICUB=1 \
		-DUSE_THRUST=1 \
		-UORIGINAL \
		-DITER_GRID \
		-UUSE_GPU_ASYNC  \
		-module . 

GPU_LINK_OPT = ${GPU_FFLAGS}

# Set EXTRA_OBJ to $(IMSL_OBJ) for MY_IMSL wrappers, or $(PORT_OBJ) if not using IMSL
EXTRA_OBJ=$(PORT_OBJ)

# Set MPI_OBJ to $(PAR_OBJ) for parallel code, or $(SER_OBJ) for serial code
MPI_OBJ=$(PAR_OBJ)

# include basic makefile build rules
include rules.mk

cscan.o: cscan.cu
	  nvcc -c -arch sm_35 --maxrregcount=80 cscan.cu
csort.o: csort.cu
	  nvcc -c -arch sm_35 --maxrregcount=80 csort.cu
cbicub.o: cbicub.cu
	  nvcc -c -rdc=true -arch sm_35 --maxrregcount=80 cbicub.cu

