#!/usr/local/bin/perl -w 
#
# $Id: esearch_wrapper.pl,v 1.1.1.1 2010/12/15 15:33:39 arlin Exp $
#
use strict; 

# process command-line arguments 
#
my ( $email, $db, $search_terms ); 
$email = shift;  
$db = shift; 
$search_terms = shift; 

# construct the URL (note: $0 is the current command)
#
my $base_url = "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi"; 
my $query_url = sprintf( "%s?tool=%s&email=%s&db=%s&term=%s", $base_url, $0, $email, $db, $search_terms ); 

# execute the query 
#
# `wget -O esearch_query_result.xml "$query_url"`;

printf STDERR "The results of the query ($query_url) are in esearch_query_results.xml\n";

# and exit
#
exit; 