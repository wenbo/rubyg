require 'cgi'
# 投稿者名を表示するHTML片の例
# 名前をボールド体で表示するHTML片を返す関数。
def name_html(name)  "<b>Name: #{CGI.escapeHTML(name)}</b>" end
# HTMLにとって特別な文字はエスケープされる。
name_html "るびきち"    # => "<b>Name: るびきち</b>"
name_html "Tom & Mary"  # => "<b>Name: Tom &amp; Mary</b>"

# 掲示板の書き込み内容の例
body = '<u>line</u> <b>bold</b> <img src="foo.jpg" alt="image">'
# HTMLタグを一切許さない場合。
CGI.escapeHTML(body)
# => "&lt;u&gt;line&lt;/u&gt; &lt;b&gt;bold&lt;/b&gt; &lt;img src=&quot;foo.jpg&quot; alt=&quot;image&quot;&gt;"
# U要素とB要素を許さない場合。
CGI.escapeElement(body, "u", "b")
# => "&lt;u&gt;line&lt;/u&gt; &lt;b&gt;bold&lt;/b&gt; <img src=\"foo.jpg\" alt=\"image\">"
# U要素とB要素のみを許す場合。
CGI.unescapeElement(CGI.escapeHTML(body), "u", "b")
# => "<u>line</u> <b>bold</b> &lt;img src=&quot;foo.jpg&quot; alt=&quot;image&quot;&gt;"

# HTMLを解析する例
html = "<b>Name: Tom &amp; Mary</b>"
# HTMLを正規表現にマッチさせてもHTMLエスケープされたままなので、
html[ %r!<b>Name: (.+?)</b>!, 1]                    # => "Tom &amp; Mary"
# HTMLアンエスケープする。
CGI.unescapeHTML(html[ %r!<b>Name: (.+?)</b>!, 1])  # => "Tom & Mary"
