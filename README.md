# Proofreading for TensorFlow docs translation

[tensorflow/docs](https://github.com/tensorflow/docs)の日本語訳の表記ゆれ等をチェックするツールです。

# Usage

Basic usage is below:

```bash
./run.sh ${REPOSITORY} ${BRANCH}
```
For example:

```bash
./run.sh tensorflow/docs master
```

The above command works

1. Clone GitHub repository
2. Convert `*.ipynb` to `*.md` with `jupyter nbconvert`
3. Apply RedPen to `*.md`

We recommend you use the command as

```bash
./run.sh tensorflow/docs master > result.txt
```

to write the result to a text file.

If you would like to use Docker, you can also execute the proofreading as

```bash
./run_docker.sh tensorflow/docs master > result.txt
```

# Why use RedPen?

We are working on translation with more than one person. So It is expected that a lot of orthographical variants will occur.
[Redpen](http://redpen.cc/) is a proofreading tool to help writing documents that need to adhere to a writing standard. 
We can guarantee the quality of documents without lose writing speed while distributing translation tasks among multiple people.
RedPen officially support English and Japanese, but we can use some of the functions with another language.
