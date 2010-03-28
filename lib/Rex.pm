package Rex;
use strict;
use warnings;
our $VERSION = '0.01';

use Redis;

sub new {
    my ($class, %options) = @_;

    $options{namespace} ||= 'root';

    $options{redis} = Redis->new(redis_server => $options{redis});

    bless \%options, $class;
}

sub namespace {
    my ( $self ) = @_;
    $self->{namespace};
}

sub redis {
    my ( $self ) = @_;
    $self->{redis};
}


sub create_index {
    my ( $self, $args ) = @_;

    my $key = $self->rex_key($args->{type}, $args->{key} );

    for my $v ( @{$args->{list}} ) {
        $self->redis->rpush($key, $v);
    }

    return 1;
}

sub rex_key {
    my ( $self, $type, $key ) = @_;
    $type ||= '_def';
    return $self->namespace.":$type:$key";
}

sub save {
    my ( $self ) = @_;
    $self->redis->save();
}



1;
__END__

=head1 NAME

Rex -

=head1 SYNOPSIS

  use Rex;

=head1 DESCRIPTION

Rex is

=head1 AUTHOR

Akihito Takeda E<lt>takeda.akihito@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
