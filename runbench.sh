#! /bin/bash
#
#
# These should be configured as per the instructions:

export GPUCOUNT=2
export FP16=True


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

export OUTPUT=/tmp/run.out
export RESULTS=${PWD}/results.txt

echo "Output to $RESULTS."
rm -f $RESULTS
touch $RESULTS

# Ensure we are in benchmark directory:
#
cd $BENCHDIR

echo -n "Running.."
#
for gpu in `seq 1 ${GPUCOUNT}`;
do
        echo -n "."
        echo "---------------------------------------------------------------------------" >> $RESULTS
        echo "$gpu GPU(s):FP16=${FP16}" >> $RESULTS
        echo -n "Inception v3: " >> $RESULTS
        singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus="${gpu}" --batch_size=32 --model=inception3 --use_fp16="${FP16}" --variable_update=parameter_server > $OUTPUT 2>&1
        cat $OUTPUT | grep -i "total images" >> $RESULTS
        echo -n "VGG16: " >> $RESULTS
        singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus="${gpu}" --batch_size=32 --model=vgg16 --use_fp16="${FP16}" --variable_update=parameter_server  > $OUTPUT 2>&1
        cat $OUTPUT | grep -i "total images" >> $RESULTS
        echo -n "ResNet50: " >> $RESULTS
        singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus="${gpu}" --batch_size=32 --model=resnet50 --use_fp16="${FP16}" --variable_update=parameter_server > $OUTPUT 2>&1
        cat $OUTPUT | grep -i "total images" >> $RESULTS
        echo -n "ResNet152: " >> $RESULTS
        singularity exec --nv -B ${PWD}:/host_pwd --pwd /host_pwd $IMAGE python tf_cnn_benchmarks.py --num_gpus="${gpu}" --batch_size=32 --model=resnet152 --use_fp16="${FP16}"  --variable_update=parameter_server > $OUTPUT 2>&1
        cat $OUTPUT | grep -i "total images" >> $RESULTS
        echo >> $RESULTS
        echo "---------------------------------------------------------------------------" >> $RESULTS

done
echo
