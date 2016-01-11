#!/usr/local/bin/ruby
# 行単位で処理する。
ARGF.each_line do |line|
# 処理中のファイル名。
  filename = ARGF.filename
# 処理中のファイルの行番号。
  lineno = ARGF.file.lineno
  puts "#{filename}:#{lineno}:#{line}"
end
