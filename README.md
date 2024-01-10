# Nextflow Pipeline to Run Non-Model Organism Gene Family Evolution With CAFE
This pipeline takes a selection of NCBI refseq IDs and denovo genomes, and identifies gene expansions and contractions across a phylogeny by running CAFE (Computational analysis of family evolution). 
This github repository is forked version of the main pipeline: https://github.com/chriswyatt1/Goatee 

### Important Files to View
1) [Refined_species.csv](https://github.com/lewisrevely/Goatee/blob/main/Refined_species.csv): This is the input file I used to run this pipeline
2) [Main.alt.nf](https://github.com/lewisrevely/Goatee/blob/main/main.alt.nf): This is the central nextflow script that defines the workflow

### How I ran this pipeline
I ran the pipeline with a mix of denovo genomes and NCBI refseq IDs 
```
nextflow run main.alt.nf -resume -profile myriad -bg --input Refined_species.csv
```

### There are a number of outputs from running this pipeline 
[CAFE_summary.csv](https://github.com/lewisrevely/Goatee/blob/main/CAFE_summary.csv): This is an example of one of the outputs from this pipeline

### We can add modules to this 
[Example_module.txt](https://github.com/lewisrevely/Goatee/blob/main/example_module.txt): We could add a module that runs HAPpy-ABCENTH, a programme for more accurate gene family annotation
