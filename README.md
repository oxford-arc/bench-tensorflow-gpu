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

```
sh runbench.sh
```

## Results

Results can be found in the results.txt file (TBD)

```
