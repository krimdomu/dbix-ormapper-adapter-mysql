package DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::Integer;

use strict;
use warnings;

use DBIx::ORMapper::SQL::Table::Column::Type::Base;

use base qw(DBIx::ORMapper::SQL::Table::Column::Type::Base);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates the DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::Integer Object.
#
# Returns:
#
#   DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::Integer
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   
   $self->{'__sql_type'} = 'int';
   
   return $self;
}

1;
