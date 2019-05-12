#!/bin/bash

function create_markdown() {
  dirname=`ls -1 site/${lang}`
  files=`find site/ja -maxdepth 5 -type f |grep .ipynb`
  #echo ${files}
  for file in ${files}; do
    dir=`dirname ${file}`
    output_dir=${dir//site\/ja/proofreading\/output\/ja}
    echo $output_dir
    mkdir -p ${output_dir}
    jupyter nbconvert --to markdown ${file} --output-dir ${output_dir}
  done
}

function exec_redpen() {
  termfile=terminologies.txt
  redpen --conf proofreading/redpen-conf.xml proofreading/output/${lang}/*/*/*.md
  redpen --conf proofreading/redpen-conf.xml proofreading/output/${lang}/*/*.md
}

lang=ja
create_markdown
exec_redpen
