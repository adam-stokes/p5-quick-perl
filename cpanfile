requires "Carp" => "0";
requires "Const::Fast" => "0";
requires "Data::Dumper::Concise" => "0";
requires "Function::Parameters" => "0";
requires "Import::Into" => "0";
requires "Path::Tiny" => "0";
requires "PerlX::Maybe" => "0";
requires "Scalar::Util" => "0";
requires "Set::Tiny" => "0";
requires "Switch::Plain" => "0";
requires "Sys::Info" => "0";
requires "Try::Tiny" => "0";
requires "autobox" => "0";
requires "autobox::Core" => "0";
requires "autodie" => "0";
requires "bareword::filehandles" => "0";
requires "boolean" => "0";
requires "feature" => "0";
requires "indirect" => "0";
requires "match::simple" => "0";
requires "perl" => "v5.14.0";
requires "strict" => "0";
requires "true" => "0";
requires "utf8::all" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Test::Compile" => "0";
  requires "Test::Kwalitee" => "0";
  requires "Test::Mojo" => "0";
  requires "Test::More" => "0";
  requires "Test::NoTabs" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Test::Kwalitee" => "1.21";
  requires "Test::More" => "0";
  requires "Test::NoTabs" => "0";
};
