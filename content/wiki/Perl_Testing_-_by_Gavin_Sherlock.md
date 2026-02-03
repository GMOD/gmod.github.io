---
title: "Perl Testing - by Gavin Sherlock"
---
# Perl Testing - by Gavin Sherlock

  Writing Tests for Perl
  Code</span>](#Guideline_for_Writing_Tests_for_Perl_Code)
  - [Philosophy](#Philosophy)
  - [Unit-tests
    vs. Integration tests](#Unit-tests_vs._Integration_tests)
  - [How to
    begin a test suite](#How_to_begin_a_test_suite)
  - [Writing
    tests](#Writing_tests)
  - [Testing
    Documentation](#Testing_Documentation)
  - [Testing
    Coverage of your
    Test-Suite](#Testing_Coverage_of_your_Test-Suite)
  - [Testing
    Performance](#Testing_Performance)

## Guideline for Writing Tests for Perl Code

### Philosophy

To build robust code, you need to incorporate the notion of testing into
your general coding practices. This is one of the cornerstones of the
Extreme Programming philosophy, which tries to lower the cost of change
(i.e. code maintenance). If you don't have a test-suite, then you will
be faced with hours of error-prone, manual testing every time you
release a new version of your code. Alternatively, you can skip the
testing, and release bug-ridden code on a regular basis, full of
regressions, or things that never worked. Not soon after, you can enjoy
nobody wanting to use your code ever again. Having a test-suite enables
you to automate testing, checking that the entire set of functionality
that your code purports to have really works. It takes a lot of effort
to write a test-suite from scratch, but it saves hours/days/weeks of
maintenance down the line. In Perl speak, not having a test suite is
false-laziness. If you adopt a philosophy that does not permit engineers
to check code into the repository that does not pass the test-suite, and
couple this with nightly running of the test-suite against the top of
the tree of your repository (i.e. CVS head), you will write much more
robust code in the long term, because you will catch regressions before
they ship, rather than afterwards. Everytime a new problem surfaces, a
new test should be written for it, so that once fixed, that problem
should never creep back in.

### Unit-tests vs. Integration tests

The goal of unit testing is to isolate each part of the program and show
that the individual parts are correct. If you write code to unit test
every non-trivial function or method, your code will likely much more
robust than it is currently, but it may still have bugs lurking in
there, which can only be found with integration testing, which may
combine many non-trivial functions together. Having unit tests is good,
because it will enable you to later refactor code and test that it still
works, and because it will make integration testing easier to design
later on.

### How to begin a test suite

The easiest way to create and use a test suite is to take advantage of
Perl's inbuilt mechanisms and modules. If your code comes with a
Makefile, and is installed using the typical:

    perl Makefile.PL
    make
    make install

You need to insert a `make test` step between `make` and `make install`.
You can use this for your own development purposes, and it also ensures
that everyone installing your code will run your test-suite on their
machine, and will hopefully send back reports of anything that breaks.

`make test` will, via your generated Makefile, invoke
ExtUtils::MakeMaker
(<a href="http://search.cpan.org/dist/ExtUtils-MakeMaker/"

which will:

1.  Check for the existence of a file named test.pl in the current
    directory and if it exists, execute the script with the proper set
    of perl -I options.
2.  Also check for any files matching glob("t/\*.t"). It will execute
    all matching files in alphabetical order via the Test::Harness
    module with the -I switches set correctly.

If you'd like to see the raw output of your tests, set the TEST_VERBOSE
variable to true:

    make test TEST_VERBOSE=1

Thus, to write a test suite, you should create a t/ directory in at the
top level of your distribution, and populate it with .t files, that will
test the functionality of your code base.

### Writing tests

Test scripts are perl scripts, but with a .t extension. Ideally, you
should split up your tests into small discrete chunks, such that each .t
script will test a particular part of your code base. You want to design
your tests well, as you will be faced with maintaining them, in addition
to maintaining your regular code base.

To write tests, you should use either the Test::Simple or the Test::More
modules. Typically, you should start with Test::Simple, and when you get
the hang of it, start using Test::More (which is entirely compatible
with tests written for Test::Simple).

For a good tutorial on testing, see
<a href="http://search.cpan.org/dist/Test-Simple/lib/Test/Tutorial.pod"

Test::Simple contains a single function, called ok(). The basic
philosophy is that it allows you to determine whether you get the
expected result from your code. You have to tell Test::Simple how many
tests you will will be performing, and write the tests, then it will
take care of the tedious details. For instance, suppose you have a
function in one of your modules that should always return a number
between 1 and 100. A test script to test that functionality is as simple
as:

``` de1
#!/usr/bin/perl -w
use Test::Simple tests => 2;

use Mylib qw (function1);
ok (function1() >= 1);
ok (function1() <= 100);
```

when you run this, you should get something like:

    1..2
    ok 1
    ok 2

If for some reason you introduce a bug, and function1() now starts
producing values greater than 100, you might get:

    1..2
    ok 1
    not ok 2

    Failed test (test.t at line 9)
    Looks like you failed 1 tests of 2.

It's now pretty easy to track down your regression. At some point, you
will hopefully have hundreds of tests, so `ok()` allows you to provide
some useful descriptive text for them too:

``` de1
#!/usr/bin/perl -w
use Test::Simple tests => 2;
use Mylib qw (function1);

ok (function1() >= 1, "function1()'s return value is greater than or equal to 1");
ok (function1() >= 100, "and it's less than or equal to 100");
```

which will now give:

    1..2
    ok 1 - function1()'s return value is greater than or equal to 1
    ok 2 - and it's less than or equal to 100

which makes it even easier for you to maintain your test-suite.

### Testing Documentation

Your code should always be fully documented with pod - that is, if you
export a function, or if you have a public method, there should be pod
documentation that describes the expected inputs and outputs of those
functions/methods. If it's not documented, then it doesn't exist. A
useful approach to pod documentation is to test that it exists, and that
what does exist is error free: Test::Pod::Coverage
(<a href="http://search.cpan.org/dist/Test-Pod-Coverage/"

checks for pod coverage in your distribution, and is trivial to use.
Just create a .t file with the following content:

``` de1
use Test::More;
eval "use Test::Pod::Coverage 1.00";
plan skip_all => "This is not an error, Test::Pod::Coverage 1.00 required for testing POD coverage" if $@;

my @modules = Test::Pod::Coverage::all_modules();
plan tests => scalar(@modules);
for my $module (@modules) {
 pod_coverage_ok($module);
}
```

This will test all of your modules for pod coverage. To test that the
pod documentation is syntactically correct, use Test::Pod
(<a href="http://search.cpan.org/dist/Test-Pod/" class="external free"

can be easily used, with a .t file containing:

``` de1
use Test::More;
eval "use Test::Pod 1.00";
plan skip_all => "This is not an error, Test::Pod 1.00 is required for testing POD" if $@;
all_pod_files_ok();
```

This test file will test that all of the pod in any files with a .pm or
a .pl extension in the distribution have syntactically correct pod. if
the Test::Pod modules are not installed, then the scripts are skipped.

### Testing Coverage of your Test-Suite

Ideally, your test suite should full exercise your code base, covering
all possible code paths. In practice, this is very difficult to
accomplish, but help is at hand:

Devel::Cover
(<a href="http://search.cpan.org/dist/Devel-Cover/" class="external free"

code coverage metrics for Perl, and can be used in conjunction with a
test-suite, like:

    cover -delete
    HARNESS_PERL_SWITCHES=-MDevel::Cover make test
    cover

You can see the author's coverage analysis of a large number of modules
from CPAN at:

<a href="http://pjcj.sytes.net/cpancover/" class="external free"

In this way, you can design new tests for your code base, designed to
cover as yet un-exercised code paths.

### Testing Performance

One of the things that you should consider testing for is performance.
It may be that your code passes all your unit and integration tests, but
in the process of refactoring it and shaking out bugs that your test
suite found, you made it three times as slow. It's now perfect, but
nobody wants to use it. If you adopt the philosophy that a decrease in
performance is a regression, then you can avoid introducing performance
problems into production code (beyond those that already existed). If
you set up a system where you record performance numbers for your code
every time there is a new check-in to your code repository, you can
track whether performance regresses beyond just noise in the
measurements. To profile your code in Perl, you can use Devel::Profile
(<a href="http://search.cpan.org/dist/Devel-Profile/"

will allow you to determine where your bottlenecks are.
