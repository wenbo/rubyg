# ERBとはここが違う
require 'erubis'
template = Erubis::Eruby.new File.read("eruby.rtxt")
# ここからは同じ
name = "るびきち"
month = Time.now.month
day = Time.now.day
puts template.result binding
# >> るびきちさん。
# >> 今日は7月22日です。
