use 5.008003;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME              => 'XML::LibXML::Devel::SetLineNumber',
	VERSION_FROM      => 'lib/XML/LibXML/Devel/SetLineNumber.pm', # finds $VERSION
	PREREQ_PM         => {}, # e.g., Module::Name => 1.1
	ABSTRACT_FROM     => 'lib/XML/LibXML/Devel/SetLineNumber.pm', 
	AUTHOR            => 'Toby Inkster <tobyink@cpan.org>',
	LIBS              => &get_libs,
	INC               => (&get_inc . ' -I.'),
	DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
	OBJECT            => '$(O_FILES)', # link all the C files too
);

sub get_libs
{
	return $ENV{PERL_LIBXML_SETLINE_LIBS}
		if $ENV{PERL_LIBXML_SETLINE_LIBS};
	
	my $libs;
	chomp( $libs ||= qx{xml2-config --libs} );
	chomp( $libs ||= qx{pkg-config --libs libxml-2.0} );
	
	die "Could not determine location of libxml2 libs.\n"
	  . "Please supply PERL_LIBXML_SETLINE_LIBS environment variable."
		unless $libs =~ /^-/;
	
	return $libs;
}

sub get_inc
{
	return $ENV{PERL_LIBXML_SETLINE_INC}
		if $ENV{PERL_LIBXML_SETLINE_INC};
		
	my $incs;
	chomp( $incs ||= qx{xml2-config --cflags} );
	chomp( $incs ||= qx{pkg-config --cflags libxml-2.0} );
	
	die "Could not determine location of libxml2 headers.\n"
	  . "Please supply PERL_LIBXML_SETLINE_INC environment variable."
		unless $incs =~ /^-/;
	
	return $incs;
}

