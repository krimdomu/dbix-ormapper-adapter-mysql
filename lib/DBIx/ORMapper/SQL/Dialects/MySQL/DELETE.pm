package DBIx::ORMapper::SQL::Dialects::MySQL::DELETE;

use strict;
use warnings;

use base qw(DBIx::ORMapper::SQL::Dialects::MySQL DBIx::ORMapper::SQL::Dialects::Base::DELETE);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates an new DBIx::ORMapper::SQL::Query Object.
#
# Returns:
#
#   DBIx::ORMapper::SQL::Dialects::MySQL::DELETE
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   return $self;
}


1;
