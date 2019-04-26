#!/bin/bash

function create_markdown() {
  dirname=`ls -1 site/${lang}`

  for dir in ${dirname}; do
    absdir=site/${lang}/${dir}
    if [ -d $absdir ]; then
      subdirs=`ls -1 ${absdir}`
      for subdir in ${subdirs}; do
          output_dir="proofreading/output/${lang}/${dir}/${subdir}"

          mkdir -p ${output_dir}
          jupyter nbconvert --to markdown ${absdir}/${subdir}/*.ipynb --output-dir ${output_dir}
      done
    fi
  done
}

function exec_redpen() {
  termfile=terminologies.txt
  redpen --conf proofreading/redpen-conf.xml proofreading/output/${lang}/*/*/*
}

lang=ja
create_markdown
exec_redpen
