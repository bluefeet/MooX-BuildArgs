package MooX::MethodProxyArgs;

=head1 NAME

MooX::MethodProxyArgs - Invoke code to populate static arguments.

=head1 SYNOPSIS

    package Foo;
    use Moo;
    with 'MooX::MethodProxyArgs';
    has bar => (
        is => 'ro',
    );
    
    package main;
    
    sub divide {
        my ($class, $number, $divisor) = @_;
        return $number / $divisor;
    }
    
    my $foo = Foo->new( bar => ['$proxy', 'main', 'divide', 10, 2 ] );
    
    print $foo->bar(); # 5

=head1 DESCRIPTION

This module munges the class's input arguments by replacing any
method proxy values found with the result of calling the methods.

This is done using L<Config::MethodProxy>.  See that module for more
infromation on how method proxies works.

=cut

use Config::MethodProxy;

use Moo::Role;
use strictures 2;
use namespace::clean;

with 'MooX::BuildArgsHooks';

around TRANSFORM_BUILDARGS => sub{
    my ($orig, $class, $args) = @_;

    return $class->$orig(
        apply_method_proxies( $args ),
    );
};

1;
__END__

=head1 SEE ALSO

=over

=item *

L<MooX::BuildArgs>

=item *

L<MooX::BuildArgsHooks>

=item *

L<MooX::Rebuild>

=item *

L<MooX::SingleArg>

=back

=head1 AUTHOR

Aran Clary Deltac <bluefeet@gmail.com>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

