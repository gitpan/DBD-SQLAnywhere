#!/usr/local/bin/perl -w
# *****************************************************
# Copyright (c) 2005-2010 iAnywhere Solutions, Inc.
# Portions copyright (c) 2005-2010 Sybase, Inc.
# All rights reserved. All unpublished rights reserved.
# *****************************************************
# This sample code is provided AS IS, without warranty or liability of any kind.
#
# You may use, reproduce, modify and distribute this sample code without
# limitation,  on the condition that you retain the foregoing copyright
# notice and disclaimer as to the original iAnywhere code.
#
# *******************************************************************
# Note: The value specified for the password param is ignored
#       by the ASA DBD driver but, DBI requires something in the field.
#
use DBI;
use strict;

my $connstr = 'ENG=demo;DBN=demo;DBF=demo.db;UID=dba;PWD=sql';
my $dbh = DBI->connect( "DBI:SQLAnywhere:$connstr", '', '', {AutoCommit => 0} );

my $sel_statement = "SELECT ID, GivenName, Surname FROM customers"; 
&db_query( $sel_statement, $dbh );
$dbh->disconnect;
exit( 0 );

sub db_query {
    my( $sel, $h ) = @_;
    my( $row, $sth ) = undef;
    $sth = $h->prepare( $sel );
    $sth->execute;
    print "Names:      @{$sth->{NAME}}\n";
    print "Fields:     $sth->{NUM_OF_FIELDS}\n";
    print "Params:     $sth->{NUM_OF_PARAMS}\n";
    print "\nFirst Name\tLast_name\tTitle\n";
    while( $row = $sth->fetch ) {
	print "@$row[0]\t@$row[1]\t\t@$row[2]\n";
    }
    $sth->finish;
}
__END__
