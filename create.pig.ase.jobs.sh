#!/bin/bash

for f in *.vcf
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.vcf}/g" ~/example.ase.pig.job > ${f%.vcf}.ase.pig.job
done
