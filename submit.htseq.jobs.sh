#!/bin/bash

for f in *.htseq.*.job
do
	sbatch ${f}
done
