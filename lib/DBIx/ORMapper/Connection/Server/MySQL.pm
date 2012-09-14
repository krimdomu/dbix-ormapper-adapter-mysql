package DBIx::ORMapper::Connection::Server::MySQL;

use strict;
use warnings;

use base qw(DBIx::ORMapper::Connection::Base);
use DBIx::ORMapper::SQL::Dialects::MySQL;

# ------------------------------------------------------------------------------
# Group: Constructor
# ------------------------------------------------------------------------------
# Function: new
#
#   Creates an new DBIx::ORMapper::Connection::MySQL Object.
#
# Returns:
#
#   DBIx::ORMapper::Connection::MySQL
sub new {
   my $that = shift;
   my $proto = ref($that) || $that;
   my $self = $that->SUPER::new(@_);
   
   bless($self, $proto);
   
   $self->{'dbi-type'} = 'dbi';

   return $self;
}

# ------------------------------------------------------------------------------
# Group: Public
# ------------------------------------------------------------------------------

# Function: connect
#
#   Try to connect to the database.
#
#    Throws DBIx::ORMapper::Exception::Connect on connect error.
#
# Returns:
#
#   DBI Connection Handle.
sub connect {
   my $self = shift;

   eval {
      $self->{'__db_connection'} = DBI->connect($self->dsn, $self->username, $self->password, {'RaiseError' => 1});
      $self->{'__db_connection'}->{mysql_auto_reconnect} = 1;
   } or do {
      DBIx::ORMapper::Exception::Connect->throw(error => 'Cannot connect to Database. (' . $@ . ')');
      return 0;
   };

   $self->SUPER::connect();
   
   return $self;
}

# Function: set_character_encoding
#
#   Set the character encoding.
#
# Parameters:
#
#   String
sub set_character_encoding {
   my $self = shift;
   my $encoding = shift;

   if($encoding =~ m/UTF\-8/) {
      $self->{'__db_connection'}->{'mysql_enable_utf8'} = 1;
      $self->{'__db_connection'}->do("SET NAMES utf8");
   }
}

# Function: class_type
#
#    Internat Use.
sub class_type { shift; return "MySQL"; }

# Function: type
#
#    Returns the Database-Type.
#
# Returns:
#
#   String - Database-Type.
sub type { shift; return "mysql"; }

1;
