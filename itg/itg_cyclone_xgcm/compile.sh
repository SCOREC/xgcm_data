cd /lore/zhangc20/scorec/xgc_scorec/xgc_scorec/build
make clean
make -j8
make install
cd /lore/zhangc20/scorec/xgc_scorec/XGC1/XGC1_3fldEMsolver
#make clean -f Makefile.scorec_rhel7
make -f Makefile.scorec_rhel7
