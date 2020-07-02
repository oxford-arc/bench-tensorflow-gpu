#! /bin/bash
#
#
# $SCRATCH is defined as ARC's scratch filesystem, this will need
# to be defined for other systems.
#
export SCRATCH=/tmp

export SINGULARITY_CACHEDIR=$(mktemp -d $SCRATCH/cache.XXXXX)
export SINGULARITY_TMPDIR=$(mktemp -d $SCRATCH/target.XXXXX)

export DOCKERFILE=docker://nvcr.io/nvidia/tensorflow:19.12-tf1-py3
export TARGET=tensorflow-19.12-tf1-py3.sif

#
# ARC Specifics
#
# module load /system/arcus/modules/singularity/3.5.3
#
# ----------------- END ---------------------------

singularity pull image/$TARGET $DOCKERFILE

rm -rf $SINGULARITY_CACHEDIR $SINGULARITY_TMPDIR
