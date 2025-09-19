## 🚀 ACCESS-OM2 Environment Setup & Running Guide

This guide explains how to activate the environment, install the `payu` workflow manager, and run the ACCESS-OM2 model. All commands are intended for use in a Linux shell.

---

### 1️⃣ Activate Environment and Load *access-om2* Module

```bash
. spack-config/spack-enable.bash
module load access-om2/
```

### 2️⃣ Install **payu** Manager

[Payu](https://payu.readthedocs.io/en/latest/) is a workflow management tool for running ACCESS family models in supercomputing environments. Additional resources:

* 📖 [Payu Documentation](https://payu.readthedocs.io/en/latest/)
* 💬 [ACCESS-OM2 Payu Tutorial](https://forum.access-hive.org.au/t/access-om2-payu-tutorial/1750)

Originally, Payu was designed to work with the PBS scheduler in the ACCESS-NRI environment. The following repository contains a modified version that supports the SLURM scheduler on the Leonardo supercomputer:

```bash
git clone --branch leonardo --single-branch git@github.com:VanuatuN/payu.git
cd payu
pip install . --user
```

Now, Payu is installed in your home directory. Don’t forget to **export the path** so it can be accessed globally:

```bash
export PATH=$PATH:$HOME/.local/bin
```


### 3️⃣ Run the Model

* Clone this repository:

```bash
git clone --branch leonardo --single-branch git@github.com:VanuatuN/payu.git
```

* Prepare your `config.yaml` file with the desired configuration and version.

* Use `payu` to launch your experiment.

Example:

```bash
payu run
```

To relaunch experiment:

```bash
payu sweep
payu run
```

Please, look up for the extensive documentation and instuctions for Payu above (2️⃣). 

---

### ⚙️ Example `config.yaml` Explanation

The `config.yaml` file controls how `payu` submits jobs, configures resources, loads modules, and runs submodels. Below is a breakdown of its key sections:

#### 🔹 Scheduler and Job Settings

```yaml
scheduler: slurm
walltime: 03:00:00
jobname: 1deg_jra55_ryf_bench_cice5
mem: 200G
account: ICT25_MHPC
partition: dcgp_usr_prod
ncpus: 672
nnodes: 6
```

* **scheduler**: Job scheduler (here, SLURM).
* **walltime**: Maximum runtime per job.
* **jobname**: Name shown in the queue.
* **mem**: Total memory requested.
* **account/partition**: HPC project and queue/partition.
* **ncpus/nnodes**: Number of CPUs and nodes requested.

#### 🔹 Modules

```yaml
modules:
  use:
    - /path/to/modulefiles
  load:
    - access-om2
```

* **use**: Path to custom modulefiles.
* **load**: List of required modules (can include compilers, MPI, NetCDF, etc.).

#### 🔹 Model Configuration

```yaml
name: common
model: access-om2
input:
  - /path/to/input/files
```

* **name**: Identifier for the configuration.
* **model**: Top-level model type (`access-om2`).
* **input**: Paths to required input datasets.

#### 🔹 Submodels

Each submodel (atmosphere, ocean, ice) is defined separately:

```yaml
submodels:
  - name: atmosphere
    model: yatm
    exe: /path/to/yatm.exe
    ncpus: 1
    nnodes: 1
```

* **name**: Submodel identifier.
* **model**: Model type (`yatm`, `mom`, `cice5`).
* **exe**: Path to the model executable.
* **input**: Paths to input files specific to this submodel.
* **resources**: CPUs, nodes, partition, memory.

#### 🔹 Collation

```yaml
collate:
  restart: True
  walltime: 01:00:00
  mem: 30G
  ncpus: 4
  exe: /path/to/mppnccombine.spack
```

* Handles **post-processing**, e.g., combining model output files.

#### 🔹 Sync

```yaml
sync:
  enable: False
  path: /path/to/storage
  restarts: True
```

* Controls automatic copying of data from **scratch space** to long-term storage.

#### 🔹 Miscellaneous Settings

```yaml
restart_freq: 5YS
experiment: 1deg_jra55_ryf_5yr
mpi:
  runcmd: srun
```

* **restart\_freq**: Frequency of restart files.
* **experiment**: Experiment name.
* **mpi**: MPI launcher settings (here, `srun`).

#### 🔹 Platform

```yaml
platform:
  nodesize: 112
```

* Defines number of cores per node on the target machine.

#### 🔹 User Scripts

```yaml
userscripts:
  error: tools/resub.sh
  run: rm -f resubmit.count
```

* Custom scripts executed on specific events (e.g., errors, run start, syncing).

---

✅ With this configuration, you can fully customize how `payu` runs ACCESS-OM2 on SLURM-based HPC systems like Leonardo.
