#!/bin/bash

# convert one ipynb to markdown and save to output directory
function create_markdown() {
  dir=`dirname ${file}`
  output_dir=${dir//site/proofreading\/output}
  echo $output_dir
  mkdir -p ${output_dir}
  jupyter nbconvert --to markdown ${file} --output-dir ${output_dir}
}

# find ipynb files, convert to markdown and save to output directory
function create_markdowns() {
  files=`find site/ja -maxdepth 5 -type f |grep .ipynb`
  for file in ${files}; do
    create_markdown
  done
}

function copy_markdown() {
  files=`find site/${lang} -maxdepth 5 -type f |grep .md`
  for file in ${files}; do
    dir=`dirname ${file}`
    output_dir=${dir//site/proofreading\/output}
    echo $output_dir
    mkdir -p ${output_dir}
    cp ${file} ${output_dir}/
  done
}

# execute redpen check to markdown files in output directory
function exec_redpen() {
  docs=`find proofreading/output/${lang} -maxdepth 3 -type f |grep .md`
  redpen --conf proofreading/redpen-conf.xml ${docs}
}

lang=ja

# 引数の数が1つあったらその引数で与えられたファイルのみチェックする
if [ $# -eq 1 ]; then
  file=$1
  echo "check 1 file: ${file}"
  if [ ${file##*.} = "ipynb" ]; then
    create_markdown
    base_filename=${file##*/}
    redpen --conf proofreading/redpen-conf.xml ${output_dir}/${base_filename%.*}.md
  elif [ ${file##*.} = "md" ]; then
    redpen --conf proofreading/redpen-conf.xml ${file}
  else
    echo "invalid file type"
    exit 1
  fi
# 引数が1つ以外だったら全ファイルチェックする
else
  echo "check all files"
  create_markdowns
  copy_markdown
  exec_redpen
fi
