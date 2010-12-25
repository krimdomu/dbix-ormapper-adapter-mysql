package DM4P::SQL::Dialects::MySQL::Table::Column::Type::String;

use strict;
use warnings;

use DM4P::SQL::Table::Column::Type::Base;

use base qw(DM4P::SQL::Table::Column::Type::Base);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates the DM4P::SQL::Dialects::MySQL::Table::Column::Type::String Object.
#
# Returns:
#
#   DM4P::SQL::Dialects::MySQL::Table::Column::Type::String
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   
   $self->{'__sql_type'} = 'varchar';
   
   if(!defined($self->{'size'})) {
      $self->{'size'} = 50;
   }
   
   return $self;
}

1;