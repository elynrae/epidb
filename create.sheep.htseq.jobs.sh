#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.htseq.sheep.job > ${f%.sra}.htseq.sheep.job
done
