Container monitoring (ie, CPU, memory, and I/O loads)
=========
>02-06-2017

collectd + kafka

### Step 1: Building librdkafka
librdkafka is a C library implementation of the Apache Kafka protocol, containing both Producer and Consumer support. 

Set Up the Environment
* build-essential package contains an informational list of packages which are considered essential for building Ubuntu packages including gcc compiler, make and other required tools.

```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install build-essential
$ sudo apt-get install libpthread-stubs0-dev
```

Install librdkafka-dev on Ubuntu 16.04
* version: librdkafka-dev_0.8.6-1.1_amd64.deb
* description:	library implementing the Apache Kafka protocol (development headers)

```
$ sudo apt-get update
$ sudo apt-get install librdkafka-dev
```

### Step 2: Download and install collectd

```
tar xf collectd-version.tar.bz2
cd collectd-version
./configure
make all install
```



### Reference

* [The Apache Kafka C/C++ library](https://github.com/edenhill/librdkafka)
* [collectd – The system statistics collection daemon](https://collectd.org/)
