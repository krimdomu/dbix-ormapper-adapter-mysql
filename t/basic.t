use strict;
use warnings;

use Test::More tests => 19;
use Exception::Class;

use_ok 'DBIx::ORMapper';
use_ok 'DBIx::ORMapper::Helper';
use_ok 'DBIx::ORMapper::Adapter::MySQL';

DBIx::ORMapper::Helper->import;

DBIx::ORMapper::setup(

   default => "MySQL://localhost/ormapper_test?username=orm&password=ormapper",

);

ok(ref(DBIx::ORMapper::get_connection()) eq "DBIx::ORMapper::Connection::Server::MySQL", "got default connection");
ok(ref(DBIx::ORMapper::get_connection("default")) eq "DBIx::ORMapper::Connection::Server::MySQL", "got default connection (2)");

my $con = DBIx::ORMapper::get_connection();

ok($con->db eq "ormapper_test", "got db");
ok($con->uri eq "MySQL://localhost/ormapper_test?username=orm&password=ormapper", "got uri");
ok($con->server eq "localhost", "got server");

ok($con->username eq "orm", "got username");
ok($con->password eq "ormapper", "got password");

ok($con->dsn eq "dbi:mysql:database=ormapper_test;host=localhost", "got dsn");

my $create = CREATE()->table('blub')
                     ->fields()
                        ->name('String', size => 100, default => 'hi')
                        ->age('Integer')
                        ->city('String', key => 1)
                        ->comment('Text')
                     ->end()
                     ->primary_key('#name');

ok($create->to_s("MySQL") eq "CREATE TABLE `blub` (`name` varchar(100) DEFAULT 'hi', `age` int, `city` varchar(50), `comment` text, PRIMARY KEY(`name`))", "create statement");

my $alter = ALTER()->table('blub')
                        ->add()
                           ->foreign_key('#name, #age' => 'products' => '#name, #age');

ok($alter->to_s("MySQL") eq "ALTER TABLE `blub` ADD   FOREIGN KEY (`name`, `age`) REFERENCES `products` (`name`, `age`)", "alter statement (foreign key)");

my $alter2 = ALTER()->table('blub')
                        ->add()
                           ->column()
                              ->foo('String', size => 10)
                           ->end();

ok($alter2->to_s("MySQL") eq "ALTER TABLE `blub` ADD  COLUMN `foo` varchar(10)", "alter table statement (add column)");

my $alter3 = ALTER()->table('blub')
                        ->drop()
                           ->column()
                              ->baz()
                           ->end();



ok($alter3->to_s("MySQL") eq "ALTER TABLE `blub` DROP  COLUMN `baz` ", "alter table statement (drop column)");

my $create2 = CREATE()->index('idx_name')
                           ->on('blub' => ['col1', 'col2']);


ok($create2->to_s("MySQL") eq "CREATE INDEX  `idx_name` ON `blub` (`col1`, `col2`)", "create index");

my $select = SELECT()
                  ->field('#title')
                  ->field('#email')
                  ->field('#name' => 'thename')
                  ->from('comments');

ok($select->to_s("MySQL") eq "SELECT `title` AS `title`, `email` AS `email`, `name` AS `thename` FROM `comments` AS `comments`", "simple select statement (1)");

my $select2 = SELECT()
                  ->field('#title')
                  ->field('#email')
                  ->field('#comments.#id' => 'id')
                  ->field('#name' => 'thename')
                  ->from('comments')
                  ->join('users')->on('#users.#id = #comments.#user_id')
                  ->where('#comments.#id=?');

ok($select2->to_s("MySQL") eq "SELECT `title` AS `title`, `email` AS `email`, `comments`.`id` AS `id`, `name` AS `thename` FROM `comments` AS `comments` LEFT JOIN `users` ON `users`.`id` = `comments`.`user_id` WHERE `comments`.`id`=?", "select statement with join");


my $drop = DROP()
               ->table("foo");

ok($drop->to_s("MySQL") eq "DROP TABLE `foo`", "drop table statement");

