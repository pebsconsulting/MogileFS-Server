#!/usr/bin/perl
use strict;
use Cwd;
my $cwd = getcwd;
my ($svn) = $cwd =~ m!^(.+)/mogilefs/server! or
    die "not sure where we're at";

$ENV{PERL5LIB} = join(":",
                      "$svn/mogilefs/server/lib",
                      "$svn/perlbal/lib",
                      "$svn/gearman/api/perl/Gearman/lib",
                      "$svn/gearman/api/perl/Gearman-Client-Async/lib",
                      "$svn/gearman/server/lib",
                      ($ENV{PERL5LIB} ? ($ENV{PERL5LIB}) : ()),
                      );
print "export PERL5LIB=$ENV{PERL5LIB}\n";
system($^X, "./mogstored", @ARGV);
