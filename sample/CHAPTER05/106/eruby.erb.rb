require 'erb'
# テンプレートファイルeruby.rtxtを読み込んでERBオブジェクトを作成
template = ERB.new File.read("eruby.rtxt")
# ローカル変数をセットする
name = "るびきち"
month = Time.now.month
day = Time.now.day
# テンプレート実行
puts template.result binding
# >> るびきちさん。
# >> 今日は7月22日です。
