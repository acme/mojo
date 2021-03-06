# Copyright (C) 2008, Sebastian Riedel.

package MojoX::Context;

use strict;
use warnings;

use base 'Mojo::Base';

__PACKAGE__->attr('app', chained => 1, weak => 1);
__PACKAGE__->attr('stash', chained => 1, default => sub { {} });
__PACKAGE__->attr('tx', chained => 1);

# This is my first visit to the Galaxy of Terror and I'd like it to be a pleasant one.
sub req { return shift->tx->req }

sub res { return shift->tx->res }

1;
__END__

=head1 NAME

MojoX::Context - Context

=head1 SYNOPSIS

    use MojoX::Context;

    my $c = MojoX::Context->new;

=head1 DESCRIPTION

L<MojoX::Context> is a context container.

=head1 ATTRIBUTES

L<MojoX::Context> implements the following attributes.

=head2 C<app>

    my $app = $c->app;
    $c      = $c->app(MojoSubclass->new);

Returns the application instance when called without arguments.
Returns the invocant if called with arguments.

=head2 C<req>

    my $req = $c->req;

=head2 C<res>

    my $res = $c->res;

=head2 C<stash>

    my $stash = $c->stash;
    $c        = $c->stash({});

Returns a hash reference if called without arguments.
Returns the invocant if called with arguments.

    $c->stash->{foo} = 'bar';
    my $foo = $c->stash->{foo};

=head2 C<tx>

    my $tx = $c->tx;

=head1 METHODS

L<MojoX::Context> inherits all methods from L<Mojo::Base>.

=cut