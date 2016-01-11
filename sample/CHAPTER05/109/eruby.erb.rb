require 'erb'
template = ERB.new File.read("eruby.rtxt")
# eRubyスクリプト実行用オブジェクトを作成し、その文脈で評価する
Object.new.instance_eval do 
  @name = "るびきち"
  @month = Time.now.month
  @day = Time.now.day
  puts template.result binding
end
# >> るびきちさん。
# >> 今日は7月22日です。
