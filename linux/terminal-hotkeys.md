
# Terminal Hotkeys

### 1. 终端快捷键

终端下几个常见的快捷键:

* `ctrl-a`: 移动光标到行首。
* `ctrl-e`: 移动光标到行尾。
* `ctrl-w`: 剪切光标前一个单词（注意是剪切，不是彻底删除，可以通过`ctrl-y`粘贴。
* `ctrl-u`: 剪切光标之前的所有内容，如果光标位于行尾，则相当于剪切整行内容。
* `ctrl-k`: 剪切光标之后的所有内容，有点类似vim的`D`命令。
* `ctrl-y`：粘贴剪切的内容。
* `ctrl-p`、`ctrl-n`：向前/向后查看历史命令，和方向键的UP和Down等价。
* `ctrl-l`: 清屏，相当于执行`clear`命令，注意不会清除当前行内容。
* `ctrl-h`: 向前删除一个字符，相当于回退键。

一个典型场景，输了一大串命令A还未执行，发现需要执行另一条命令B，又不想开启一个新的终端，怎么保存当前输入的内容A呢，有两种方式:

1. 使用`ctrl-u`剪切整行内容A，执行完B命令后，使用`ctrl-y`恢复，在此之前不能有其它剪切操作，否则内容会被覆盖.
2. 使用`ctrl-a`移动光标到行首，输入`#`注释当前行内容后直接回车，这相当于注释了当前行，但在history中依然会有记录，恢复时只需要使用`ctrl-p`找到刚刚的命令，去掉`#`即可。

### 2. sudo !!

主要是利用了shell（bash）的`History Expansion`，我们使用history命令时能够列举执行的历史命令列表:

```
$ history
1 tar cvf etc.tar /etc/
2 cp /etc/passwd /backup
3 ps -ef | grep http
4 service sshd restart
5 /usr/local/apache2/bin/apachectl restart
```

每个命令前面是命令编号，如果要重复执行某个命令，只需要输入`!`加命令编号即可,比如以上需要再次重启sshd服务，只需要执行:

```bash
!4
```

`!`后面如果是负数，则表示执行前第N个命令，比如`!-1`表示执行上一个命令,`!-5`则表示执行倒数第5个命令，执行上一个命令也可以使用`!!`替代，即`!-1`和`!!`是等价的，通常使用`!!`会更便捷。一个典型的场景是执行一条命令时需要root权限，忘记输入`sudo`了,只需要执行以下命令即可:

```
sudo !!
```

关于bash的History Expansion参考[Linux Bash History Expansion Examples You Should Know](http://www.thegeekstuff.com/2011/08/bash-history-expansion/)。

### 3.  \^status\^restart\^

我们经常可能需要重复执行上一条命令，但需要修改个别参数，比如我们使用`systemctl`查看nova-compute服务状态：

```
systemctl status openstack-nova-compute
```

如果我们发现服务异常，紧接下来的操作很可能是想重启下服务，此时只需要执行以下命令即可:

```
^status^restart^
```

以上命令会自动替换为:

```
systemctl restart openstack-nova-compute
```

### 4. 使用编辑器编辑长命令

我们经常遇到需要输入非常长的命令的情况，此时如果在shell里直接输入会特别麻烦，并且不好处理换行情况，此时可以调用本地编辑器编辑命令,输入`ctrl-x` + `ctrl-e`即可。

