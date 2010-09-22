package DM4P::SQL::Dialects::MySQL::CREATE;

use strict;
use warnings;

use base qw(DM4P::SQL::Dialects::MySQL DM4P::SQL::Dialects::Base::CREATE);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates an new DM4P::SQL::Query Object.
#
# Returns:
#
#   DM4P::SQL::Dialects::MySQL::CREATE
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
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