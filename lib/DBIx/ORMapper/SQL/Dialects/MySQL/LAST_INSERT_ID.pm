package DBIx::ORMapper::SQL::Dialects::MySQL::LAST_INSERT_ID;

use strict;
use warnings;

use base qw(DBIx::ORMapper::SQL::Dialects::MySQL DBIx::ORMapper::SQL::Dialects::Base::LAST_INSERT_ID);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates an new DBIx::ORMapper::SQL::Query Object.
#
# Returns:
#
#   DBIx::ORMapper::SQL::Dialects::MySQL::LAST_INSERT_ID
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   return $self;
}

sub __get_sql {
   my ($class) = @_;

   return "SELECT LAST_INSERT_ID() as `id`";
}

1;
