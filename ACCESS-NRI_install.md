## 🌍 1. Atmospheric Forcing and Initial Conditions

> See also: p.31 in *MHPC_SISSA_ICTP_Thesis_Tilinina.pdf*

The **ACCESS-OM2 1°** configuration starts with the ocean at rest and is forced using **Repeat Year Forcing (RYF)** derived from the **JRA55-do** atmospheric reanalysis dataset [Tsujino et al., 2018].

### 🔁 What is RYF?

Repeat Year Forcing uses data from a single climatological year — in this case, **May 1, 1990 to April 30, 1991** — and loops it indefinitely. This approach provides:

- Temporally homogeneous surface forcing,
- While preserving realistic dynamical variability.

---

### 📁 `config.yaml`

On **Leonardo**, paths and parameters are already configured in `config.yaml`. 

**Ocean at rest initial conditions:**    /leonardo_scratch/fast/ICT25_MHPC/ntilinin/INPUT/access-om2/ocean/  
**JRA55-do dataset:**                    /leonardo_scratch/fast/ICT25_MHPC/ntilinin/INPUT/OMIP/  
**Script for generation RYF:**           /leonardo_scratch/fast/ICT25_MHPC/ntilinin/make_ryf/make_ryf.ipynb  
**RYF atmospheric forcing \
(alread processed JRA55-do datastet):**  /leonardo_scratch/fast/ICT25_MHPC/ntilinin/make_ryf  
**Common config files:**                 /leonardo_scratch/fast/ICT25_MHPC/ntilinin/INPUT/access-om2/  

## 📌 2. User specific spack configuration  

**(!)** Please keep an eye on the upstream original repo of ACCESS-NRI, as the model undergoes constant development **(!)** - https://github.com/ACCESS-NRI/access-om2-configs

ACCESS-NRI spack configuration:

Make you own fork of this repo  
Clone it and make sure you are using branch **release-1deg_jra55_ryf_leonardo**   

```shell
cd ..
mkdir ACCESS-NRI
cd ACCESS-NRI

# I good practice is to create an environment for the experiment, e.g. accessom2 ('spack env create' after spack activation command (. spack-config/spack-enable.bash))

# Clone Spack and configuration repositories
git clone -c feature.manyFiles=true https://github.com/spack/spack.git --branch releases/v0.23 --single-branch --depth=1
git clone https://github.com/ACCESS-NRI/spack-packages.git --branch main
git clone https://github.com/ACCESS-NRI/spack-config.git --branch main

# Link configuration filesв
ln -s -r -v spack-config/v0.23/ci/* spack/etc/spack/

# Enable spack config  
. spack-config/spack-enable.bash
```

## 📌 3. Local Compiler Installation

The following Spack commands initiate a lengthy installation process (can be up to one hour). \
This process will create a complete local environment with all required software installed.

**Note:**

* There is an option to use system-wide software; however, compatibility is not guaranteed in that case.


Install and load the Intel OneAPI compilers (version 2021.2.0):

```bash
spack install intel-oneapi-compilers@2021.2.0 target=x86_64
spack load intel-oneapi-compilers@2021.2.0
spack compiler find
```

## 📌 4. Installation of Components

Now install access-om2 along with its dependencies (netCDF, OpenMPI, etc.) \
All packages will be compiled locally using the selected Intel compilers:

```bash
spack install access-om2 ^netcdf-c@4.7.4 ^netcdf-fortran@4.5.2 ^parallelio@2.5.2 ^openmpi@4.1.4 %intel@2021.2.0 target=x86_64
```

Once installed, available modules will look like:


```bash
[ntilinin@login05 ACCESS-NRI]$ module avail
--------------------------- /leonardo/home/userexternal/ntilinin/access-om2/ACCESS-NRI/release/modules/linux-rhel8-x86_64 ---------------------------
access-om2/latest-66hrt7b  intel-oneapi-compilers/2021.2.0-p7vtyvv
```


## ✅ Usage

Every time you log in to Leonardo, make sure to enable your Spack environment and load the required module: 

```bash
. spack-config/spack-enable.bash
module load access-om2
```

You are now ready to **run the model.**




