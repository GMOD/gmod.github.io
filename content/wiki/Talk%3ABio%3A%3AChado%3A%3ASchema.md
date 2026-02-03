---
title: "Talk:Bio%253A%253AChado%253A%253ASchema"
---
# Talk:Bio%253A%253AChado%253A%253ASchema


# Boundaries between BCS and Modware

Where is the boundary between this and [modware](Modware "Modware")
then? I thought the point of modware was to provide that level of
compatibility. [Scott](User%253AScott "User%253AScott") 17:55, 14 April 2011
(UTC)

------------------------------------------------------------------------

Well, Modware's not my project, but it just has a lot more stuff in it,
and it uses BCS as a data access layer. It's a comprehensive, heavy data
model, with high-level abstractions like 'Gene', while BCS is basically
just a thin wrapper around the Chado tables. It's also Moosey, with
everything that goes along with that.

Being a thin wrapper doesn't mean BCS can't have some BioPerl
compatibility though. The only example so far is that
BCS::Result::Sequence::Feature implements Bio::PrimarySeqI, but that's
illustrative of how a thin wrapper can be Bioperl compatible. Feature's
implementation of SeqI is mostly just aliasing the DBIC column accessors
to the Bio::SeqI accessors: \`seq()\` is an alias for \`residues()\`,
\`display_id()\` is an alias for \`name()\`, etc.

I don't think anything much more involved than that belongs in BCS
though. --[RobertBuels](User%253ARobertBuels "User%253ARobertBuels") 18:15, 14
April 2011 (UTC)
