#!/usr/local/bin/ruby -Ke
require 'rubygems'
require 'mechanize'
require 'kconv'

agent = Mechanize.new
agent.get("http://www.google.co.jp/")
agent.page.content_type         # => "text/html; charset=Shift_JIS"
agent.page.encoding             # => "Shift_JIS"
form = agent.page.forms.first
# googleクエリはUTF-8に変換してsubmitする
form.q = "C&R研究所".toutf8
form.submit
agent.page.uri # => #<URI::HTTP:0xb789dd68 URL:http://www.google.co.jp/search?hl=ja&source=hp&ie=Shift_JIS&q=C%26R%8C%A4%8B%86%8F%8A>
# ヒット数
agent.page.body.toeuc[%r!約 ([\d,]+) 件!e, 1] # => "4,410,000"