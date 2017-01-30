#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.rsem.pig.job > ${f%.sra}.rsem.pig.job
done
