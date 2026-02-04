---
title: "Web-apollo-meeting-2011-3-21"
---
# Web-apollo-meeting-2011-3-21

- Jay
 - Has a report on connecting Apollo to Trellis. Test will tell us
 where things stand.
 - To-Do more testing range queries on Chado from Trellis (their test
 machine is called 'dog')
 - Needs to discuss performance issues with Gregg.
 - He is going to find out whether their version of PostGres (8.1)
 supports materialized views. Ed says that they need to move to v9.
 - AI - Georgetown needs to set up TomCat 7
- Gregg
 - Simplified editing
 - Keeping in the loop with Mitch on the two-level problem
 - AI - Ed to look at different approaches to implementing
 Authorization.
 - <a href="http://genomancer.elasticbeanstalk.com/" class="external text"
 rel="nofollow">demo</a>
- Ed
 - Thinking about approaches for undo.
 - Committed code updates, now combined UTR/CDS comes back as single
 exon (rather than 2 separate features). Need to add translation
 start/ends now.
 - Intron splits working, Exon splits will provide the user with 2
 options:
 1. split creating a single base gap
 2. split and snap edges to closest donor/acceptor sites
- All
 - Planning on an annotation jamboree next September, 2011
