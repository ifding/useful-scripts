# Basic Commands

### du 
estimate file space usage

```
# skip all files and subdirectories ending in .o (including the file .o itself)
$ du --exclude='*.o'

# summarize disk usage of the top 10 largest files, not including hidden files
$ du -sh * | sort -rh | head -10

# summarize disk usage of hidden files and directories
$ du -sh .*
```

### ln 
make links between files

SYNOPSIS: `ln [OPTION] TARGET DIRECTORY`

- ln, by default, creates a hard link just like *link* does. A *link* is an entry in your file system which connects a filename to the actual bytes of data on disk. What the *link* command does is allow us to manually create a link to file data that already exists.
The important thing to realize is that we did not make a copy of this data. Both filenames point to the same bytes of data on the disk.

```
$ ln file1.txt file2.txt
$ link file1.txt file2.txt
```

- Symbolic links, sometimes called soft links, they link to another link, in this example,
file2.txt points to the link file1.txt, which in turn points to the data of the file.

```
$ ln -s file1.txt file2.txt
```

Note: unlike hard links, removing the file (or directory) that a symlink points to will break the link.


### bc
Hexadecimal or Binary Conversion

```sh
# To convert to decimal, set ibase to 16
echo "ibase=16; hex-number"|bc
echo "ibase=16; FFF"|bc
4095

# To convert to hexadecimal, set obase to 16
echo "obase=16; decimal-number"|bc
echo "obase=16; 10"|bc
```
