#!/bin/bash

# export PYTHONPATH="/h/bparker/vector-nlp-ds/src/:$PYTHONPATH"
# export PYTHONHOME="/h/bparker/venv_xlnet/bin/python3:$PYTHONHOME"
export PYTHONHOME="/h/bparker/venv_xlnet/bin/python3"

# module load python

#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH -c 4      # cores requested
#SBATCH --mem=10  # memory in Mb
#SBATCH -o outfile  # send stdout to outfile
#SBATCH -e errfile  # send stderr to errfile
#SBATCH -t 0:01:00  # time requested in hour:minute:second


python ./models/bert_sum/src/train.py \
    -mode train \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-bert-ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model \
    -lr 2e-3 \
    -visible_gpus 0,1,2  \
    -gpu_ranks 0,1,2 \
    -world_size 3 \
    -report_every 50 \
    -save_checkpoint_steps 1000 \
    -batch_size 3000 \
    -decay_method noam \
    -train_steps 50000 \
    -accum_count 2 \
    -log_file /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/logs/bert_model.log \
    -use_interval true \
    -warmup_steps 10000 \
    -ff_size 2048 \
    -inter_layers 2 \
    -heads 8
