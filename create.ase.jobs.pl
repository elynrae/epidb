#!/usr/bin/perl

use warnings;
use strict;

my $dirname = $ARGV[0];
my $species = $ARGV[1];
my $tissue = $ARGV[2];

my $outFile = $tissue.".merge.job";
open my $OUT, ">", $outFile or die("Could not open file. $!");
print $OUT "#!/bin/bash\n";
print $OUT "#SBATCH -p medium\n";
print $OUT "#SBATCH -N 1\n";
print $OUT "#SBATCH -n 12\n";
print $OUT "#SBATCH --time=12:00:00\n";
print $OUT "#SBATCH --error=example.err\n";
print $OUT "#SBATCH --output=example.out\n\n";
print $OUT "module load samtools/1.3\n";
print $OUT "module load gatk/3.5\n\n";
print $OUT "cd ~/epidb.processing/".$species."/".$tissue."\n\n";
print $OUT "gatk -T CombineVariants -R ~/index/bos_taurus/current_build.fa -nt 12";

opendir(DIR, $dirname) || die "Error opening dir $dirname\n";
while((my $filename = readdir(DIR)))
{       
        if($filename =~ /.sra/)
        {
       		my $basename = $filename;
		$basename =~ s/.sra//;
		print $OUT " --variant ".$basename.".vcf";
	}
}

print $OUT " -o ".$tissue.".merged.vcf -genotypeMergeOptions UNIQUIFY\n";
print $OUT "gatk -T VariantAnnotator -R ~/index/bos_taurus/current_build.fa -V ".$tissue.".merged.vcf -o ".$tissue.".AB.vcf -nt 12 -A AlleleBalance\n";
print $OUT "gatk -T VariantAnnotator -R ~/index/bos_taurus/current_build.fa -V ".$tissue.".merged.vcf -o ".$tissue.".ACS.vcf -nt 12 -A AlleleCountBySample\n";
print $OUT "gatk -T VariantAnnotator -R ~/index/bos_taurus/current_build.fa -V ".$tissue.".merged.vcf -o ".$tissue.".SOR.vcf -nt 12 -A AS_StrandOddsRatio\n";

