
# python ./models/bert_sum/src/preprocess.py \
#     -mode tokenize \
#     -raw_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-raw' \
#     -save_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-tokenized' \
#     -map_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/urls' \
#     -log_file '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/logs/bert_summ_tokenize_step_logs.log'
python ./models/bert_sum/src/preprocess.py \
    -mode format_to_lines \
    -raw_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-tokenized' \
    -save_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-jsoned' \
    -map_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/urls' \
    -lower true \
    -json_type reddit \
    -log_file '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/logs/bert_summ_format_to_lines_step_logs.log'
python ./models/bert_sum/src/preprocess.py \
    -mode format_to_bert \
    -raw_path  '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-jsoned' \
    -save_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/corpus-webis-tldr-17-bert-ready' \
    -oracle_mode greedy \
    -map_path '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/urls' \
    -n_cpus 4 \
    -log_file '/scratch/gobi1/bparker/summarization_data/interim/reddit/tldr/corpus-webis-tldr-17/logs/bert_summ_format_to_bert_step_logs.log'