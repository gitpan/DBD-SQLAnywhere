#!/usr/local/bin/perl -w
# *****************************************************
# Copyright (c) 2005-2008 iAnywhere Solutions, Inc.
# Portions copyright (c) 2005-2008 Sybase, Inc.
# All rights reserved. All unpublished rights reserved.
# *****************************************************
#
use DBI;
use strict;
my $connstr = 'ENG=demo;DBN=demo;DBF=demo.db;UID=dba;PWD=sql';
# For a remote connection, you might want to add "CommLinks=tcpcip" for example

my $dbh = DBI->connect( "DBI:SQLAnywhere:$connstr", '', '', {PrintError => 0, AutoCommit => 0} )
    or die "Connection failed\n    Connection string: $connstr\n    Error message    : $DBI::errstr\n";
$dbh->disconnect;
exit(0);
__END__
