# BA Thesis

This repo contains experiment code, the silver standard generator[^2] as well as code for transforming the silver standard into data acceptable for the various experiments conducted / approaches / systems.

## Replicating the evaluation
----

Make sure to have set up a virtual envronment under the name of perin as described in the [README of the PERIN fork](https://github.com/mystreamer/direct_parsing_to_sent_graph/tree/352ba47cfe1404fd8f78d34d42968466be4e53a5).

Then you can navigate into `./annex` and either into datasets (model outputs) or annotations (manual annotation of silver standard samples).

In either folder you can run `./eval.sh` to validate the obtained results of the thesis.

## Replicating the entire setup
---

For replication of the model training and subsequent evaluation you can find the data also in the `./annex/datasets` folder. Each subfolder of `datasets` represents a train-test splitting strategy.

### Structure
Experiments are forked from their original authors (as discussed in the thesis), the forks are accessible as submodules in the `/external_repo` folder. `direct_parsing_to_sent_graph` is the only relevant submodule for replicating the approach in the thesis. The README within that submodule highlights the steps to replicate the PERIN experiemtns of the thesis. <br> <br>
To pull a specific submodule, use: `git submodule update --init external_repo/<submodule_name>`
<br> <br>
To get all submodules execute: `git submodule update --init`[^1]

### Using the ERRE system:

Unlike PERIN; the ERRE system was assembled from tutorials (e.g. [this](https://github.com/sujitpal/ner-re-with-transformers-odsc2022/tree/b713a91ef29956ddb1c31f7d0b5a9c8731c501c5) for the relation extraction part) and hugginface documentation. The instructions how to replicate can be found below:

Place the three dataset splits into the folder `./etl/data/intermediate/TrainTestSplit`.

There are 4 different datasets: `tt_03_va_hard`, `tt_03_va_soft`, `tt_06_va_hard`, `tt_06_va_soft`

**soft** here means that test-train are randomly split. **hard** means that no verb found in training also occurs in test/val.

e.g.,

```
cp ./etl/data/raw/thesis_datasets/tt_06_va_soft/*.csv ./etl/data/intermediate/TrainTestSplit
ls -l ./etl/data/intermediate/TrainTestSplit
```

To run the **ERRE** System, first run the notebook Perin_Preprocessing:

### Entity Recognition Part

```
(cd ./nb_ba/Perin_Preprocessing && papermill --log-output --progress-bar Perin_Preprocessing.ipynb -)
# verify changes
ls -l ./etl/data/processed/Perin_Preprocessing/
```

Then convert the Perin-Formatted data into the data for the ORL (Entity Recognition) System:

```
(cd ./nb_ba/ORLConverter && papermill --log-output --progress-bar ORLConverter.ipynb -)
ls -l ./etl/data/processed/ORLConverter/
```

Then run and train the ORL (Entity Recognition) System (we will run it on rattle, so we must first sync the changes with the server as described in `./etl/data/README.md`):

```
./nb_ba/ORL/OpinionRoleLabeling_NER.ipynb

or

(cd ./nb_ba/ORL && papermill --log-output --progress-bar OpinionRoleLabeling_NER.ipynb -)
```

### Relation Extractor Part

Now we convert the data so it ready for the relation extractor:

```
(cd ./nb_ba/REConverter && papermill --log-output --progress-bar REConverter.ipynb -)
ls -l ./etl/data/processed/REConverter/
```

For training:

```
./nb_ba/RelationClassifier/RelationClassifier.ipynb
```

### Inference

The last part is for the inference:

```
./nb_ba/ORL_RE_Inference/ORL_RE_Inference.ipynb
```

As discussed above, to run the **PERIN** System consult the [README](https://github.com/mystreamer/direct_parsing_to_sent_graph/tree/352ba47cfe1404fd8f78d34d42968466be4e53a5) in the respective fork.


[^1]: Some submodules are not publicly available.
<br>
[^2]: Unfortunately not publicly available.