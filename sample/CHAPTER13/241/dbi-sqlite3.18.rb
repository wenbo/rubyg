require 'rubygems'; require 'dbi'
dbi = DBI.connect "DBI:SQLite3:test.sqlite3"
dbi.select_all("SELECT 1+1;")   # => [["2"]]
dbi.quote("ha'ge")               # => "ha''ge"
