#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.rsem.chicken.job > ${f%.sra}.rsem.chicken.job
done
