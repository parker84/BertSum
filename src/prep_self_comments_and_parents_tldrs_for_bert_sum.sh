
python ./models/bert_sum/src/preprocess.py \
    -mode tokenize \
    -raw_path '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/' \
    -save_path '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents-tokenized' \
    -log_file '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/logs/bert_summ_tokenize_step_logs.log'
python ./models/bert_sum/src/preprocess.py \
    -mode format_to_lines \
    -raw_path '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents-tokenized' \
    -save_path '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents-jsoned' \
    -map_path '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/urls' \
    -lower true \
    -log_file '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/logs/bert_summ_format_to_lines_step_logs.log'
python ./models/bert_sum/src/preprocess.py \
    -mode format_to_bert \
    -raw_path  '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents-jsoned' \
    -save_path '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents-bert-ready' \
    -oracle_mode greedy \
    -n_cpus 4 \
    -log_file '/scratch/gobi2/bparker/summarization_data/processed/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_self_comments_and_parents/logs/bert_summ_format_to_bert_step_logs.log'