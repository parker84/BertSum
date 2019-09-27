#!/bin/bash

srun --mem=12G -c 2 --gres=gpu:1 -p interactive --pty bash


#-------------competition data
# train from scratch
python3 ./models/bert_sum/src/train.py \
    -mode train \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17 \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
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
# validate
python3 ./models/bert_sum/src/train.py \
    -mode validate \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17 \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
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
    -heads 8 \
    -train_from=/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17/model_step_50000.pt \
    -result_path=/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17/
# train from checkpoint
python3 ./models/bert_sum/src/train.py \
    -mode train \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17 \
    -train_from=/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17/model_step_49000.pt \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
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



#-------------------url posts
# Note: you may need rename your preped data into: 
# bert_ready.test.0.bert.pt  bert_ready.train.0.bert.pt  bert_ready.valid.0.bert.pt
python3 ./models/bert_sum/src/train.py \
    -mode train \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_url_posts/filtered_txt_for_bert_summ_from_url_posts-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/url_posts \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
    -report_every 50 \
    -save_checkpoint_steps 1000 \
    -batch_size 3000 \
    -decay_method noam \
    -train_steps 50000 \
    -accum_count 2 \
    -log_file /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/logs/url_bert_model.log \
    -use_interval true \
    -warmup_steps 10000 \
    -ff_size 2048 \
    -inter_layers 2 \
    -heads 8
python3 ./models/bert_sum/src/train.py \
    -mode validate \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_url_posts/filtered_txt_for_bert_summ_from_url_posts-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/url_posts \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
    -report_every 50 \
    -save_checkpoint_steps 1000 \
    -batch_size 3000 \
    -decay_method noam \
    -train_steps 50000 \
    -accum_count 2 \
    -log_file /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/logs/url_bert_model.log \
    -use_interval true \
    -warmup_steps 10000 \
    -ff_size 2048 \
    -inter_layers 2 \
    -heads 8
# train from checkpoint
python3 ./models/bert_sum/src/train.py \
    -mode train \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_url_posts/filtered_txt_for_bert_summ_from_url_posts-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/url_posts \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
    -report_every 50 \
    -save_checkpoint_steps 1000 \
    -batch_size 3000 \
    -decay_method noam \
    -train_steps 50000 \
    -accum_count 2 \
    -log_file /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/logs/url_bert_model.log \
    -use_interval true \
    -warmup_steps 10000 \
    -ff_size 2048 \
    -inter_layers 2 \
    -heads 8 \
    -train_from=/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/url_posts/model_step_33900.pt



#-------------self posts
# train from scratch
python3 ./models/bert_sum/src/train.py \
    -mode train \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_posts/filtered_txt_for_bert_summ_from_reddit_self_posts-bert-ready/bert_ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/self_posts \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
    -report_every 50 \
    -save_checkpoint_steps 1000 \
    -batch_size 3000 \
    -decay_method noam \
    -train_steps 50000 \
    -accum_count 2 \
    -log_file /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/logs/self_post_bert_model.log \
    -use_interval true \
    -warmup_steps 10000 \
    -ff_size 2048 \
    -inter_layers 2 \
    -heads 8 
# validate
python3 ./models/bert_sum/src/train.py \
    -mode validate \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17 \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
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
    -heads 8 \
    -train_from=/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17/model_step_50000.pt \
    -result_path=/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17/
# train from checkpoint
python3 ./models/bert_sum/src/train.py \
    -mode train \
    -encoder transformer \
    -dropout 0.1 \
    -bert_data_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-bert-ready/bert_ready \
    -model_path /scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17 \
    -train_from=/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/bert_model/corpus-webis-tldr-17/model_step_49000.pt \
    -lr 2e-3 \
    -visible_gpus 0 \
    -world_size 1 \
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