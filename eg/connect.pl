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
