



<span id="top"></span>




# <span dir="auto">PAG2026 bash script</span>









    #!/bin/bash

    jbrowse create public_html --force 

    cd public_html

    jbrowse add-assembly data/c_elegans.PRJNA13758.WS286.genomic.fa.gz \
             --displayName "C. elegans N2" \
             --name c_elegans_PRJNA13758 \
             --type bgzipFasta \
             --load inPlace \
             --refNameAliases data/ce_aliases.txt

    jbrowse add-track data/c_elegans.genes.sorted.gff3.gz \
             --name Genes \
             --description "Curated genes from WormBase" \
             --load inPlace \
             --config '{ "metadata": { "source":"GFF3 created by Scott Cain, from WormBase annotation file at https://downloads.wormbase.org/releases/WS286/species/c_elegans/PRJNA13758/c_elegans.PRJNA13758.WS286.annotations.gff3.gz" } }'

    jbrowse text-index --attributes=Name,ID,locus --tracks c_elegans.genes.sorted.gff3

    jbrowse add-track https://s3.amazonaws.com/agrjbrowse/MOD-jbrowses/WormBase/WS286/c_elegans_PRJNA13758/tracks/Curated%20Genes%20\(protein%20coding\)/{refseq}/trackData.jsonz \
       --name "Protein coding genes" \
       --description "Only protein coding genes from WormBase" \
       --config '{ "metadata": { "source":"Directly from WormBases JBrowse 1 instance at https://wormbase.org/tools/genome/jbrowse" } }'


    jbrowse add-track https://s3.amazonaws.com/agrjbrowse/MOD-jbrowses/WormBase/static_tracks/modencode-bucket/test/CeNDR/CB4854.bam \
           --name "CeNDR BAM" \
           --config '{ "metadata": { "source":"Used by permission from http://elegansvariation.org/" } }'

    jbrowse add-track https://storage.googleapis.com/elegansvariation.org/releases/current/WI.current.soft-filtered.vcf.gz \
             --name Variants \
             --config '{ "metadata": { "source":"Used by permission from http://elegansvariation.org/" } }'

    jbrowse add-track https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+1.bw \
       --name "Frame 1 usage" \
       --config '{ "metadata": { "source":"Publicly available data from the Broad Institute: https://data.broadinstitute.org/compbio1/PhyloCSFtracks/trackHub/mm39/PhyloCSF_raw.html" } }'

    jbrowse add-track-json '{"type":"MultiQuantitativeTrack","trackId":"multiwiggle_phylo","name":"Forward PhyloCSF","assemblyNames":["c_elegans_PRJNA13758"],"adapter":{"type":"MultiWiggleAdapter","bigWigs":["https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+1.bw","https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+2.bw","https://data.broadinstitute.org/compbio1/PhyloCSFtracks/ce11/latest/PhyloCSF+3.bw"]},"metadata":{"source":"Publicly available data from the Broad Institute: https://data.broadinstitute.org/compbio1/PhyloCSFtracks/trackHub/mm39/PhyloCSF_raw.html"},"displays":[{"type":"MultiLinearWiggleDisplay","displayId":"multiwiggle_phylo-MultiLinearWiggleDisplay"}]}'

    jbrowse add-assembly data/c_briggsae.PRJNA10731.WS287.genomic.fa.gz \
            --displayName "C. briggsae" \
            --name c_briggsae_PRJNA10731 \
            --type bgzipFasta \
            --load inPlace

    jbrowse make-pif data/c_elegans.c_briggsae.paf

    jbrowse add-track c_elegans.c_briggsae.pif.gz \
         --assemblyNames c_briggsae_PRJNA10731,c_elegans_PRJNA13758 \
         --description "A minimap2 comparison of C. elegans and C. briggsae" \
         --load inPlace \
         --name "C. elegans/C. briggsae Synteny" \
         --config '{ "metadata": { "source":"Comparative analysis using this command: minimap2 -c data/c_elegans.PRJNA13758.WS286.genomic.fa.gz data/c_briggsae.PRJNA10731.WS287.genomic.fa.gz > c_elegans.c_briggsae.paf" } }'


    jbrowse add-track https://s3.amazonaws.com/agrjbrowse/MOD-jbrowses/WormBase/WS287/c_briggsae_PRJNA10731/tracks/Curated_Genes/{refseq}/trackData.jsonz \
         --assemblyNames c_briggsae_PRJNA10731 \
         --name "C. briggsae Genes" \
         --trackId c_briggsae_genes \
         --config '{ "metadata": { "source":"Curated genes track directly from the WormBase JBrowse 1 instance." } }'

    jbrowse add-track https://s3.amazonaws.com/agrjbrowse/MOD-jbrowses/WormBase/static_tracks/modencode-bucket/test/maroilley/candidateSV.vcf.gz \
           --name "Structural Variant Candidates VCF" \
           --assemblyNames c_elegans_PRJNA13758 \
           --category "Structural Variants"

    jbrowse add-track https://s3.amazonaws.com/agrjbrowse/MOD-jbrowses/WormBase/static_tracks/modencode-bucket/test/maroilley/VC109_Het_trim_bwaMEM_sort.bam \
           --name "VC109 BAM" \
           --assemblyNames c_elegans_PRJNA13758 \
           --category "Structural Variants"








## Navigation menu









### Navigation



- <span id="n-GMOD-Home">[GMOD Home](Main_Page)</span>
- <span id="n-Software">[Software](GMOD_Components)</span>
- <span id="n-Categories-.2F-Tags">[Categories /
  Tags](Categories)</span>




### Documentation



- <span id="n-Overview">[Overview](Overview)</span>
- <span id="n-FAQs">[FAQs](Category%253AFAQ)</span>
- <span id="n-HOWTOs">[HOWTOs](Category%253AHOWTO)</span>
- <span id="n-Glossary">[Glossary](Glossary)</span>




### Community



- <span id="n-GMOD-News">[GMOD News](GMOD_News)</span>
- <span id="n-Training-.2F-Outreach">[Training /
  Outreach](Training_and_Outreach)</span>
- <span id="n-Support">[Support](Support)</span>
- <span id="n-GMOD-Promotion">[GMOD Promotion](GMOD_Promotion)</span>
- <span id="n-Meetings">[Meetings](Meetings)</span>
- <span id="n-Calendar">[Calendar](Calendar)</span>




### Tools

- <span id="t-smwbrowselink"><a href="Special%253ABrowse/PAG2026_bash_script" rel="smw-browse">Browse
  properties</a></span>



- <span id="footer-info-lastmod">Last updated at 22:04 on 8 January
  2026.</span>
<!-- - <span id="footer-info-viewcount">677 page views.</span> -->
- <span id="footer-info-copyright">Content is available under
  <a href="http://www.gnu.org/licenses/fdl-1.3.html" class="external"
  rel="nofollow">a GNU Free Documentation License</a> unless otherwise
  noted.</span>

<!-- -->



<!-- -->




