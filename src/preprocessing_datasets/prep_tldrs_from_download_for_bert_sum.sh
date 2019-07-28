
python ./models/bert_sum/src/preprocess.py \
    -mode tokenize \
    -raw_path '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/filtered_txt_for_bert_summ_from_reddit_reddit_competition_tldr/' \
    -save_path '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/filtered_txt_for_bert_summ_from_reddit_reddit_competition_tldr-tokenized' \
    -log_file '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/logs/bert_summ_tokenize_step_logs.log'
python ./models/bert_sum/src/preprocess.py \
    -mode format_to_lines \
    -raw_path '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/filtered_txt_for_bert_summ_from_reddit_reddit_competition_tldr-tokenized' \
    -save_path '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/filtered_txt_for_bert_summ_from_reddit_reddit_competition_tldr-jsoned' \
    -map_path '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/urls' \
    -lower true \
    -json_type reddit \
    -log_file '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/logs/bert_summ_format_to_lines_step_logs.log'
python ./models/bert_sum/src/preprocess.py \
    -mode format_to_bert \
    -raw_path  '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/filtered_txt_for_bert_summ_from_reddit_reddit_competition_tldr-jsoned' \
    -save_path '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/filtered_txt_for_bert_summ_from_reddit_reddit_competition_tldr-bert-ready' \
    -oracle_mode greedy \
    -n_cpus 4 \
    -log_file '/scratch/gobi2/bparker/summarization_data/interim/reddit/tldr/reddit_reddit_competition_tldr/logs/bert_summ_format_to_bert_step_logs.log'