
## Compress and Extract Files Using the tar Command on Linux

### Compress an Entire Directory or a Single File

```
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file
```

- c: Create an archive.
- z: Compress the archive with gzip.
- v: Display progress in the terminal while creating the archive, also known as “verbose” mode. The v is always optional in these commands, but it’s helpful.
- f: Allows you to specify the filename of the archive.


### Compress Multiple Directories or Files at Once

```
tar -czvf archive.tar.gz /home/ubuntu/Downloads /usr/local/stuff /home/ubuntu/Documents/notes.txt
```

### Extract an Archive


```
tar -xzvf archive.tar.gz
```


Extract the contents of the archive to a specific directory:

```
tar -xzvf archive.tar.gz -C /tmp
```

## Reference

- [How to Compress and Extract Files Using the tar Command on Linux](https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/)