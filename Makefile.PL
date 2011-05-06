use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'DM4P::Adapter::MySQL',
   VERSION_FROM => 'lib/DM4P/Adapter/MySQL.pm',
   PREREQ_PM => {'DM4P' => '0'},
   LICENSE => 'perl'
);

