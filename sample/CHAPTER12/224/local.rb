#!/usr/local/bin/ruby
require 'webrick'
opts = { :BindAddress => "127.0.0.1", :Port => 10080, :DocumentRoot => "." }
srv = WEBrick::HTTPServer.new(opts)
Signal.trap(:INT) { srv.shutdown }
srv.start
