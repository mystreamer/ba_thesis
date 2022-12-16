# Data Folder
------

## Syncing data across hosts

Since the data is too large for version control, we use rsync or scp for synchronize the data accross hosts.

Use rsync:

```python
rsync -avP --exclude=".*" . massey@rattle.ifi.uzh.ch:/home/user/massey/ba_thesis/etl
```

## Datasets


| Prefix | Name | Origin | Description
|---|---|---|---|
| **01** | extract.csv | Swissdox@Liri | [Query](#01)
| **02** | extract.csv | Swissdox@Liri | [Query](#02)
| **03** | holder_target.txt | Stancer | [Query](#03)
| **04** | embedded_sents.txt | Stancer / Spiegel| [Query](#04)


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

### 04
```
3068={1:'Sie',2:'versuchte',3:'deshalb',4:'bis',5:'zuletzt',6:',',7:'Reagans',8:'Sanktionen',9:'gegen',10:'die',11:'Pipeline',12:'zu',13:'verhindern',-1:0}
> 3068:[['c',2,1,13,8,1,8,-1],[]]
>
> das entspricht: c(2-1,13-8), 1 is source, 8 ist target (ist vielleicht
> unnötig)
> also (c(versuchen-sie,verhindern-sanktionen)
>
> Satzid:SatzDict mit SatzDict = Wortpos:Wort,... (am Ende ist -1:0,
> ignorieren)
> Satzid:ListOfRel mit ListOfRels = [R,V1,ID1,V2,ID2,SourceID,TargetID,-1]
> R = c oder p
> V1= Verb von ID1
> ID1 = von V1
> V2 = Verb von ID2, kann mit V1 identisch sein, muss nicht
> ID2 ...
> SourceID=ID1 oder ID2
> TargetID ...
```