requires 'strictures' => '2.000000';
requires 'namespace::clean' => '0.24';
requires 'Moo' => '2.000000';
requires 'Data::MethodProxy' => '0.03';

requires 'Scalar::Util';
requires 'Carp';

on test => sub {
    requires 'Test2::V0' => '0.000071';
};
