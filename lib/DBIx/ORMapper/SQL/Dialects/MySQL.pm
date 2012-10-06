package DBIx::ORMapper::SQL::Dialects::MySQL;

use strict;
use warnings;

use DBIx::ORMapper::SQL::Dialects::MySQL::SELECT;
use DBIx::ORMapper::SQL::Dialects::MySQL::INSERT;
use DBIx::ORMapper::SQL::Dialects::MySQL::DELETE;
use DBIx::ORMapper::SQL::Dialects::MySQL::UPDATE;
use DBIx::ORMapper::SQL::Dialects::MySQL::CREATE;
use DBIx::ORMapper::SQL::Dialects::MySQL::DROP;
use DBIx::ORMapper::SQL::Dialects::MySQL::ALTER;
use DBIx::ORMapper::SQL::Dialects::MySQL::SQL;
use DBIx::ORMapper::SQL::Dialects::MySQL::LAST_INSERT_ID;

use base qw(DBIx::ORMapper::SQL::Dialects::DialectBase);

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

   my $class = "DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::$type";
   my $class_file = "DBIx/ORMapper/SQL/Dialects/MySQL/Table/Column/Type/$type.pm";
   
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
