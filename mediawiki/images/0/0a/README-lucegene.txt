Using the Lucene Bio::DB::GFF Adaptor

    The Bio::DB::GFF "lucene" adaptor to support Lucene-indexed GFF files is
    a contribution to GBrowse version 1.63 from the GMOD LuceGene project.

SYNOPSIS

       # Generate a lucene index this way
       bp_load_gff.pl --adaptor lucene --create \
          --dsn $HTDOCS/gbrowse/databases/yeast_lucene \
          $HTDOCS/gbrowse/sample_data/yeast_data.gff

       # The basic GBrowse gbrowse.conf/ adaptor entry is
       db_adaptor    = Bio::DB::GFF
       db_args       = -adaptor lucene
           -dsn '$HTDOCS/gbrowse/databases/yeast_lucene'

      where $HTDOCS is full path to {Generic-Genome-Browser}/htdocs

DESCRIPTION

    This adaptor allows you to run GBrowse with fast indexed GFF files
    without the administrative overhead of MySQL or PostgreSQL. Lucene is a
    Java Apache open-source project with very high performance for searching
    large text databases. It runs as fast or somewhat faster than the
    BerkeleyDB and MySQL adaptors. It is easy to install and use.

    The indices generated are platform-independent, unlike BerkeleyDB. Thus
    GFF data, indices, the Lucene software can be copied and used without
    special installation, compiling, data-reindexing among any computers
    with Java.

INSTALLATION

    You should have installed and tested GBrowse, version 1.63 or later.
    Fetch this adaptor software from
    ftp://ftp.eugenes.org/eugenes/gbrowse/lucene-gbrowse-lite.zip (This will
    also be available thru http://www.gmod.org/lucegene/)

    Unzip and place these in {Generic-Genome-Browser}/lib/java/
    lib/java/lucene.jar , LuceneIndexer.class, LuceneSearcher.class

    Place these either in {Generic-Genome-Browser}/lib/Bio/DB/GFF/Adaptor/
    or where you have installed other BioPerl Bio/DB/GFF/Adaptor/ .
    lib/Bio/DB/GFF/Adaptor/lucene.pm , LuceneFasta.pm

    Make sure this lib is in your PERL path for bp_load_gff.pl and Gbrowse.
    See the PerlDoc in lucene.pm for further information.

    There is a simple socket server, LuceneSocket, to replace command-line
    invocation of Lucene. Benchmarks show that it does not improve speed
    over the command-line invocation, so it is not recommended. See the
    PerlDoc in lucene.pm for more information.

LOADING DATA

    The BioPerl script bp_load_gff.pl will work with this lucene adaptor
    like it does with berkeleydb, mysql and other Bio::DB::GFF adaptors. The
    only option needed once Perl and Java parts are installed as above, is
    to use '--adaptor lucene' in place of other adaptor options. The '--dsn
    /path/to/index' option will create a Lucene index at the identified path
    (with --create), or update an existing index when using --write flag.

    If your input includes FastA sequence, it will will be indexed into the
    same Lucene index as the GFF data. A FastA sequence file will be created
    in the same --dsn folder, like with the BerkeleyDB adaptor.

    Once an index is created, it can be updated and added to (either with
    new GFF or FastA), using the --write option.

    A current limitation is the lack of "delete" options. If you need to
    remove features, you now must recreate the index.

USING WITH GBROWSE

    The only gbrowse.conf change for this adaptor is the '-adaptor lucene'
    addition to db_args. Otherwise it works like the BerkeleyDB adaptor (see
    section 19 of the tutorial for BerkeleyDB; docs/tutorial/tutorial.html).

    The "lib/java/" Java parts must be findable by lucene.pm. If these are
    in the Perl @INC path, or in a 'java/' subfolder of @INC, they will be
    found. Alternately set environ variable JAVA_LIB. The Perl module calls
    the Java LuceneSearcher or LuceneIndexer application thru a perl IO
    pipe, a standard operation.

    Internally, the lucene.pm adaptor is a subclass of the berkeleydb.pm and
    memory.pm adaptors. It interfaces with GBrowse the same way, and should
    return th same features as these and MySQL, etc. for the same input data
    (tests show it does; let the author know if you find otherwise).

    It handles searches, especially of GFF attributes and notes, somewhat
    differently, relying on Lucene text search syntax and abilities. It
    generally will find matches to any word-like terms that exist in the
    input data, and supports '*' and '?' trailing wild-cards, but not
    leading wild cards ('*something' is not allowed). Lucene provides very
    capable phrase searches, so complex terms are matched. The current
    configuration uses case-insensitive index and search. The module may
    need some tuning as it matures to produce the most appropriate results
    from notes and attributes searches.

SEE ALSO

    The server ftp://ftp.eugenes.org/eugenes/gbrowse/ has a set of Lucene
    indices of genomes for Worm, Yeast, Rice, and 9 Fruitfly species, along
    with Gbrowse configuration files. You should be able to copy these, add
    to Gbrowse the Lucene-lite and Lucegene adaptors, and display the
    genomes from your favorite server computer.

    Information on Lucene is at http://www.gmod.org/lucegene/,
    http://lucene.apache.org/

AUTHORS

    Don Gilbert <gilbertd@indiana.edu> August 2005

    Adapted from Bio::DB::GFF::Adaptor::berkeleydb of Vsevolod (Simon)
    Ilyushchenko >simonf@cshl.edu< and Lincoln Stein >lstein@cshl.edu<

