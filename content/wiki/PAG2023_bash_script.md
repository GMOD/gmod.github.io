---
title: "PAG2023 bash script"
---
# PAG2023 bash script

 #!/bin/bash

 jbrowse create public_html --force

 cd public_html

 jbrowse add-assembly data/c_elegans.PRJNA13758.WS286.genomic.fa.gz \
 --displayName "C. elegans N2" \
 --name c_elegans_PRJNA13758 \
 --type bgzipFasta \
 --load inPlace \
 --refNameAliases test_data/ce_aliases.txt

 jbrowse add-track data/c_elegans.genes.sorted.gff3.gz \
 --name Genes \
 --description "Curated genes from WormBase" \
 --load inPlace

 jbrowse text-index --attributes=Name,ID,locus --tracks c_elegans.genes.sorted.gff3

 jbrowse add-track https://s3.amazonaws.com/agrjbrowse/MOD-jbrowses/WormBase/WS286/c_elegans_PRJNA13758/tracks/Curated%20Genes%20\(protein%20coding\)/{refseq}/trackData.jsonz \
 --name "Protein coding genes" \
 --description "Only protein coding genes from WormBase"

 jbrowse add-track https://s3.amazonaws.com/wormbase-modencode/test/CeNDR/CB4854.bam \
 --name "CeNDR BAM"

 jbrowse add-track https://storage.googleapis.com/elegansvariation.org/releases/current/WI.current.soft-filtered.vcf.gz \
 --name Variants

 jbrowse add-track https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+1.bw \
 --name "Frame 1 usage"

 jbrowse add-track-json '{"type":"MultiQuantitativeTrack","trackId":"multiwiggle_phylo","name":"Forward PhyloCSF","assemblyNames":["c_elegans_PRJNA13758"],"adapter":{"type":"MultiWiggleAdapter", "bigWigs":["https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+1.bw", "https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+2.bw", "https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+3.bw"]}, "displays":[{"type": "MultiLinearWiggleDisplay","displayId": "multiwiggle_phylo-MultiLinearWiggleDisplay"}]}'

 jbrowse add-assembly data/c_briggsae.PRJNA10731.WS287.genomic.fa.gz \
 --displayName "C. briggsae" \
 --name c_briggsae_PRJNA10731 \
 --type bgzipFasta \
 --load inPlace

 jbrowse add-track data/c_elegans.c_briggsae.paf \
 --assemblyNames c_briggsae_PRJNA10731,c_elegans_PRJNA13758 \
 --description "A minimap2 comparison of C. elegans and C. briggsae" \
 --load inPlace \
 --name "C. elegans/C. briggsae Synteny"

 jbrowse add-track https://s3.amazonaws.com/agrjbrowse/MOD-jbrowses/WormBase/WS287/c_briggsae_PRJNA10731/tracks/Curated_Genes/{refseq}/trackData.jsonz \
 --assemblyNames c_briggsae_PRJNA10731 \
 --name "C. briggsae Genes" \
 --trackId c_briggsae_genes

 jbrowse add-track https://s3.amazonaws.com/wormbase-modencode/test/maroilley/candidateSV.vcf.gz \
 --name "Structural Variant Candidates VCF" \
 --assemblyNames c_elegans_PRJNA13758 \
 --category "Structural Variants"

 jbrowse add-track https://s3.amazonaws.com/wormbase-modencode/test/maroilley/VC109_Het_trim_bwaMEM_sort.bam \
 --name "VC109 BAM" \
 --assemblyNames c_elegans_PRJNA13758 \
 --category "Structural Variants"
