# BA Thesis

This repo contains experiment code, the silver-standard generator as well as code for transforming the silver standard into data acceptable for the various experiments conducted.

### Structure
Experiments are forked from their original authors (as discussed in the thesis), the forks are accessible as submodules in the `/external_repo` folder. <br> <br>
To pull a specific submodule, use: `git submodule update --init external_repo/<submodule_name>`
<br> <br>
To get all submodules execute: `git submodule update --init`[^1]

Using the systems:
-----
Place the three dataset splits into the folder `./etl/data/intermediate/TrainTestSplit`.

There are 4 different datasets: `tt_03_va_hard`, `tt_03_va_soft`, `tt_06_va_hard`, `tt_06_va_soft`

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

To run the **PERIN** System consult the README in the respective fork.


[^1]: Some submodules are not publicly available.
