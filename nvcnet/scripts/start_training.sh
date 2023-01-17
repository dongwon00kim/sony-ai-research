#!/bin/bash

mpirun --allow-run-as-root -n 1 \
       python main.py -c cudnn -d 0 \
       --output_path log/baseline/ \
       --batch_size 24 \
       --save_data_dir /workspace/data/ 
