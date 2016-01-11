require 'rubygems'
require 'dbi'
require 'devel/which'; which_library "pg" # => "/pkgs/ruby18/lib/ruby/site_ruby/1.8/i686-linux/pg.so"
which_library "dbi"                       # => "/pkgs/ruby18/lib/ruby/gems/1.8/gems/dbi-0.4.0/lib/dbi.rb"
dbi = DBI.connect "DBI:Pg:test", "rubikitch", "abracadabra"
dbi.quote "a'b"                 # => 
$"
# => dbi.select_all("SELECT VERSION();")   # => 
# ~> /pkgs/ruby18/lib/ruby/gems/1.8/gems/dbi-0.4.0/lib/dbi/handles/database.rb:161:in `quote': undefined method `quote' for #<DBI::DBD::Pg::Database:0xb782bdd0> (NoMethodError)
# ~> 	from -:6
