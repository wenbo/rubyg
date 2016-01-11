#!/usr/local/bin/ruby -Ke
require 'rubygems'
require 'mechanize'
require 'kconv'

agent = Mechanize.new
agent.get("http://www.google.co.jp/")
agent.page.content_type         # => "text/html; charset=Shift_JIS"
agent.page.encoding             # => "Shift_JIS"
form = agent.page.forms.first
# google�������UTF-8���Ѵ�����submit����
form.q = "C&R�����".toutf8
form.submit
agent.page.uri # => #<URI::HTTP:0xb789dd68 URL:http://www.google.co.jp/search?hl=ja&source=hp&ie=Shift_JIS&q=C%26R%8C%A4%8B%86%8F%8A>
# �ҥåȿ�
agent.page.body.toeuc[%r!�� ([\d,]+) ��!e, 1] # => "4,410,000"