package Quick::Perl;

# ABSTRACT: my kinda/sorta defaults

use 5.020;
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
use Path::Tiny            ();
use Scalar::Util          ();


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
    warnings->unimport('experimental');
    warnings->unimport('experimental::signatures');

    bareword::filehandles->unimport;
    indirect->unimport(':fatal');

    feature->import(':5.20');
    feature->import('signatures');

    true->import;

    Path::Tiny->import::into($target, 'path');
    Try::Tiny->import::into($target);
    Data::Dumper::Concise->import::into($target, qw(Dumper));

    $class;
}

1;
