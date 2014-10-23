package Quick::Perl;

# ABSTRACT: my kinda/sorta defaults

use v5.14;
use strict;
use warnings;
use utf8::all;
use boolean;
use autodie;
use autobox       ();
use autobox::Core ();
no bareword::filehandles;
no indirect ':fatal';

use Try::Tiny;

use Carp                  ();
use Const::Fast           ();
use feature               ();
use true                  ();
use Data::Dumper::Concise ();
use match::simple         ();
use Function::Parameters  ();
use Path::Tiny            ();
use PerlX::Maybe          ();
use Scalar::Util          ();
use Switch::Plain         ();
use Sys::Info             ();
use Set::Tiny             ();

use Import::Into;

sub import {
    my $class  = shift;
    my $target = caller;

    # Core
    Carp->import::into($target, qw/carp croak confess/);
    Const::Fast->import::into($target, qw/const/);
    Scalar::Util->import::into($target, qw/blessed reftype weaken/);

    # Pragmas
    'strict'->import::into($target);
    'warnings'->import::into($target);
    'utf8::all'->import::into($target);
    'autodie'->import::into($target, ':all');
    'boolean'->import::into($target, ':all');
    'autobox'->import::into($target);
    'autobox::Core'->import::into($target);

    warnings->unimport('once');
    if ($] >= 5.018) {
        warnings->unimport('experimental');
    }

    bareword::filehandles->unimport;
    indirect->unimport(':fatal');

    feature->import(':5.14');
    feature->unimport('switch');

    match::simple->import::into($target);
    true->import;

    Function::Parameters->import::into(
        $target,
        {   func   => 'function_strict',
            method => 'method_strict',
        }
    );

    Path::Tiny->import::into($target, 'path');
    PerlX::Maybe->import::into($target, qw/maybe provided/);
    Try::Tiny->import::into($target);
    Data::Dumper::Concise->import::into($target, qw(Dumper));
    Switch::Plain->import;
    Set::Tiny->import::into($target);

    $class;
}

1;
