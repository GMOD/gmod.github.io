---
title: "JBrowseDev/The CssClass Option"
---
# JBrowseDev/The CssClass Option

The cssClass option makes it possible to choose how a
[JBrowse](../JBrowse.1) track will look by selecting a
pre-existing template. Every built-in JBrowse track template is defined
as a [Cascading Style Sheet](../Glossary#CSS) (CSS) class in
the file 'genome.css'. This file can be edited as a regular text file,
and classes can be added, changed, or removed (although direct editing
is not necessary; it is possible to use the
[clientConfig](/wiki/The_ClientConfig_Option)
option to avoid changing genome.css). The argument to the cssClass
option is the name of a class in genome.css.

# JBrowse CSS Classes

As of JBrowse v1.2.1, these classes are available:

| Class Name | Shows Strand Information | Other Details |
|----|----|----|
| basic | No | Useful when it is desirable for the track appearance to be defined entirely by clientConfig. |
| cds0 | Yes | cds1 |
| Yes | cds2 | Yes |
| dblhelix | No | A black double helix outline is superimposed over the light red background. |
| est | No | exon |
| No | feature | Yes |
| feature2 | Yes | feature3 |
| Yes | feature4 | Yes |
| Pacman design. | feature5 | Yes |
| generic_parent | No | generic_part_a |
| No | helix | No |
| A single black coil outline is superimposed over a faint green background. | transcript | No |
| transcript-CDS | No | transcript-exon |
| No | transcript-five_prime_UTR | No |
| Identical to transcript-exon. | transcript-three_prime_UTR | No |
| Identical to transcript-exon. | transcript-UTR | No |
| Identical to transcript-exon. | triangle | No # See also |

- <a href="/wiki/General_Usage" class="mw-redirect"
  title="JBrowseDev/General Usage">General Usage Notes</a>

# External Links

- [JBrowse](../Category:JBrowse)
