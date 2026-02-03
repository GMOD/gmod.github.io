---
title: "Talk%253AGBrowse NGS Tutorial"
---
# Talk%253AGBrowse NGS Tutorial

# SamTools compilation

(CENTOS 5.4) I had to change the Makefile for samtools to have -fPIC
compile-time options so that I could then compile Bio-SamTools which was
complaining

     libbam.a(bgzf.o): relocation R_X86_64_32 against `a local symbol' can not be used when making a shared object; recompile with -fPIC

\-[Stajich](/wiki/User%3AStajich) 19:03, 14 November 2009 (UTC)
