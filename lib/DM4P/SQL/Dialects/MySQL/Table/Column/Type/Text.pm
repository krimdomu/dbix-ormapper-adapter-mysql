package DM4P::SQL::Dialects::MySQL::Table::Column::Type::Text;

use strict;
use warnings;

use DM4P::SQL::Table::Column::Type::Base;

use base qw(DM4P::SQL::Table::Column::Type::Base);

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates the DM4P::SQL::Dialects::MySQL::Table::Column::Type::Text Object.
#
# Returns:
#
#   DM4P::SQL::Dialects::MySQL::Table::Column::Type::Text
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   
   $self->{'__sql_type'} = 'text';
   
   return $self;
}

1;