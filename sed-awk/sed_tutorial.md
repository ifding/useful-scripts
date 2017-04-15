
# Sed Tutorial
==============

- [Sed Syntax](#sed-syntax)
- [Sed Substitute Command](#sed-substitute-command)
- [Regular Expressions](#regular-expressions)

<br>
<hr>
<br>

### Sed Syntax

[[back to top](#sed-tutorial)]

#### 1. Sed Command Syntax

Sed stands for Stream Editor. It is very powerful to manipulate filter, and transform text.

**Basic sed syntax:**

```shell
sed [options] {sed-commands} {input-file}
```

For example, it prints all the lines from the /etc/passwd file:

```shell
$ sed -n 'p' /etc/passwd

$ cat test.sed
/^root/ p
/^nobody/ p
$ sed -n -f text.sed /etc/passwd

$ sed -n -e '/^root/ p' -e '/^nobody/ p' /etc/passwd

$ sed -n '{
/^root/ p
/^nobody/ p
}' /etc/passwd
```

#### 2. Print Pattern Space (p command)

When p is used you will use the -n option to suppress the default printing. Otherwise, when execute p as one of the commands, the line will be printed twice.

```shell
# functionally the same as: cat titanic.txt
$ sed -n 'p' titanic.txt

# print only the 2nd line:
$ sed -n '2 p' titanic.txt

# print from line 1 through line 4:
$ sed -n '1,4 p' titanic.txt

# print from line 2 through the last line:
$ sed -n '1,$ p' titanic.txt

# print lines matching the pattern: William
$ sed -n '/William/ p' titanic.txt
```

#### 3. Delete Lines (d command)

Using the sed d command, you can delete lines, only deleted from the output stream, doesn't modify the original input file.

```shell
# delete only the 2nd line
$ sed '2 d' titanic.txt

# delete from line 1 through 4
$ sed '2,4 d' titanic.txt

# delete from line 2 through the last line
# sed '2,$ d' titanic.txt

# delete lines matching the pattern "William"
$ sed '/William/ d' titanic.txt

# delete all the empty lines from a file
$ sed '/^$/ d' titanic.txt

# delete all comment lines (assuming the comment start with #)
$ sed '/^#/ d' titanic.txt
```

#### 4. Write Pattern Space to File (w command)

```shell
# write the content of titanic.txt to output.txt and display on screen
$ sed 'w output.txt' titanic.txt

# write the content of titanic.txt to output.txt but not to screen
$ sed -n 'w output.txt' titanic.txt

# write only the 2nd line
$ sed -n '2 w output.txt' titanic.txt

# write lines 1 through 4
$ sed -n '1,4 w output.txt' titanic.txt

# write from line 2 through the last line
$ sed -n '2,$ w output.txt' titanic.txt
```

<br>
<hr>
<br>

### Sed Substitute Command

[[back to top](#sed-tutorial)]

#### 1. Sed Substitute Command Syntax

The most powerful command in the stream editor is **s**ubstitute.

```shell
sed '[address-range|pattern-range] s/original-streing/replacement-string/[substitute-flags]' inputfile
```

- address-range or pattern-range , substitute-flag is optional.
- s tells Sed to execute the substitute command.
- Note that the original filw is not changed.

```shell
# replace all occurrences of William with Fei:
$ sed 's/William/Fei/' titanic.txt

# replace William with Fei only one lines that contain the keyword: Allen
$ sed '/Allen/s/William/Fei/' titanic.txt
```

#### 2. Global Flag (g flag)

```shell
# replace the 1st occurrence of lower case a with upper case A
$ sed 's/a/A/' titanic.txt

# replace all occurrences of lower case a with upper case A
$ sed 's/a/A/g' titanic.txt

# replace the 2nd occurrence of lower case a to uppper case A
$ sed 's/a/A/2' titanic.txt

# change only the 2nd occurrence of titanic to fei
$ sed 's/titanic/fei/2' titanic.txt
```

#### 3. Print Flag (p flag)

When the substitution is successful, it prints the changed line.

```shell
# print only the line that was changed by the substitute command
$ sed -n 's/William/Fei/p' titanic.txt

# change "titanic" to "fei" and print the result
$ sed -n 's/titanic/fei/2p' titanic.txt
```

#### 4. Write Flag (w flag)

When the substitution is successful, it writes the changed line to a file.

```shell
# write only the line that was changed by the substitute command to output.txt 
$ sed -n 's/William/Fei/w output.txt' titanic.txt 

# change "titanic" to "fei", write the result to a file, print all lines
$ sed 's/titanic/fei/2w output.txt' titanic.txt
```

#### 5. Ignore Case Flag (i flag)

This is available only GNU Sed.

The sed substitute flag i stands for ignore case. you can use the i flag to match the original-string in a case-insensitive manner.

```shell
$ sed -n 's/titanic/fei/i' titanic.txt
```

#### 6. Execute Flag (e flag)

This is available only in the GNU sed.

The sed substitute flag e stands for execute. Using the sed e flag, you can execute whatever is available in the pattern space as a shell command, and the output will be returned to the pattern space.

```shell
$ cat commands.txt 
/etc/passwd
/etc/group

# add the text "ls -l" in front of every line in the commands.txt and print the output
$ sed 's/^/ls -l /' commands.txt 
ls -l /etc/passwd
ls -l /etc/group

# add the text "ls -l" in front of every line in the commands.txt and execute the output
$ sed 's/^/ls -l /e' commands.txt 
```

#### 7. Combine Sed Substitution Flags

```shell
# combine g,p and w flags
$ sed -n 's/titanic/fei/gpw output.txt' titanic.txt
```

#### 8. Sed Substitution Delimiter

```shell
$ vi path.txt
reading /usr/local/bin directory

# change /usr/local/bin to /usr/bin using the sed substitute command
$ sed 's/\/usr\/local\/bin/\/usr\/bin/' path.txt
reading /usr/bin directory

# Also, | or ^ @ ! can be used as substitution delimiter
$ sed 's|/usr/local/bin|/usr/bin|' path.txt
$ sed 's^/usr/local/bin^/usr/bin^' path.txt
$ sed 's@/usr/local/bin@/usr/bin@' path.txt
$ sed 's!/usr/local/bin!/usr/bin!' path.txt
```

#### 9. Multiple Substitute Commands Affecting the Same Line

```shell
# change William to Fei Bird, then change Fei to Ken:
$ sed '{
s/William/Fei Bird/
s/Fei/Ken/
}' titanic.txt
``` 

The sed execution flow:

1). Read: Sed reads the line and puts it in the pattern space.

2). Execute: Sed executes the 2nd command on the content of the current pattern space after execution of the first command.

3). Print: It prints the content of the current pattern space.

4). Repeat: it moves on to the next line and repeats from step 1).

#### 10. Power of & - Get Matched Pattern

```shell
# enclose the id between [ and ], i.e. 1 becomes [1], 2 becomes [2], etc.
$ sed 's/^[0-9][0-9]/[&]/g' titanic.txt

# enclose the whole input line between < and >
$ sed 's/^.*/<&>/' titanic.txt
```

#### 11. Substitution Grouping 

```shell
# this sed example displays only the first field from the /etc/passwd file, 
# \([^:]*\) matches the string up to the 1st colon, 
# \1 in the replacement-string replaces the first matched group. i.e. it displays only the username:
$ sed 's/\([^:]*\).*/\1/' /etc/passwd

# encloses the 1st letter in every word inside (), if the 1st character is upper case.
$ echo "The Geek Stuff" | sed 's/\([A-Z]\)/\(\1\)/g'
(T)he (G)eek (S)tuff
```

#### 12. Sed Script Files

Add "#!/bin/sed -f" as the 1st line to test.sed file to be as an interpreter

```shell
$ vi test.sed
#!/bin/sed -f
# enclose the whole input line between < and >
s/^.*/<&>/
# replace William with Fei Bird
s/William/Fei Bird/
# replace Fei with Ken
s/Fei/Ken/
```

```
$ chmod u+x test.sed
$ ./test.sed titanic.txt
```

#### 13. Modifying the Input File Directly

```shell
$ sed 's/William/Fei/' titanic.txt > new-titanic.txt
$ mv new-titanic.txt titanic.txt

# Or use the sed command line option -i
$ sed -i 's/William/Fei/' titanic.txt

# Sed will make a backup of the original file before writing the new content
$ sed -ibak 's/William/Fei/' titanic.txt
```

<br>
<hr>
<br>


### Regular Expressions

[[back to top](#sed-tutorial)]

#### 1. Fundamentals

- Beginning of line (^)
- End of line ($)
- Single Character (.)
- Zero or more Occurrences (*)
- One or more Occurrence(\+)
- Zero or one Occurrence (\?)
- Escaping the Special Character (\)
- Character Class([0-9])


```shell
# display lines which start with 10:
$ sed -n '/^10/ p' titanic.txt

# display lines which end with the letter S
$ sed -n '/S$/ p' titanic.txt
```

#### 2. Additional Regular Expressions

- OR Operation (|)
- Exactly M Occurences ({m})
- M to N Occurrences ({m,n})
- Word Boundary (\b)
- Back References (\n)

```shell
$ vi numbers.txt
1234
12123
121
12

$ sed -n '/[0-9]/ p' numbers.txt 
1234
12123
121
12

# print lines consisting of exactly 5 digits
$ sed -n '/^[0-9]\{5\}$/ p' numbers.txt 
12123

# print lines consisting of at least 3 but more than 5 digits
$ sed -n '/^[0-9]\{3,5\}$/ p' numbers.txt 

# match lines containing the whole word Mrs
$ sed -n '/\bMrs\b/ p' titanic.txt

# match two digit number in which both the digits are same number, i.e. 11, 22, 33
$ sed -n '/\([0-9]\)\1/ p' titanic.txt
```

#### 3. Sed Substitution Using Regular Expression

```shell
# replace the last two characters in every line with ",Not Defined"
$ sed 's/..$/,Not Defined/' titanic.txt

# delete all lines that start with "#"
$ sed 's/#.*// ; /^$/ d' titanic.txt

$ vi test.html
<html><body><h1>Hello World!</h1></body></html>

# strip all html tags from test.html
$ sed -e 's/<[^>]*>//g' test.html

# remove all comments and blank lines[]
$ sed -e 's/#.*//' -e '/^$/ d' /etc/profile

# convert the DOS file format to Unix file format using sed
$ sed 's/.$//' filename
```

<br>
<hr>
<br>

### Reference

* [Sed-and-Awk-101-Hacks](https://www.yumpu.com/en/document/view/25827537/sed-and-awk-101-hacks)
