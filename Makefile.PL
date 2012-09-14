use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'DBIx::ORMapper::Adapter::MySQL',
   VERSION_FROM => 'lib/DBIx/ORMapper/Adapter/MySQL.pm',
   PREREQ_PM => {'DBIx::ORMapper' => '0'},
   LICENSE => 'perl'
);

