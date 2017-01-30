#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.rsem.horse.job > ${f%.sra}.rsem.horse.job
done
