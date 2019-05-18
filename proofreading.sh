#!/bin/bash

function create_markdown() {
  files=`find site/ja -maxdepth 5 -type f |grep .ipynb`
  for file in ${files}; do
    dir=`dirname ${file}`
    output_dir=${dir//site\/ja/proofreading\/output\/ja}
    echo $output_dir
    mkdir -p ${output_dir}
    jupyter nbconvert --to markdown ${file} --output-dir ${output_dir}
  done
}

function exec_redpen() {
  docs=`find proofreading/output/ja -maxdepth 3 -type f |grep .md`
  redpen --conf proofreading/redpen-conf.xml ${docs}
}

lang=ja
create_markdown
exec_redpen
