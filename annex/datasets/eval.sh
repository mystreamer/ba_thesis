# This shell scripts evaluates the results of the datasets

mkdir evaluation

# download necessary scripts from the paper fork
(cd evaluation && \
wget https://raw.githubusercontent.com/mystreamer/direct_parsing_to_sent_graph/80d6a6309ea0765cade02e01611780dcd4659cbb/evaluation/evaluate.py && \
wget https://raw.githubusercontent.com/mystreamer/direct_parsing_to_sent_graph/80d6a6309ea0765cade02e01611780dcd4659cbb/evaluation/evaluate_single_dataset.py
# cp ../../../external_repos/direct_parsing_to_sent_graph/evaluation/evaluate_single_dataset.py .
)

for folder in tt_03_va_hard tt_03_va_soft tt_06_va_hard tt_06_va_soft; do
    echo "******** EVALUATING $folder ********"
    # evaluate the results of the test set
    echo "--- Test-set results of the ERRE model ---"
    (source ~/envs/perin-venv/bin/activate && \
    cd evaluation && \
    python evaluate_single_dataset.py \
    ../$folder/results/01_test.json \
    ../$folder/results/test/erre/01_test_prediction.json)

    echo "--- Test-set results of the PERIN model ---"
    (source ~/envs/perin-venv/bin/activate && \
    cd evaluation && \
    python evaluate_single_dataset.py \
    ../$folder/results/01_test.json \
    ../$folder/results/test/perin/01_test_prediction.json)

    # evaluate the result of the gold standard
    echo "--- Gold standard results of the ERRE model ---"
    (source ~/envs/perin-venv/bin/activate && \
    cd evaluation && \
    python evaluate_single_dataset.py --relaxed \
    ../gs.json \
    ../$folder/results/gs/erre/gs_prediction.json)

    echo "--- Gold standard results of the PERIN model ---"
    (source ~/envs/perin-venv/bin/activate && \
    cd evaluation && \
    python evaluate_single_dataset.py --relaxed \
    ../gs.json \
    ../$folder/results/gs/perin/gs_prediction.json)

done

rm -rf evaluation