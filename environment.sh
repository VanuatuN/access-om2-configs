# #!/bin/bash

# # Source Spack environment (this sets up Spack environment and module commands)
# #source /leonardo_scratch/large/userexternal/ntilinin/ACCESS-NRI/spack-config/spack-enable.bash
# #source /leonardo_scratch/large/userexternal/ntilinin/ACCESS-NRI/spack/share/spack/setup-env.sh
# export PATH=$PATH:$HOME/.local/bin
# module load python 
# unset MODULESHOME
# unset MODULE_VERSION


# source ~/ACCESS-NRI/spack-config/spack-enable.bash
# module use /leonardo/home/userexternal/ntilinin/ACCESS-NRI/release/modules/linux-rhel8-x86_64
# export LD_LIBRARY_PATH=/leonardo/home/userexternal/ntilinin/ACCESS-NRI/release/linux-rhel8-x86_64/intel-2021.2.0/openmpi-4.1.4-ga6avsdxmjya35twagfjts7jp3yahbwt/lib:$LD_LIBRARY_PATH
# export OMPI_MCA_btl_tcp_if_include=ib0
# export MCA_IO=ompio
# export MCA_IO_OMPIO_NUM_AGGREGATORS=1
# export PAYU_N_RUNS=5
# # Load the desired module
# #module load access-om2

# # Set library path, this assumes you need to prepend paths to LD_LIBRARY_PATH
# #export LD_LIBRARY_PATH=/leonardo_scratch/large/userexternal/ntilinin/ACCESS-NRI/release/linux-rhel8-x86_64/intel-2021.2.0/netcdf-fortran-4.5.2-g6pudzj3xc5fglqwz2xkxrr27rflwto3/lib:/leonardo_scratch/large/userexternal/ntilinin/ACCESS-NRI/release/linux-rhel8-x86_64/intel-2021.2.0/netcdf-c-4.7.4-e3iql33rckkknykdazbv4yu6ht5kxya4/lib:$LD_LIBRARY_PATH

# # Add custom local binaries to PATH (this ensures your `.local/bin` is included)
# #export PATH=$PATH:$HOME/.local/bin

# # Set MODULESHOME if not already set (assuming Spack modules system)
# #export MODULESHOME=/leonardo_scratch/large/userexternal/ntilinin/ACCESS-NRI/release/linux-rhel8-x86_64/intel-2021.2.0

# # Set MODULEPATH for module command to look for modules
# #export MODULEPATH=/leonardo_scratch/large/userexternal/ntilinin/ACCESS-NRI/release/linux-rhel8-x86_64/intel-2021.2.0

# # # Dynamically locate `modulecmd`
# # function locate_modulecmd {
# #     # Check for TCL-based module system
# #     modulecmd_path=""
# #     if [ -x /usr/bin/modulecmd ]; then
# #         modulecmd_path="/usr/bin/modulecmd"
# #     elif [ -x /usr/share/lmod/lmod/libexec/modulecmd ]; then
# #         modulecmd_path="/usr/share/lmod/lmod/libexec/modulecmd"
# #     fi
    
# #     if [ -z "$modulecmd_path" ]; then
# #         echo "modulecmd not found on this system."
# #         exit 1
# #     fi
    
# #     echo "$modulecmd_path"
# # }

# # # Get the path to modulecmd and print it
# # modulecmd=$(locate_modulecmd)
# # echo "modulecmd: $modulecmd"

# # # Confirm that everything is set up correctly
# # #echo "Environment setup complete."
# # #echo "MODULESHOME: $MODULESHOME"
# # #echo "MODULEPATH: $MODULEPATH"
# # #echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
# # #echo "PATH: $PATH"
