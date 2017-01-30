#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.htseq.pig.job > ${f%.sra}.htseq.pig.job
done
