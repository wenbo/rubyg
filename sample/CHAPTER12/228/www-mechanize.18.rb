# 準備
require 'rubygems'
require 'mechanize'

agent = Mechanize.new
agent.set_proxy "127.0.0.1", 8339

agent.user_agent # => "WWW-Mechanize/1.0.0 (http://rubyforge.org/projects/mechanize/)"
agent.user_agent = "Ruby/Mechanize"; agent.user_agent # => "Ruby/Mechanize"
Mechanize::AGENT_ALIASES.keys # => ["Mechanize", "Linux Firefox", "Mac Mozilla", "Linux Mozilla", "Windows IE 6", "iPhone", "Linux Konqueror", "Windows IE 7", "Mac FireFox", "Mac Safari", "Windows Mozilla"]
agent.user_agent_alias = 'Windows IE 7'
agent.user_agent # => "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)"

agent.max_history = 1

# ページを開く
Mechanize::VERSION  # => "1.0.0"
page = agent.get "http://127.0.0.1:10080/form.html"
page.class               # => Mechanize::Page
page.equal? agent.page   # => true

# ページの内容を得る
page.body[0,40]          # => "<html> <head> <title>form test</title> <"
page.save "saved_form.html"

# HTTPレスポンスを得る
# 現在のURL
page.uri           # => #<URI::HTTP:0xb777736c URL:http://127.0.0.1:10080/form.html>
# タイトル
page.title         # => "form test"
# Content-Type
page.content_type  # => "text/html"
# 文字コード(指定していない場合はnil)
page.encoding      # => nil
# HTTPのリザルトコード
page.code          # => "200"
# ヘッダ
page.header
# => {"etag"=>"17a0f99-31a-48d2d392",
#     "last-modified"=>"Thu, 18 Sep 2008 22:17:54 GMT",
#     "connection"=>"close",
#     "content-type"=>"text/html",
#     "date"=>"Fri, 07 May 2010 21:34:11 GMT",
#     "server"=>"WEBrick/1.3.1 (Ruby/1.8.8/2009-06-04)",
#     "content-length"=>"794",
#     "proxy-connection"=>"close"}
page.header.class              # => Mechanize::Headers
page.header.class.superclass   # => Hash
page.header["Content-Length"]  # => "794"
page.header["last-modified"]   # => "Thu, 18 Sep 2008 22:17:54 GMT"

# ページを解析する
doc = page.root
doc.class        # => Nokogiri::HTML::Document
doc/"title"      # => <title>form test</title>
page/"title"     # => <title>form test</title>
page.at "title"  # => <title>form test</title>

# リンクをクリックする
page.links
# => [#<Mechanize::Page::Link "HomePage" "http://www.ruby-lang.org/en/">,
#     #<Mechanize::Page::Link "Manual" "http://www.ruby-lang.org/ja/man/">]
rubyhomepage = page.links.first
# => #<Mechanize::Page::Link "HomePage" "http://www.ruby-lang.org/en/">
rubyhomepage.text  # => "HomePage"
rubyhomepage.uri   # => #<URI::HTTP:0xb7761d8c URL:http://www.ruby-lang.org/en/>

# HomePageというリンク文字列のリンクをクリックする
page.link_with(:text => "HomePage")
# => #<Mechanize::Page::Link "HomePage" "http://www.ruby-lang.org/en/">
page.link_with(:text => "HomePage").click
agent.page.uri
# => #<URI::HTTP:0xb775f49c URL:http://www.ruby-lang.org/en/>
# Manというリンク文字列を含むリンクをクリックする
page.link_with(:text => /Man/)
# => #<Mechanize::Page::Link "Manual" "http://www.ruby-lang.org/ja/man/">
page.link_with(:text => /Man/).click
agent.page.uri
# => #<URI::HTTP:0xb7757e18 URL:http://www.ruby-lang.org/ja/man/>
# URLにmanを含むリンクをクリックする
page.link_with(:href => /man/)
# => #<Mechanize::Page::Link "Manual" "http://www.ruby-lang.org/ja/man/">
page.link_with(:href => /man/).click
agent.page.uri
# => #<URI::HTTP:0xb77517fc URL:http://www.ruby-lang.org/ja/man/>

# フォームに値を入力する
page.forms.class                     # => Array
form = page.forms.first              # => #<Mechanize::Form
form.equal? page.form("first")                # => true
form.equal? page.form_with(:name => "first")  # => true
form.name                            # => "first"
form.action                          # => "formtest.cgi"
form.method                          # => "POST"
form.fields.map {|f| f.name }        # => ["textform", "passwd", "selection"]
form.radiobuttons.map {|f| f.name }  # => ["radiobutton", "radiobutton"]
form.checkboxes.map {|f| f.name }    # => ["check"]

#form.fields.name("textform").value = "foo" # 長い形式
form.field_with(:name => "textform").value = "foo"
form["passwd"] = "abracadabra"
form["selection"] = ["first", "second"]
form["radiobutton"] = "production"
form.checkbox_with(:name => "check").check
form.submit

puts agent.page.body
# >> {"selection"=>["first", "second"], "radiobutton"=>["production"], "textform"=>["foo"], "check"=>["debug"], "passwd"=>["abracadabra"]}
