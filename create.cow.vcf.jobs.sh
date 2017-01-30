#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.vcf.cow.job > ${f%.sra}.vcf.cow.job
done
