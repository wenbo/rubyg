require 'rubygems'
require 'active_support'
# 通常のファイル書き込み。
open("nonatomic.txt", "w") {|f| f.puts "Not atomically" }
# アトミックなファイル書き込み。一時ディレクトリはカレントディレクトリ。
File.atomic_write("atomic.txt", Dir.pwd) {|f| f.puts "Atomically" }
