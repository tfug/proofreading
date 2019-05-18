# Proofreading for TensorFlow docs translation

[tensorflow/docs](https://github.com/tensorflow/docs)の日本語訳の表記ゆれ等をチェックするツールです。

# Usage

```
$ git clone https://github.com/tensorflow/docs
$ cd docs/
$ git clone https://github.com/tfug/proofreading proofreading
$ cd proofreading
$ bin/run-check       # run text lint on the Docker container
$ bin/clear-output   # remove temporary files
```

If you would like to check one specific translated file,
please give the relative path from tensorflow/docs as argument of `bin/run-check` command as below.

```
$ bin/run-check site/ja/tutorials/keras/index.md
```

# Why use RedPen?

We are working on translation with more than one person. So It is expected that a lot of orthographical variants will occur.
[Redpen](http://redpen.cc/) is a proofreading tool to help writing documents that need to adhere to a writing standard. 
We can guarantee the quality of documents without lose writing speed while distributing translation tasks among multiple people.
RedPen officially support English and Japanese, but we can use some of the functions with another language.


checking process consists of the following two parts.
1. run `jupyter nbconvert` to convert jupyter notebook to markdown
2. run `redpen`  to read proofs
