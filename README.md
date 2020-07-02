# TensorFlow benchmark
This benchmark uses the Tensorflow 19.12 application (TF 1.15) and the standard tf_cnn_benchmarks data on a single GPU.

## Building the benchmark

- Clone the repository

```
git clone https://github.com/oxford-arc/bench-tensorflow-gpu
```

- Build the container

The container is based upon an NVidia Cloud docker image.

```
cd bench-tensorflow-gpu
sh build.sh
```

- Run the benchmark code

The script `runbench.sh` should be edited and the `GPUCOUNT` variable set to the number of available GPUs in the system. Two runs of the benchmark should be performed, one with the `FP16` variable in this script set to `True` and the second run with it set to `False`. 

```
sh runbench.sh
```

## Results

The following are the results from an ARC 2 GPU system:

```
---------------------------------------------------------------------------
1 GPU(s):FP16=True:Inception v3: total images/sec: 446.40
VGG16: total images/sec: 350.33
ResNet50: total images/sec: 721.17
ResNet152: total images/sec: 296.09

---------------------------------------------------------------------------
---------------------------------------------------------------------------
2 GPU(s):FP16=True:Inception v3: total images/sec: 757.49
VGG16: total images/sec: 263.07
ResNet50: total images/sec: 1163.36
ResNet152: total images/sec: 440.74

---------------------------------------------------------------------------

```
```
---------------------------------------------------------------------------
1 GPU(s):FP16=False:Inception v3: total images/sec: 216.11
VGG16: total images/sec: 223.10
ResNet50: total images/sec: 324.55
ResNet152: total images/sec: 131.31

---------------------------------------------------------------------------
---------------------------------------------------------------------------
2 GPU(s):FP16=False:Inception v3: total images/sec: 396.81
VGG16: total images/sec: 237.69
ResNet50: total images/sec: 622.79
ResNet152: total images/sec: 241.05

---------------------------------------------------------------------------

```
