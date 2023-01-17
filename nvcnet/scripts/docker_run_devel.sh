#!/bin/bash

#GPU="--gpus all"
GPU="--gpus \"device=3\""

DATASET="/mnt/hdd/Datasets/VCTK - Voice Cloning Toolkit/nvcnet_datasets/"

docker run -d ${GPU} \
	--name nvcnet-devel \
       -e TZ=Asia/Seoul \
        --mount type=bind,source="${PWD}",target='/workspace/nvcnet' \
	--mount type=bind,source="${DATASET}",target='/workspace/data' \
	nvcnet:latest \
	sleep infinity

