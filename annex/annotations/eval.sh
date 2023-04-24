# This shell scripts evaluates the results of the datasets

mkdir evaluation

# download necessary scripts from the paper fork
(cd evaluation && \
wget https://raw.githubusercontent.com/mystreamer/direct_parsing_to_sent_graph/80d6a6309ea0765cade02e01611780dcd4659cbb/evaluation/evaluate.py && \
wget https://raw.githubusercontent.com/mystreamer/direct_parsing_to_sent_graph/80d6a6309ea0765cade02e01611780dcd4659cbb/evaluation/evaluate_single_dataset.py
)

echo "--- Evaluating the manual annotation, with the sampled silver standard data ---"
(source ~/envs/perin-venv/bin/activate && \
cd evaluation && \
python evaluate_single_dataset.py --relaxed \
../manual_annotation.json \
../manual_annotation_ssa_annotated.json) # the manually annotated data (gold standard)

# above relaxed because we do not care about verb performance

rm -rf evaluation