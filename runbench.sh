#! /bin/bash

# ARC Specifics
#
#module purge
#module load /system/arcus/modules/singularity/3.5.3
#
#------------------- END --------------------------

#
# Clean up

rm -rf benchmarks

#
# Obtain benchmarks
#

git clone -b cnn_tf_v1.15_compatible  https://github.com/tensorflow/benchmarks

export IMAGE=$PWD/image/tensorflow-19.12-tf1-py3.sif
export BENCHDIR=$PWD/benchmarks/scripts/tf_cnn_benchmarks

# Ensure we are in benchmark directory:
#
cd $BENCHDIR
#
echo "---------------------------------------------------------------------------"
echo "TAG Inception v3: "
singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=32 --model=inception3 --use_fp16=True --variable_update=parameter_server
echo "TAG VGG16: "
singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=32 --model=vgg16 --use_fp16=True --variable_update=parameter_server
echo "TAG ResNet50: "
singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=32 --model=resnet50 --use_fp16=True --variable_update=parameter_server
echo "TAG ResNet152: "
singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus=1 --batch_size=32 --model=resnet152 --use_fp16=True  --variable_update=parameter_server
echo
echo "---------------------------------------------------------------------------"
