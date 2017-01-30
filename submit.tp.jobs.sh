#!/bin/bash

for f in *.tp.*.job
do
	sbatch ${f}
done
