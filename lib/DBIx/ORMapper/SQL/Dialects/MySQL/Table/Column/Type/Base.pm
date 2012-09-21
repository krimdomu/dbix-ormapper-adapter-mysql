#
# (c) Jan Gehring <jan.gehring@gmail.com>
# 
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:
   
package DBIx::ORMapper::SQL::Dialects::MySQL::Table::Column::Type::Base;

use strict;
use warnings;

use DBIx::ORMapper::SQL::Table::Column::Type::Base;
use base qw(DBIx::ORMapper::SQL::Table::Column::Type::Base);

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
   
   return $self;
}

sub get_column_options {
   my $self = shift;

   my $str = ""
         . (exists $self->{auto_increment}?" AUTO_INCREMENT ":"");

   return $str;
}

1;
