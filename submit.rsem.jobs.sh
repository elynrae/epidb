#!/bin/bash

for f in *.rsem.*.job
do
	sbatch ${f}
done
