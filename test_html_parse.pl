use strict;
use warnings;
use HTML::TokeParser;
use LWP::Simple;
use Data::Dumper;



my $html = qx{wget -q --output-document=- "http://www2.comp.polyu.edu.hk/~14116974d/perl_test/"};
print "$html\n";


my $parser = new HTML::TokeParser(\$html);
my $value =-1;
our @values = ();

while (my $token = $parser->get_token()) {
	my @arr = @$token;
	my $type = $arr[0];
	my $tag = $arr[1];
	#my $attr = $arr[2];
	
	if ($tag eq "input") {
		my $attr = $arr[2];
		$value = $attr->{value};
	} elsif ($type eq "T"){
		my $text = $arr[1];
		if ($text eq "現役"){
			push(@values, $value);
		}
	}
	#print "$arr[1]\n";
	#print Dumper($token);
}

foreach(@values){
	print "$_\n";
}
