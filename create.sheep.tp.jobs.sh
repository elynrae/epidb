#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.tp.sheep.job > ${f%.sra}.tp.sheep.job
done
