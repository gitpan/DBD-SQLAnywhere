#!/usr/local/bin/perl
#
# $Id: login.t,v 1.1 1998/11/23 16:04:54 mpeppler Exp $

use lib 'blib/lib';
use lib 'blib/arch';
use strict;
use DBI;
use Test::More;

my $dbh;
eval {
    $dbh = DBI->connect( "DBI:SQLAnywhere:UID=dba;PWD=sql;ENG=demo;DBF=demo.db", '', '', {PrintError => 0});
};
if( $@ ) {
    plan( skip_all => 'SQL Anywhere dbcapi library is not installed' );
    exit( 0 );
}
if( !$dbh ) {
    plan( skip_all => 'demo.db is not accessible' );
    exit( 0 );
}

plan( tests => 2 );
ok( $dbh, 'connect' );
$dbh->disconnect();

# Test for a bad connect
$dbh = DBI->connect("DBI:SQLAnywhere:UID=dba;PWD=xxx;ENG=demo;DBF=demo.db", '', '', {PrintError => 0});
ok( !$dbh, 'incorrect_password' );

exit(0);
