#!/bin/bash
#SBATCH --partition=p_fast
#SBATCH --job-name=8ge_co
#SBATCH --cpus-per-task=192
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=24:00:00
#SBATCH --mem=300Gb
#SBATCH --output=8ge_co.out
#SBATCH --err=8ge_co.err
#SBATCH --constraint=amd192
 
                                                

# required input files for the software execution, separated by a space
files="GCF 8ge_co.inp Pt7GeCO-DEF2TZVPP.bas  Pt7GeCO-DEF2TZVPP-jkfit.bas"

## Do not change below this line

. /home/users/slurm/etc/slurm_func.sh

my_cleanup_function() {

    #  Recover execution output
    recover

    #  Remove the job run info file (if it exists)
    if [ -n "$job_run_info_file" ] && [ -f "$job_run_info_file" ]; then
        untag
    fi

    #  Add your cleanup actions here
    cd $LDIR
    jobid=$(basename "$scr")
    mv arina.${jobid}/* .
    rm -r arina.${jobid}
    rm -r $scr

    [ -f WFN ] && mv -f WFN 8ge_co.wfn

    [ -f FCHK ] && mv -f FCHK 8ge_co.fchk
    
    if [ -f MLD ]; then
     cp -f MLD 8ge_co.mld
     if [ -f XYZ ]; then
      cat MLD XYZ > 8ge_co.mld
      rm -f XYZ
     fi
     rm -f MLD
    fi
    
    [ -f APSG ] && mv -f APSG 8ge_co.pun
    
    [ -f 1DM ] && mv -f 1DM 8ge_co.1dm
    
    [ -f fort.14 ] && mv -f fort.14 8ge_co.1dm
    
    [ -f 2DM ] && mv -f 2DM 8ge_co.2dm
    
    [ -f fort.15 ] && mv -f fort.15 8ge_co.2dm
    
    [ -f N2DM ] && mv -f N2DM 8ge_co.n2dm
    
    [ -f CJK ] && mv -f CJK 8ge_co.cjk
    
    [ -f CND ] && mv -f CND 8ge_co.cnd
    
    [ -f Tijab ] && mv -f Tijab 8ge_co.2mp
    
    [ -f FRAG ] && mv -f FRAG 8ge_co.fra
    
    if [ -f GCFe ]; then
     mv -f GCFe 8ge_co.gcf
     rm -f GCF
    elif [ -f GCF ]; then
     mv -f GCF 8ge_co.gcf
    fi
    
    [ -f CGGRAD ] && mv -f CGGRAD 8ge_co.cgo
    
    [ -f CGM ] && rm -f CGM
    
    [ -f BFST ] && rm -f BFST
    
    [ -f fort.1 ] && rm -f fort.1


}


# Signal trap to recover files
trap 'my_cleanup_function' EXIT

HOST=$(hostname)
echo Job runing on $HOST

chooseScr

LDIR=$(pwd)
export LDIR

echo 8ge_co
[ -f 8ge_co.gcf ] && mv -f 8ge_co.gcf GCF
[ -f 8ge_co.fra ] && mv -f 8ge_co.fra FRAG

echo "cp ${files} to  $scr/."
cp  ${files} ${scr}/.

cd $scr

# CALL EXECUTABLE with SRUN
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_STACKSIZE="100MB"

/home/pobleyef/DoNOFsw/exe/DoNOFompg.x < 8ge_co.inp


