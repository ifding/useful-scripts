
## Install pytorch on palmetto


### 1. Using conda create command to create a conda environment.

```
$ module add anaconda3/5.1.0
$ module add cuda-toolkit/9.0.176
$ module add cuDNN/9.0v7.3.0
$ conda create -n pytorch python=3.6
$ source activate pytorch
```

If you want to install specific pytorch versions, please follow this [link](https://pytorch.org/get-started/previous-versions/), note that it also needs to add different cuda-toolkit and cuDNN modules to support the pytorch version you installed. For example, install pytorch 1.0.1:

```
pip install torch==1.0.1 torchvision==0.2.2
```

OR

```
conda install pytorch==1.0.1 torchvision==0.2.2 cudatoolkit=9.0 -c pytorch
```

The following steps are for installation from source, if you use the above commands to install, you don't need to run them.

### 2. Install torch from source

```
export CXXFLAGS="-std=c++11"
export CFLAGS="-std=c99"

cd /home/feid/.conda/envs/pytorch/
git clone https://github.com/torch/distro.git ./torch --recursive
cd ./torch; bash install-deps;
./install.sh
```

### 3. Install pytorch from source

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

OR Use conda:

```
$ conda install pytorch torchvision -c pytorch
```


### 4. Install Warp-CTC bindings

Note: CUDA_HOME should be like this: `export CUDA_HOME="/software/cuda-toolkit/8.0.44/"`

Need to activate torch

```
git clone https://github.com/SeanNaren/warp-ctc.git
cd warp-ctc
mkdir build; cd build
cmake ..
make
cd ../pytorch_binding
python setup.py install

. /home/feid/.conda/envs/pytorch/torch/install/bin/torch-activate 
th
```

### 5. Install pysoundfile

```
conda install cffi numpy
pip install pysoundfile
```
