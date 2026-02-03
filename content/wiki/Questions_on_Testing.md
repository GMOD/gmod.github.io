---
title: "Questions on Testing"
---
# Questions on Testing


*By Chris
Mungall.*

I wholeheartedly agree with the need for tests and test-driven
development

A significant portion of GMOD code will be either user-interface or
middleware. What strategies should we use for testing these?

For UI code I am talking scenarios such as complex editing operations in
Apollo. I have no idea what the best approach is.

UI is, indeed, difficult. The basic things you'd want are the ability to
drive it through injecting events, and the ability to query what state
the UI is in, and what state the stuff the UI alters is in. All this
means you ideally want to build your system from the ground-up so that
it is broken out into components like that. See, for example, anything
talking about "Model/View/Controller". (If you find yourself in a world
of code that hasn't been designed to make the testing easier, then there
are various crazy and application-specific things you can do.)

I have written a lot of middleware code, and always use extensive
tests - see go-db-perl for an example. However, I find my testing
strategy is very ad-hoc. For example:

- load test file into test database
- use API to fetch objects from database
- check objects contain expected values

This strategy is flawed, because it is difficult to be sure there are no
"holes" in the test suite in which errors can live. Filling these holes
is a sisyphean task - especially when the model is in flux.

Another approach I use is that roundtrip approach - take a sample data
file, slurp it in, pass it through every adapter available and save it
back in the original format, then diff it. The problem here is that the
diffing strategy may be sensitive to irrelevant differences -
whitespace, ordering of XML elements, presence/absence of default
values, etc. I suspect the solution here is some kind of generic diffing
algorithm based on a formal specification (relational, XML-Schema,
UML+OCL, ontologies) of the data. I'm not sure if such a thing exists.
If it does, it would be useful for all GMOD apps that have a middleware
component, regardless of programming language.


[Category](Special%253ACategories "Special%253ACategories"):

- [GMOD Developers](Category%253AGMOD_Developers "Category%253AGMOD Developers")
