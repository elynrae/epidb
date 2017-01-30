#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.htseq.cow.job > ${f%.sra}.htseq.cow.job
done
