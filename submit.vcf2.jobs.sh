#!/bin/bash

for f in *.vcf2.*.job
do
	sbatch ${f}
done
