#!/usr/local/bin/ruby
require 'cgi'
cgi = CGI.new
cgi.out("type"=>"text/plain") { cgi.params["a"].inspect }