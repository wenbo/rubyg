require 'tempfile'
# open関数、File.openのようにブロックを取ることができる。
Tempfile.open("foo") do |f|
# ファイル名は一時ファイル用ディレクトリに作られる。
  path = f.path     # => "/tmp/foo20090426-1171-1rip98o-0"
# 一時ファイルに書き込む。
  f.puts "abcdef"
# 一旦closeする。
  f.close
  File.exist? path  # => true
# 一時ファイルを再び開く。このときファイルポインタは先頭になっている。
  f.open
# そのため、先程書き出した内容を読むことができる。
  f.read            # => "abcdef\n"
# 「f.close!」か「f.close true」でファイルを閉じた後、削除する。
  f.close!
  File.exist? path  # => false
# この時点でf.pathへはアクセスできなくなっている。
  f.path            # => nil
end
# Ruby 1.8.7以降では引数に配列を指定することで拡張子を指定できる。
Tempfile.open(["hoge", ".rb"]) do |f|
  f.path            # => "/tmp/hoge20090426-1171-1jy8rkz-0.rb"
end
