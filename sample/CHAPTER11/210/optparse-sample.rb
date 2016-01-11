#!/usr/local/bin/ruby
# optparseライブラリにARGV.optionsが定義されているので読み込む
require 'optparse'
# コマンドライン引数をURIに変換するためにoptparse/uriライブラリが必要。
require 'optparse/uri'
# コマンドライン引数をTimeに変換するためにoptparse/timeライブラリが必要。
require 'optparse/time'
opts = {}
ARGV.options do |o|
# コマンドの書式を書く。$0は実行スクリプトのファイル名。
  o.banner = "ruby #$0 [options] [args]"

# オプションの種類を説明する。
  o.separator "Ruby-like options:"
# Rubyインタプリタのオプションを真似する。
  # 無引数オプション「-w」、「--warning」。
  o.on("-w", "--warning", "turn warnings on for your script") {|x| opts[:warning] = x }
  # 引数が必須のオプション「-r」（複数可）。
  o.on("-r library", "require the library"){|x| (opts[:libs] ||= []) << x }
  # 引数が必須のオプション「-K」、「--kanji」。引数をシンボルに変換する。
  o.on("-K kcode", "--kanji", "specifies KANJI code-set", "(Japanese)",
    'n'=>:none, 'e'=>:eucJP, 's'=>:Shift_JIS, 'u'=>:UTF8) {|x| opts[:kanji] = x }
  # 引数が省略可能なオプション「-T」。正規表現にマッチするもののみ受け付ける。
  o.on("-T [level]", /^[0-4]$/, "turn on tainting checks") {|x| opts[:taint] = (x||0).to_i }

  o.separator "Misc options:"
# 特定の種類の必須引数を取るオプションを定義する。型変換されてブロックパラメータに渡る。
  # 配列の要素のどれかを引数に取るオプション「--candidate」。
  o.on("--candidate X", %w[a b c]) {|x| opts[:candidate] = x }
  # 浮動小数点数の引数を取るオプション「--float」。
  o.on("--float X", Float) {|x| opts[:float] = x }
  # 数値の引数を取るオプション「--numeric」。
  o.on("--numeric X", Numeric) {|x| opts[:numeric] = x }
  # 整数の引数を取るオプション「--integer」。
  o.on("--integer X", Integer) {|x| opts[:integer] = x }
  # URIの引数を取るオプション「--uri」。
  o.on("--uri X", URI) {|x| opts[:uri] = x }
  # 時刻文字列を引数に取るオプション「--time」。
  o.on("--time X", Time) {|x| opts[:time] = x }
  # カンマで区切られた文字列を引数に取るオプション「--array」。
  o.on("--array X,Y,...", Array){|x| opts[:array] = x }
  # 正規表現を引数に取るオプション「--regexp」。
  o.on("--regexp RE", Regexp){|x| opts[:regexp] = x }
# 実際にオプションを処理する。ARGVが書き換えられる。
  o.parse!
end
# 処理されたオプションと残ったコマンドライン引数を表示する。
puts "opts=#{opts.inspect},  ARGV=#{ARGV.inspect}"
