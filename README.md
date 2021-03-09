# NAME

MooX::BuildArgs - Save instantiation arguments for later use.

# SYNOPSIS

```perl
package Foo;
use Moo;
with 'MooX::BuildArgs';
has bar => (is => 'ro');

my $foo = Foo->new( bar => 32 );
print $foo->build_args->{bar}; # 32
```

# DESCRIPTION

It is often useful to be able to access the arguments that were
used to create an object in their unadulterated form, before any
coercions or init\_args have changed them.  This [Moo](https://metacpan.org/pod/Moo) role
provides the arguments via the ["build\_args"](#build_args) attribute.

Note that no attempt is made to weaken the args.  So, if you use
this module and you have attributes with `weak_ref` set the
references will not be weakened within ["build\_args"](#build_args).

# METHODS

## clear\_build\_args

```
$object->clear_build_args();
```

Clears ["build\_args"](#build_args) so that it returns `undef`.

# ATTRIBUTES

## build\_args

```perl
my $args_hashref = $object->build_args();
```

Returns a hashref containing the captured arguments.

# SEE ALSO

- [MooX::BuildArgsHooks](https://metacpan.org/pod/MooX%3A%3ABuildArgsHooks)
- [MooX::MethodProxyArgs](https://metacpan.org/pod/MooX%3A%3AMethodProxyArgs)
- [MooX::Rebuild](https://metacpan.org/pod/MooX%3A%3ARebuild)
- [MooX::SingleArg](https://metacpan.org/pod/MooX%3A%3ASingleArg)

# SUPPORT

Please submit bugs and feature requests to the
MooX-BuildArgs GitHub issue tracker:

[https://github.com/bluefeet/MooX-BuildArgs/issues](https://github.com/bluefeet/MooX-BuildArgs/issues)

# AUTHORS

```
Aran Clary Deltac <bluefeet@gmail.com>
Peter Pentchev <roam@ringlet.net>
Mohammad S Anwar <mohammad.anwar@yahoo.com>
```

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
