require 'erubis'
template = Erubis::Eruby.new File.read("eruby.rtxt")
# インスタンス変数を明示的に宣言する
puts template.evaluate :name => "るびきち", :month => Time.now.month, :day => Time.now.day
# >> るびきちさん。
# >> 今日は7月22日です。
