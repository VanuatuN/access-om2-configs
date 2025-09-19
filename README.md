# 1deg_jra55_ryf — adaptation for Leonardo 
This repository contains a customized version of the standard 1-degree global [ACCESS-OM2](https://github.com/ACCESS-NRI/access-om2-configs) model configuration, forced with JRA55-do repeat-year forcing (RYF, covering 1 May 1990 – 30 April 1991).

The original codebase for ACCESS-OM2 was developed by the COSIMA community and is now archived in the [deprecated COSIMA repository](https://github.com/COSIMA/access-om2).

This is a **physics-only** configuration, adapted and ported to the **Leonardo** HPC system.

---

## Repository contents

- **ACCESS-NRI_install.md** — Instructions for ACCESS-OM2 installation on Leonardo.
- **ACCESS-OM2_run.md** — Instructions for running the RYF experiment on Leonardo.
- **ACCESS-OM2_analysis.md** — Instructions for analysis of the output.    
- **MHPC_SISSA_ICTP_Thesis_Tilinina.pdf** — Detailed documentation of the porting process to Leonardo HPC (Master Thesis).

---

## Key information

- For general usage instructions, refer to the [ACCESS-Hive documentation](https://access-hive.org.au/models/run-a-model/run-access-om/).
- Simulation duration and timestep are controlled in `accessom2.nml`.

  The default timestep is **5400 seconds**. This configuration is typically stable from the start, but a shorter timestep may be required during the early years of model spin-up if modifications are introduced.

---

## Conditions of use

The COSIMA consortium kindly requests that users of this or other ACCESS-OM2 configurations:

1. **Cite** the following publication:  
   *Kiss et al. (2020),* [https://doi.org/10.5194/gmd-13-401-2020](https://doi.org/10.5194/gmd-13-401-2020)

2. **Include** the following acknowledgement in any publications:  
   > *The authors thank the Consortium for Ocean-Sea Ice Modelling in Australia (COSIMA; [http://www.cosima.org.au](http://www.cosima.org.au)) for making the ACCESS-OM2 suite of models available at [https://github.com/COSIMA/access-om2](https://github.com/COSIMA/access-om2).*

3. **Notify** COSIMA of any publications that use these models or data, so they can be listed on their [Google Scholar page](https://scholar.google.com/citations?hl=en&user=inVqu_4AAAAJ).

---
