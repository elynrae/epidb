#!/bin/bash

for f in *.fixed.bam
do
	samtools index ${f}
done
