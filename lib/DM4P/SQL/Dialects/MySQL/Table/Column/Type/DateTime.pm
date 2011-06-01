package DM4P::SQL::Dialects::MySQL::Table::Column::Type::DateTime;

use strict;
use warnings;

use DM4P::SQL::Table::Column::Type::Base;

use base qw(DM4P::SQL::Table::Column::Type::Base);
use DateTime;

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates the DM4P::SQL::Dialects::MySQL::Table::Column::Type::DateTime Object.
#
# Returns:
#
#   DM4P::SQL::Dialects::MySQL::Table::Column::Type::DateTime
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   
   $self->{'__sql_type'} = 'datetime';
   
   return $self;
}


REDEFINES: {
   no warnings 'redefine';
   sub FETCH {
      my ($self) = @_;
      my ($year, $mon, $day, $hour, $min, $sec) = split(/[-: ]/, $self->{'__data'});
      
      my $dt = DateTime->new(
         year => $year,
         month => $mon,
         day => $day,
         hour => $hour,
         minute => $min,
         second => $sec,
      );

      return $dt;
   }
}

1;
