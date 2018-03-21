
## Install pytorch on palmetto


### 1. Using conda create command to create a conda environment.

```
$ module add anaconda3/4.2.0
$ module add cuda-toolkit/8.0.44
$ module add cuDNN/8.0v7
$ conda create -n pytorch python=3.5
$ source activate pytorch
```

### 2. Install pytorch from source

```
$export CMAKE_PREFIX_PATH="/home/feid/.conda/envs/pytorch/" # [anaconda root directory]

Install basic dependencies

$ conda install numpy pyyaml mkl mkl-include setuptools cmake cffi typing

Add LAPACK support for the GPU

$ conda install -c pytorch magma-cuda80 # or magma-cuda90 if CUDA 9

$ git clone --recursive https://github.com/pytorch/pytorch

$ cd pytorch

$ python setup.py install
```

### 3. Install torch from source

```
export CXXFLAGS="-std=c++11"
export CFLAGS="-std=c99"

cd /home/feid/.conda/envs/pytorch/
git clone https://github.com/torch/distro.git ./torch --recursive
cd ./torch; bash install-deps;
./install.sh
```

### 4. Install Warp-CTC bindings

Note: CUDA_HOME should be like this: `export CUDA_HOME="/software/cuda-toolkit/8.0.44/"`

```
git clone https://github.com/SeanNaren/warp-ctc.git
cd warp-ctc
mkdir build; cd build
cmake ..
make
cd ../pytorch_binding
python setup.py install
```

### 5. Install pysoundfile

```
conda install cffi numpy
pip install pysoundfile
```
