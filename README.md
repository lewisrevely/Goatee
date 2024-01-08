# Nextflow Pipeline to Run Non-Model Organism Gene Evolution With CAFE
This pipeline takes a selection of NCBI refseq IDs (and optionally personal genome files), and identifies gene expansions and contractions for each species by running CAFE. 

### Important Files to View
1) [Main.alt.nf]([https://github.com/lewisrevely/Goatee](https://github.com/lewisrevely/Goatee/blob/main/main.alt.nf)): This is the main file within nextflow that orchestrates the seuqence of programmes from an input file and provides outputs
2) [nextflow.config](https://github.com/lewisrevely/Goatee/edit/main/nextflow.config): This is a configuration file to define where the pipeline is being run
3) [Example.All.csv](https://github.com/lewisrevely/Goatee/blob/main/example.csv): This is an example input file made up of NCBI refseq IDs 



### Example run on NCBI refseq IDs
The pipeline can be run on just NCBI refseq IDs 

```
nextflow run main.alt.nf -resume -profile myriad -bg --input Example.All.csv 
```
### A run on both personal genome sequence files and NCBI refseq IDs 
This is an example of a line of code that was used to run a mix of NCBI refseq IDs of some wasp species alongside species which we had the gff and fasta files ourselves. This would require the main.nf file to be amended to allow personal genome files to be included
```
nextflow run main.nf -resume -profile myriad -bg --input input_refined_species.csv
```

