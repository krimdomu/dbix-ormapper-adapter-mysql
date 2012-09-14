package DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::DateTime;

use strict;
use warnings;

use DBIx::ORMapper::SQL::Table::Column::Type::Base;
use DBIx::ORMapper::SQL::Table::Column::Type::Base;
use DBIx::ORMapper::Exception::WrongFormat;

use base qw(DBIx::ORMapper::SQL::Table::Column::Type::Base);
use DateTime;

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates the DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::DateTime Object.
#
# Returns:
#
#   DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::DateTime
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
      my ($year, $mon, $day, $hour, $min, $sec) = split(/[-: T]/, $self->{'__data'});

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

   sub STORE {
      my ($self, $value) = @_;
      my ($year, $mon, $day, $hour, $min, $sec) = split(/[-: T]/, $value);

      eval {
         my $dt = DateTime->new(
            year => $year,
            month => $mon,
            day => $day,
            hour => $hour,
            minute => $min,
            second => $sec,
         );
      };

      if($@) {
         DM4P::Exception::WrongFormat->throw(error => 'Wrong Date format. Please use yyyy-mm-dd hh:mm:ss');
      }

      $self->{'__data'} = $value;
   }

}

1;
