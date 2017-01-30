#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.htseq.horse.job > ${f%.sra}.htseq.horse.job
done
