# TensorFlow benchmark
This benchmark uses the Tensorflow 19.12 application and the standard tf_cnn_benchmarks data on a single GPU.

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

The file <runbench.sh> should be edited and the <GPUCOUNT> variable set to the number of available GPUs in the system. Two runs of the benchmark should be performed, one with the <FP16> variable in this file set to <True> and the second set to <False>. 

```
sh runbench.sh
```

## Results

(TBD)

