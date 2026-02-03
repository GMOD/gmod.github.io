---
title: "Chado Comparative Schema"
---
# Chado Comparative Schema

  Overview](#Overview)
- [Goal](#Goal)
- [Strategies](#Strategies)
  - [Sybil/IGS](#Sybil.2FIGS)
  - [FlyBase](#FlyBase)
  - [ParameciumDB](#ParameciumDB)

# Overview

This article will be used to describe strategies to store comparative
data within Chado. To kickstart the discussion the ex-TIGR crew will
detail their strategy as used in the [sybil system](Sybil "Sybil"). We
will discuss/criticize it in the discussion section.

# Goal

The goal of this article and the ensuing discussion is to define a usage
convention for the storage of comparative data in Chado. These data
include: Paralogous and Orthologous Gene clusters and Syntenic Blocks
(and potentially more?).

# Strategies

## [Sybil/IGS](Sybil_Chado_Comparative_Genomics_Data "Sybil Chado Comparative Genomics Data")

See [Sybil Chado Comparative Genomics
Data](Sybil_Chado_Comparative_Genomics_Data "Sybil Chado Comparative Genomics Data")
to see a description of the [Sybil](Sybil "Sybil")/IGS way of storing
comparative data.

## [FlyBase](FlyBase_Comparative_Genomics_Data "FlyBase Comparative Genomics Data")

This
[document](FlyBase_Comparative_Genomics_Data "FlyBase Comparative Genomics Data")
describes how FlyBase has implemented comparative data for Dmel\<-\>Dpse
and also how it plans to implement these analyses for 10 more Drosophila
species.

## <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/ParameciumDB_synteny.pdf"
class="internal" title="ParameciumDB synteny.pdf">ParameciumDB</a>

[ParameciumDB](ParameciumDB "ParameciumDB")
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/ParameciumDB_synteny.pdf"
class="internal" title="ParameciumDB synteny.pdf">working document</a>
heavily inspired by the [FlyBase comparative implementation
standard](FlyBase_Comparative_Genomics_Data "FlyBase Comparative Genomics Data").
This document describes how ParameciumDB models paralogy and synteny
within a genome that has undergone whole genome duplications.
