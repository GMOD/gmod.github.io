---
title: "Talk%253AGFF"
---
# Talk%253AGFF


The gene examples are not a valid GFF3 files

    ctg123 example mRNA            1050 9000 . + . ID=EDEN.1;Parent=EDEN;Name=EDEN.1;Index=1
    ctg123 example five_prime_UTR  1050 1200 . + . Parent=EDEN.1
    ctg123 example CDS             1201 1500 . + 0 Parent=EDEN.1
    ...
    ctg123 example three_prime_UTR 7609 9000 . + . Parent=EDEN.1

  
"Index" is not a application defined attribute, the GFF3 specification
states:

"All attributes that begin with an uppercase letter are reserved for
later use. Attributes that begin with a lowercase letter can be used
freely by applications."

As far a I can tell, the type values are case-sensitive, and UTR should
have the types

    five_prime_utr SO:0000204
    three_prime_utr SO:0000205
