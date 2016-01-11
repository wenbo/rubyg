require 'erubis'
template = Erubis::Eruby.new File.read("eruby.rtxt")

class Context
  attr_accessor :name, :month, :day
  # 他のいろいろなメソッド定義...
end
context = Context.new
context.name  = "るびきち"
context.month = Time.now.month
context.day   = Time.now.day
puts template.evaluate context
# >> るびきちさん。
# >> 今日は7月22日です。
