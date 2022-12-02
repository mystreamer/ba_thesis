# Data Folder
------

## Syncing data across hosts

Since the data is too large for version control, we use rsync or scp for synchronize the data accross hosts.

Use rsync:

```python
rsync -a --exclude=".*" user@host:~/somedata_path .
```