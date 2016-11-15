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

use Rex                           ();
use Rex::Commands                 ();
use Rex::Commands::Box            ();
use Rex::Commands::Download       ();
use Rex::Commands::File           ();
use Rex::Commands::Fs             ();
use Rex::Commands::MD5            ();
use Rex::Commands::Network        ();
use Rex::Commands::Notify         ();
use Rex::Commands::Pkg            ();
use Rex::Commands::Rsync          ();
use Rex::Commands::Run            ();
use Rex::Commands::SCM            ();
use Rex::Commands::Service        ();
use Rex::Commands::User           ();
use Rex::Commands::Virtualization ();

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
    'English'->import::into($target, '-no_match_vars');
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

    Try::Tiny->import::into($target);
    Data::Dumper::Concise->import::into($target, qw(Dumper));
    Rex->import::into($target, '-feature' => [qw(no_path_cleanup)]);
    Rex::Commands->import::into($target);
    Rex::Commands::Box->import::into($target);
    Rex::Commands::Download->import::into($target);
    Rex::Commands::File->import::into($target);
    Rex::Commands::Fs->import::into($target);
    Rex::Commands::MD5->import::into($target);
    Rex::Commands::Network->import::into($target);
    Rex::Commands::Notify->import::into($target);
    Rex::Commands::Pkg->import::into($target);
    Rex::Commands::Rsync->import::into($target);
    Rex::Commands::Run->import::into($target);
    Rex::Commands::SCM->import::into($target);
    Rex::Commands::Service->import::into($target);
    Rex::Commands::User->import::into($target);
    Rex::Commands::Virtualization->import::into($target);
    Path::Tiny->import::into($target, qw(path cwd));

    $class;
}

1;
