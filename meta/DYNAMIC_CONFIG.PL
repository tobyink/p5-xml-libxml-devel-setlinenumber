
sub get_libs ()
{
	return $ENV{PERL_LIBXML_SETLINE_LIBS}
		if $ENV{PERL_LIBXML_SETLINE_LIBS};
	
	my $libs;
	chomp( $libs ||= qx{xml2-config --libs} );
	chomp( $libs ||= qx{pkg-config --libs libxml-2.0} );
	
	# TODO - Alien::LibXML
	
	die "Could not determine location of libxml2 libs.\n"
	  . "Please supply PERL_LIBXML_SETLINE_LIBS environment variable."
		unless $libs =~ /^-/;
	
	return $libs;
}

sub get_inc ()
{
	return $ENV{PERL_LIBXML_SETLINE_INC}
		if $ENV{PERL_LIBXML_SETLINE_INC};
	
	my $incs;
	chomp( $incs ||= qx{xml2-config --cflags} );
	chomp( $incs ||= qx{pkg-config --cflags libxml-2.0} );
	
	# TODO - Alien::LibXML
	
	die "Could not determine location of libxml2 headers.\n"
	  . "Please supply PERL_LIBXML_SETLINE_INC environment variable."
		unless $incs =~ /^-/;
	
	return $incs;
}

$dynamic_config{LIBS}   = get_libs;
$dynamic_config{DEFINE} = '';
$dynamic_config{INC}    = get_inc . ' -I.';
$dynamic_config{OBJECT} = '$(O_FILES)';
