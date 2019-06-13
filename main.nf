params.reads = false

println "My reads: ${params.reads}"

reads = file(params.reads)

process fastqc {

    publishDir "results"

    input:
    file(reads) from reads

    output:
    file "*_fastqc.{zip,html}" into fastqc_results

    script:
    """
    fastqc $reads
    """
}