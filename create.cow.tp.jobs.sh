#!/bin/bash

for f in *.sra
do
	sed -e "s/tissue/$1/g" -e "s/example/${f%.sra}/g" ~/example.tp.cow.job > ${f%.sra}.tp.cow.job
done
