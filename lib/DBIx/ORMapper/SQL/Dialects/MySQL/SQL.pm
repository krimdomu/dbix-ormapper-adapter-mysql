package DBIx::ORMapper::SQL::Dialects::MySQL::SQL;

use strict;
use warnings;

use base qw(DBIx::ORMapper::SQL::Dialects::MySQL DBIx::ORMapper::SQL::Dialects::Base::SQL);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates an new DBIx::ORMapper::SQL::Dialects::MySQL::SQL Object.
#
# Returns:
#
#   DBIx::ORMapper::SQL::Dialects::MySQL::SQL
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   return $self;
}


1;
