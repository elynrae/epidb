#!/bin/bash

for f in *.vcf.*.job
do
	sbatch ${f}
done
