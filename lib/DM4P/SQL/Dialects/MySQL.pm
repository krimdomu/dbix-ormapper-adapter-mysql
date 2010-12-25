package DM4P::SQL::Dialects::MySQL;

use strict;
use warnings;

use DM4P::SQL::Dialects::MySQL::SELECT;
use DM4P::SQL::Dialects::MySQL::INSERT;
use DM4P::SQL::Dialects::MySQL::DELETE;
use DM4P::SQL::Dialects::MySQL::UPDATE;
use DM4P::SQL::Dialects::MySQL::CREATE;
use DM4P::SQL::Dialects::MySQL::ALTER;
use DM4P::SQL::Dialects::MySQL::SQL;

use base qw(DM4P::SQL::Dialects::DialectBase);

sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   $self->{'separator'} = '`';
   
   bless($self, $proto);
   return $self;
}

# Function: get_field_type
#
#    Get Field Type.
#
# Parameters:
#
#   type - String
#   args - HashRef
#   args.size - Integer
#   args.default - Varying
#
# Returns:
#
#   String.
sub get_field_type {
   my $self = shift;
   my $type = shift;
   my $args = shift;

   return unless($type);

   my $class = "DM4P::SQL::Dialects::MySQL::Table::Column::Type::$type";
   my $class_file = "DM4P/SQL/Dialects/MySQL/Table/Column/Type/$type.pm";
   
   eval {
      require $class_file;
   };
   
   if($@) {
      # todo: throw TableColumnTypeNotFound
      print "ERROR! $@\n";
   }
   
   my $type_class = $class->new(%{$args});
   return $type_class->get_sql_type();
}

1;