#!/usr/bin/perl

use strict;
use HTML::Parser;

my $html = qx{wget -q --output-document=- "http://www2.comp.polyu.edu.hk/~14116974d/perl_test/"};
print "$html\n";

my $parser = HTML::Parser->new(
    api_version => 3,
    start_h     => [\&read_tags, "self, tagname, attr, text"],
    marked_sections => 1,
);

$parser->parse($html);

sub read_tags {
    my ($self, $tagname, $attr, $text) = @_;  ## 上で選んだ引数が渡ってくる

    my $id = '';
    if ($tagname eq 'td'){
        $id =$attr->{id}
    }
    
    if ($id != ''){
        print "ID: $id\n";
    }
}
