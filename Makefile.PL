use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'DM4P::Adapter::SQLite',
   VERSION_FROM => 'lib/DM4P/Adapter/SQLite.pm',
   PREREQ_PM => {'DM4P' => '0'},
   LICENSE => 'perl'
);

