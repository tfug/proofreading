# Proofreading for TensorFlow docs translation

[tensorflow/docs](https://github.com/tensorflow/docs)の日本語訳の表記ゆれ等をチェックするツールです。

## Usage

This tool works to

1. Clone GitHub repository
2. Convert `*.ipynb` to `*.md` with `jupyter nbconvert`
3. Apply RedPen to `*.md`
4. Output the result to a text file

Basic usage is as below:

```bash
$ ./bin/run ${REPOSITORY} ${BRANCH} ${OUTPUT_FILE}
```

### Without Docker

```bash
$ ./bin/run tensorflow/docs master result.txt
```

### With Docker

If you would like to use Docker, you can also execute the proofreading as

```bash
$ ./bin/run-docker tensorflow/docs master result.txt
```

## Why use RedPen?

We are working on translation with more than one person. So It is expected that a lot of orthographical variants will occur.
[Redpen](http://redpen.cc/) is a proofreading tool to help writing documents that need to adhere to a writing standard. 
We can guarantee the quality of documents without lose writing speed while distributing translation tasks among multiple people.
RedPen officially support English and Japanese, but we can use some of the functions with another language.
