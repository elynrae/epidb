#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.htseq.chicken.job > ${f%.sra}.htseq.chicken.job
done
