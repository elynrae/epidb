#!/bin/bash

for f in *.fixed.bam
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.fixed.bam}/g" ~/example.vcf.sheep.job > ${f%.fixed.bam}.vcf.sheep.job
done
