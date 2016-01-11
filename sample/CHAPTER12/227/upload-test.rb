#!/usr/local/bin/ruby
require 'cgi'
CGI.new.out("type"=>"text/plain") {cgi["file"].read}
