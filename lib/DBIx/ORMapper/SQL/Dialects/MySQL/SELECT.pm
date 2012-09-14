package DBIx::ORMapper::SQL::Dialects::MySQL::SELECT;

use strict;
use warnings;

use base qw(DBIx::ORMapper::SQL::Dialects::MySQL DBIx::ORMapper::SQL::Dialects::Base::SELECT);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates an new DBIx::ORMapper::SQL::Query Object.
#
# Returns:
#
#   DBIx::ORMapper::SQL::Dialects::MySQL::SELECT
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   return $self;
}

sub get_limit {
   my $self = shift;
   my $limit = shift;

   return "LIMIT $limit";
}


1;
