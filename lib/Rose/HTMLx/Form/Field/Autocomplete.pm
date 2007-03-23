package Rose::HTMLx::Form::Field::Autocomplete;

use strict;
use warnings;
use Carp;

our $VERSION = '0.01';

use base qw( Rose::HTML::Form::Field::Text );

use Rose::Object::MakeMethods::Generic (scalar => [qw( autocomplete limit )]);

sub url
{
    my $self = shift;
    my $u    = $self->autocomplete or croak "no autocomplete URL set";
    my $n    = $self->name || $self->local_name;
    my $l    = $self->limit || 30;
    return join('', $u, '?', 'c=', $n, '&', 'l=', $l);
}

1;

__END__

=head1 NAME

Rose::HTMLx::Form::Field::Autocomplete - Ajax autocompletion for text fields

=head1 SYNOPSIS

 my $field = Rose::HTMLx::Form::Field::Autocomplete->new(
    label           => 'Complete Me',
    name            => 'completer',
    size            => 30,
    maxlength       => 128,
    autocomplete    => 'http://myserver.foo/completer/url,
    limit           => 30
 );
 
 print $field->xhtml;
 
 ...

=head1 DESCRIPTION

This subclass of Rose::HTML::Form::Field::Text is intended to make it easier
to integrate Ajax autocompletion into your web applications. You define
a URL where your web application can find suggested values for the field,
and optionally, a limit on the number of suggestions returned by the server.

This subclass is expected to be used with 
Catalyst::Controller::Rose::Autocomplete but that is not required.

=head1 METHODS

Only changes from Rose::HTML::Form::Field::Text are documented here.

=head2 autocomplete

Expects a URL value but any string is acceptable. See url().

=head2 limit

Expects an integer, which will be used in the construction of url().

=head2 url

Returns the URL for use in your template. The value is in the syntax
that Catalyst::Controller::Rose::Autocomplete expects.

=head1 AUTHOR

Peter Karman <perl@peknet.com>

Thanks to Atomic Learning, Inc for sponsoring the development of this module.

=head1 LICENSE

This library is free software. You may redistribute it and/or modify it under
the same terms as Perl itself.


=head1 SEE ALSO

Catalyst::Controller::Rose::Autocomplete,
Rose::HTML::Objects, Rose::HTML::Form::Field

=cut

