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
detail their strategy as used in the [sybil system](/wiki/Sybil). We
will discuss/criticize it in the discussion section.

# Goal

The goal of this article and the ensuing discussion is to define a usage
convention for the storage of comparative data in Chado. These data
include: Paralogous and Orthologous Gene clusters and Syntenic Blocks
(and potentially more?).

# Strategies

## [Sybil/IGS](/wiki/Sybil_Chado_Comparative_Genomics_Data)

See [Sybil Chado Comparative Genomics
Data](/wiki/Sybil_Chado_Comparative_Genomics_Data)
to see a description of the [Sybil](/wiki/Sybil)/IGS way of storing
comparative data.

## [FlyBase](/wiki/FlyBase_Comparative_Genomics_Data)

This
[document](/wiki/FlyBase_Comparative_Genomics_Data)
describes how FlyBase has implemented comparative data for Dmel\<-\>Dpse
and also how it plans to implement these analyses for 10 more Drosophila
species.

## <a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/ParameciumDB_synteny.pdf"
class="internal" title="ParameciumDB synteny.pdf">ParameciumDB</a>

[ParameciumDB](/wiki/ParameciumDB)
<a href="https://raw.githubusercontent.com/GMOD/gmod.github.io/main/mediawiki/images/2/20/ParameciumDB_synteny.pdf"
class="internal" title="ParameciumDB synteny.pdf">working document</a>
heavily inspired by the [FlyBase comparative implementation
standard](/wiki/FlyBase_Comparative_Genomics_Data).
This document describes how ParameciumDB models paralogy and synteny
within a genome that has undergone whole genome duplications.
