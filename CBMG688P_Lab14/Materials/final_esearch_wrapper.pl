#!/usr/bin/perl -w 
#
# $Id: final_esearch_wrapper.pl,v 1.1.1.1 2010/12/15 15:33:39 arlin Exp $

=head1 NAME

esearch_wrapper.pl - Perl wrapper for NCBI's esearch web service interface

=head1 SYNOPSIS

    esearch_wrapper.pl --email EMAIL --db NCBI_DB --query TERMS --file FILE

    --help, --?         print help message

Where I<FILE> is a file name.

Examples:

    esearch_wrapper.pl --email=arlin@umd.edu --db=genome --query="Thermanaerovibrio+acidaminovorans[organism]" 

=head1 DESCRIPTION

This wraps NCBI's esearch utility, providing an interface to specify the user's email, the NCBI genome division, query terms, and an output file. 

If no output file is specified, results go into esearch_query_results.xml.  

Note that this only retrieves IDs, at best.  To download the data requires the efetch utility.  

=head1 KNOWN ISSUES

We haven't really completed the processing of XML results.  

This uses wget (better to use LWP or BioPerl). 

Currently the output is confusing, due to messages from wget.  

=head1 AUTHOR

Arlin Stoltzfus (arlin@umd.edu)

=cut

use strict; 
use Getopt::Long; 
use XML::Simple; 
use Data::Dumper; 
use Pod::Usage; 

# process command-line arguments 
#
my ( $email, $db, $search_terms, $help ); 
my $outfile = "esearch_result.xml";
GetOptions(
    "email=s" => \$email,   
    "query=s" => \$search_terms, 
    "db=s" => \$db, 
    "file=s" => \$outfile, 
    "help|?" => \$help
    ) or pod2usage( "Invalid command-line options." );

pod2usage() if defined( $help ); 

# construct the URL (note: $0 is the current command)
#
my $base_url = "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi"; 
my $query_url = sprintf( "%s?tool=%s&email=%s&db=%s&term=%s", $base_url, $0, $email, $db, $search_terms ); 

# execute the query 
#
`wget -O $outfile "$query_url"`;

printf STDERR "The results of the query ($query_url) are in $outfile.\n";

# now lets see what we got
my $xml = new XML::Simple;
my $output = $xml->XMLin("$outfile");
# print Dumper($output);
printf ("end result is %s\n", $output->{ IdList }->{ Id } );
# and exit
#
exit; 

=head2 Usage

 Title   : Usage
 Usage   : Usage( "lots of problems here, gotta go" )
 Function: Prints a usage message to STDERR, then exits
 Returns : nothing
 Args    : Any messages you want to send to the user on exit. 

=cut

sub Usage
{
    my $command = $0; 
  $command =~ s#^[^\s]/##; 
    printf STDERR "@_\n" if ( @_ );
    printf STDERR "usage: $command --db NCBI_DB --email EMAIL --query TERMS [--help|-?]\n";
    exit;
}
