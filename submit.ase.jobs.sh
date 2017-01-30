#!/bin/bash

for f in *.ase.*.job
do
	sbatch ${f}
done
