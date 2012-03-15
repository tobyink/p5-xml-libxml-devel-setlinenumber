package XML::LibXML::Devel::SetLineNumber;

use 5.008003;
use strict;

use XML::LibXML;
use XML::LibXML::Devel;

our $AUTHORITY  = 'cpan:TOBYINK';
our $VERSION    = '0.001';

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = our @EXPORT = qw(set_line_number);

our %EXPORT_TAGS = (
	all     => \@EXPORT_OK,
	default => \@EXPORT,
	);

require XSLoader;
XSLoader::load('XML::LibXML::Devel::SetLineNumber', $VERSION);

sub set_line_number
{
	my ($node, $line) = @_;
	_set_line_number($node, $line);
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

XML::LibXML::Devel::SetLineNumber - Perl extension for blah blah blah

=head1 SYNOPSIS

  use XML::LibXML::Devel::SetLineNumber;
  
  my $node = $document->getElementsByTagName('foo')->get_node(1);
  set_line_number($node, 8);
  say $node->line_number;  # says "8"

=head1 DESCRIPTION

This module exports one function:

=over

=item C<< set_line_number($node, $number) >>

Sets a node's line number.

=back

=head1 SEE ALSO

L<XML::LibXML::Devel>,
L<XML::LibXML::Node>.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

Copyright (C) 2012 by Toby Inkster

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 DISCLAIMER OF WARRANTIES

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

=cut
