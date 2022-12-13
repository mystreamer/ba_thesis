# Data Folder
------

## Syncing data across hosts

Since the data is too large for version control, we use rsync or scp for synchronize the data accross hosts.

Use rsync:

```python
rsync -a --exclude=".*" user@host:~/somedata_path .
```

## Datasets


| Prefix | Name | Origin | Description
|---|---|---|---|
| **01** | extract.csv | Swissdox@Liri | [Query](#01)
| **02** | extract.csv | Swissdox@Liri | [Query](#02)
| **03** | holder_target.txt | Stancer | [Query](#03)


## Descriptions

### 01
```
query:
  sources:
    - BLI
    - NZZ
    - TA
  dateRange:
    - 2015-01-01..2017-12-31
  languages:
    - de
result:
  format: TSV
  maxResults: 10000000
  columns:
    - id
    - pubtime
    - medium_code
    - medium_name
    - rubric
    - regional
    - doctype
    - doctype_description
    - language
    - char_count
    - dateline
    - head
    - subhead
    - content_id
    - content
version: 1.1
```

### 02
```
Primary keywords used:
- Tabakwerbung
- Tabakproduktegesetz
- Tabakregulierung
- FCTC
- Philip Morris
- British American
- Swiss Tobacco
- Lungenliga
- Krebsliga

Daterange:
    - Full range
```

### 03
```
A dataset of ~130'000 sentences from the Spiegel Corpus masking holders and targets.

Each sentence only masks 1 Holder & 1 Target, but a sentence can appear multiple times in the dataset.

Used for the ORL model training.
```