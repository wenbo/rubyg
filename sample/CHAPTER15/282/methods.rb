#!/usr/local/bin/ruby
require 'rubygems'
Gem.dir
AS_VER = "2.2.2"                # ActiveSupportのバージョン
Dir.chdir "#{Gem.dir}/gems/activesupport-#{AS_VER}/lib/active_support/core_ext"
Dir["*/*.rb"].each do |file|
  puts; puts "# #{file}"
  klass = File.basename(File.dirname(file)).capitalize
  File.read(file).scan(/^\s+def ((?!self\.)(?!.*\#\{).+)$/) {|spec| puts spec }
end
# >> 
# >> # process/daemon.rb
# >> 
# >> # time/behavior.rb
# >> acts_like_time?
# >> （略）
