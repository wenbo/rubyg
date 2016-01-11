require 'rubygems'
# hpricotライブラリにHpricotが定義されているので読み込む
require 'hpricot'

# 処理対象のHTML。
html = <<'EOF'
<html>
<head><title>Sample</title></head><body>
<div id="content">&lt;Hpricot&gt;</div>
<div class="b" id="footer"><b>footer</b></div>
</body></html>
EOF

# HTMLを解析して、Hpricot::Docオブジェクトを作成する。
h = Hpricot(html)
# 「/」は該当するツリーをすべて抜き出す。
# DIV要素のツリーをすべて抜き出す。
divs = h/:div
# => #<Hpricot::Elements[{elem <div id="content"> "&lt;Hpricot&gt;" </div>},
#      {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}]>
# Hpricot::Elementsは配列のサブクラス。
divs.class.ancestors[0,2]   # => [Hpricot::Elements, Array]
divs.length                 # => 2
# 最初のDIV要素のツリーを得る。
div1 = divs.first           # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# DIV要素のID属性の値を得る。
div1[:id]                   # => "content"
div1["id"]                  # => "content"
# DIV要素の内容のHTML片をそのまま得る。
div1.inner_html             # => "&lt;Hpricot&gt;"
# DIV要素の内容をテキストで得る。HTMLアンエスケープされ、HTMLタグは除去された文字列が返る。
div1.inner_text             # => "<Hpricot>"
# DIV要素も含めてHTML片を得る。
div1.to_html                # => "<div id=\"content\">&lt;Hpricot&gt;</div>"
# すべてのDIV要素のID属性の値を得る。
divs.map {|div| div[:id] }  # => ["content", "footer"]

# 「at」は最初のツリーを抜き出す。
# 最初のDIV要素のツリーを得る。
h.at :div                   # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# id=contentな最初のDIV要素のツリーを得る。
h.at "div#content"          # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# 最初のDIV要素のID属性の値を得る。
h.at("div")[:id]            # => "content"
# B要素のツリーを得る。深くネストしていても大丈夫。
h.at :b                     # => {elem <b> "footer" </b>}
# タイトルをテキストで得る。
h.at(:title).inner_text     # => "Sample"
# class=bな最初のDIV要素のツリーを得る。
h.at "div.b" # => {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}
# class=bな最初の任意の要素のツリーを得る。
h.at ".b"    # => {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}
# id=contentな最初の任意の要素のツリーを得る。
h.at "#content"              # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# BODY要素の子孫の最初のB要素のツリーを得る（XPath）。
h.at "body//b"               # => {elem <b> "footer" </b>}
# id=contentな最初のDIV要素のツリーを得る（XPath）。
h.at "//div[@id='content']"  # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}

# 代入形式でHTMLの変更ができる。
div2 = h.at("div#footer")
# => {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}
# classをcに変更する。
div2["class"] = "c"
# DIV要素の内容をtestに変更する。
div2.inner_html = "test"
# 確かに書き変わっている。
div2             # => {elem <div class="c" id="footer"> "test" </div>}
puts h
# >> <html>
# >> <head><title>Sample</title></head><body>
# >> <div id="content">&lt;Hpricot&gt;</div>
# >> <div class="c" id="footer">test</div>
# >> </body></html>
