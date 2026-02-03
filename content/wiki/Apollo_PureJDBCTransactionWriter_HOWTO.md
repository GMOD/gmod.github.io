---
title: "Apollo PureJDBCTransactionWriter HOWTO"
---
# Apollo PureJDBCTransactionWriter HOWTO

This HOWTO contains instructions for using the
[Apollo](/wiki/Apollo.1) PureJDBCTransactionWriter, a component of
the chado/JDBC adapter that allows Apollo to save changes directly to a
<a href="/wiki/Chado" class="mw-redirect" title="Chado">chado</a> database via
JDBC, without having to install any stored procedures or triggers in the
target database.

  Background](#Background)
- [Prerequisites](#Prerequisites)
- [Edit
  configuration files](#Edit_configuration_files)
  - [conf/apollo.cfg](#conf.2Fapollo.cfg)
  - [conf/chado-adapter.xml](#conf.2Fchado-adapter.xml)
  - [Style and
    tiers files](#Style_and_tiers_files)
- [Configure
  and/or create name
  adapter](#Configure_and.2For_create_name_adapter)
- [Test saving
  edits](#Test_saving_edits)
- [Other
  notes](#Other_notes)
- [Known
  limitations](#Known_limitations)
- [Known
  bugs](#Known_bugs)
- [FAQ](#FAQ)
  - [Is it
    possible to use both JDBCTransactionWriter and
    PureJDBCTransactionWriter in the same Apollo
    install?](#Is_it_possible_to_use_both_JDBCTransactionWriter_and_PureJDBCTransactionWriter_in_the_same_Apollo_install.3F)
- [Authors](#Authors)

# Background

The [Apollo](/wiki/Apollo.1)
<a href="/wiki/Chado" class="mw-redirect" title="Chado">chado</a>/JDBC data
adapter currently supports **two** methods for saving changes made in
Apollo to a chado database via JDBC. These two methods are implemented
by the following (Java) classes:
