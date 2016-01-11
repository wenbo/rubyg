#!/usr/local/bin/ruby -Ke
# ファイルから全体を読み込む。
open("euc.txt") {|f| f.read }       # => "日本語\nにほんご\n"
# ファイルから全体を読み込み、行ごとに分割する。
open("euc.txt") {|f| f.readlines }  # => ["日本語\n", "にほんご\n"]
# それらの短縮形。
File.read("euc.txt")                # => "日本語\nにほんご\n"
File.readlines("euc.txt")           # => ["日本語\n", "にほんご\n"]
