package DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::BigInteger;

use strict;
use warnings;

use DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::Base;

use base qw(DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::Base);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates the DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::BigInteger Object.
#
# Returns:
#
#   DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::BigInteger
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   
   $self->{'__sql_type'} = 'bigint';
   
   return $self;
}

1;
