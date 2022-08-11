# Cas9_ontarget_alteration
This repositories contains scripts that used for the paper title: "Target-enriched nanopore sequencing and de novo assembly reveals co-occurrences of complex on-target genomic rearrangements induced by CRISPR/Cas9 in human cells"

The folder ChIP-seq contains scripts for analyzing ChIP-seq data. 

LRS contains the scripts for analyzing Xdrop-LRS data, including alignment, reads extraction, de novo assembly.

For the users' conveniece, we put the our customized de novo assembly workflow together with the scripts' name in the figure below. The details of the workflow can be found in our publication method section.
![readme_figure](https://user-images.githubusercontent.com/34516540/184148583-701a1bfa-0eaa-4a2c-ab2f-3b8c3f8386ef.png)


Xdrop_coverageplot.Rmd contains R script for processing and plotting coverage.

Pol3_readcounting_R.Rmd contains R script for normalising, applying cutoff and plotting the Pol III read count at target tRNA gene loci: tRNA-Cys-GCA-2-3 & tRNA-Cys-GCA-2-4.
