#!/bin/bash

for f in *.job
do
	sbatch ${f}
done
