params.input= "data/Example.csv"
params.outdir = "results"
 
//Log info that is printed on your screen when running
 
log.info """\
===================================
	GOATEE v2.0
 
===================================
input file                           : ${params.input}
list of background species           : ${params.ensembl_dataset}
out directory                        : ${params.outdir}
"""
 
//================================================================================
// Include modules: declaring where the modules are 
//================================================================================
 
include { DOWNLOAD_NCBI } from './modules/download_ncbi.nf'
include { GFFREAD } from './modules/gffread.nf'
include { ORTHOFINDER } from './modules/orthofinder.nf'
include { CAFE } from './modules/cafe.nf'

// A channel to seperate NCBI and denovo samples

Channel
    .fromPath(params.input)
    .splitCsv()
    .branch { 
        ncbi: it.size() == 2 
        local: it.size() == 3
    }
    .set { input_type }

// The workflow of the pipeline

workflow {
 
	DOWNLOAD_NCBI ( input_type.ncbi  )
 
	GFFREAD ( DOWNLOAD_NCBI.out.genome.mix(input_type.local) )
 
	ORTHOFINDER ( GFFREAD.out.proteins )
 
	CAFE ( ORTHOFINDER.out.no_ortho  , ORTHOFINDER.out.speciestree )
 
}
 
workflow.onComplete {
	println ( workflow.success ? "\nDone! Open your report in your browser --> $params.outdir/report.html (if you added -with-report flag)\n" : "Hmmm .. something went wrong" )
}
