# Proofreading for TensorFlow docs translation

[tensorflow/docs](https://github.com/tensorflow/docs)の日本語訳の表記ゆれ等をチェックするツールです。

## Usage

This tool works to

1. Clone GitHub repository
2. Convert `*.ipynb` to `*.md` with `jupyter nbconvert`
3. Apply RedPen to `*.md`
4. Output the result to a text file

### Description

There are following 2 patterns of checking with this script.
1. Check documents which are differ from `origin/master`(default)
2. Check all documents(with `all` option)

Basic usage is as below:

```bash
$ ./bin/run ${REPOSITORY} ${BRANCH} [all]
```

### Run script without Docker

```bash
# To check files which are differ from `origin/master` branch
$ ./bin/run tensorflow/docs master
# To check all files
$ ./bin/run tensorflow/docs master all
```

### Run script with Docker

If you would like to use Docker, you can also execute the proofreading as

```bash
# To check files which are differ from `origin/master` branch
$ ./bin/run-docker tensorflow/docs master
# To check all files
$ ./bin/run-docker tensorflow/docs master all
```

## Why use RedPen?

We are working on translation with more than one person. So It is expected that a lot of orthographical variants will occur.
[Redpen](http://redpen.cc/) is a proofreading tool to help writing documents that need to adhere to a writing standard. 
We can guarantee the quality of documents without lose writing speed while distributing translation tasks among multiple people.
RedPen officially support English and Japanese, but we can use some of the functions with another language.
