#!/usr/local/bin/ruby
require 'rubygems'
require 'file/tail'
# コマンドライン引数のファイルに対して「tail -f」をエミュレートする。
ARGF.file.extend(File::Tail).tail {|line| puts line }
