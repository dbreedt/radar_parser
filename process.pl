#!/usr/bin/perl

use strict;

my $file = shift;

if ( !defined $file ) {
  die( "Usage: process.pl <file.tsv>" );
}

my $IN;
my @parts;
my $out;
my $tmp;
my $count = 0;

open( $IN, "<$file" ) || die( "Can't opne $file for reading. $!" );

while( <$IN> ) {
  chomp;
  @parts = split /\t/;
  $out = join( ",", $parts[0], $parts[1], $parts[2], $parts[3] );

  if ( $count eq 0 ) {
    $out = join( ",", $out, $parts[4] );
    print "$out\n";
    $count++;
    next;
  }
  
  $tmp = "\"$parts[4]";

  if ( length($parts[5]) gt 1 ) {
    $tmp .= "<br><br><b>URL:</b><br><a href='" . $parts[5] . "'>". $parts[5] . "</a>";
  }

  if ( length($parts[6]) gt 1 ) {
    $tmp .= "<br><br><b>Projects:</b><br>" . $parts[6];
  }

  if ( length($parts[7]) gt 1 ) {
    $tmp .= "<br><br><b>People to talk to:</b><br>" . $parts[7];
  }

  if ( length($parts[8]) gt 1 ) {
    $tmp .= "<br><br><b>WARNING:</b><br>" . $parts[8];
  }

  $tmp .= "\"";

  $out = join( ",", $out, $tmp );
  print "$out\n";
}

close($IN);
