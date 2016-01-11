require 'rubygems'
# hpricot�饤�֥���Hpricot���������Ƥ���Τ��ɤ߹���
require 'hpricot'

# �����оݤ�HTML��
html = <<'EOF'
<html>
<head><title>Sample</title></head><body>
<div id="content">&lt;Hpricot&gt;</div>
<div class="b" id="footer"><b>footer</b></div>
</body></html>
EOF

# HTML����Ϥ��ơ�Hpricot::Doc���֥������Ȥ�������롣
h = Hpricot(html)
# ��/�פϳ�������ĥ꡼�򤹤٤�ȴ���Ф���
# DIV���ǤΥĥ꡼�򤹤٤�ȴ���Ф���
divs = h/:div
# => #<Hpricot::Elements[{elem <div id="content"> "&lt;Hpricot&gt;" </div>},
#      {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}]>
# Hpricot::Elements������Υ��֥��饹��
divs.class.ancestors[0,2]   # => [Hpricot::Elements, Array]
divs.length                 # => 2
# �ǽ��DIV���ǤΥĥ꡼�����롣
div1 = divs.first           # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# DIV���Ǥ�ID°�����ͤ����롣
div1[:id]                   # => "content"
div1["id"]                  # => "content"
# DIV���Ǥ����Ƥ�HTML�Ҥ򤽤Τޤ����롣
div1.inner_html             # => "&lt;Hpricot&gt;"
# DIV���Ǥ����Ƥ�ƥ����Ȥ����롣HTML���󥨥������פ��졢HTML�����Ͻ���줿ʸ�����֤롣
div1.inner_text             # => "<Hpricot>"
# DIV���Ǥ�ޤ��HTML�Ҥ����롣
div1.to_html                # => "<div id=\"content\">&lt;Hpricot&gt;</div>"
# ���٤Ƥ�DIV���Ǥ�ID°�����ͤ����롣
divs.map {|div| div[:id] }  # => ["content", "footer"]

# ��at�פϺǽ�Υĥ꡼��ȴ���Ф���
# �ǽ��DIV���ǤΥĥ꡼�����롣
h.at :div                   # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# id=content�ʺǽ��DIV���ǤΥĥ꡼�����롣
h.at "div#content"          # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# �ǽ��DIV���Ǥ�ID°�����ͤ����롣
h.at("div")[:id]            # => "content"
# B���ǤΥĥ꡼�����롣�����ͥ��Ȥ��Ƥ��Ƥ�����ס�
h.at :b                     # => {elem <b> "footer" </b>}
# �����ȥ��ƥ����Ȥ����롣
h.at(:title).inner_text     # => "Sample"
# class=b�ʺǽ��DIV���ǤΥĥ꡼�����롣
h.at "div.b" # => {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}
# class=b�ʺǽ��Ǥ�դ����ǤΥĥ꡼�����롣
h.at ".b"    # => {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}
# id=content�ʺǽ��Ǥ�դ����ǤΥĥ꡼�����롣
h.at "#content"              # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}
# BODY���Ǥλ�¹�κǽ��B���ǤΥĥ꡼�������XPath�ˡ�
h.at "body//b"               # => {elem <b> "footer" </b>}
# id=content�ʺǽ��DIV���ǤΥĥ꡼�������XPath�ˡ�
h.at "//div[@id='content']"  # => {elem <div id="content"> "&lt;Hpricot&gt;" </div>}

# ����������HTML���ѹ����Ǥ��롣
div2 = h.at("div#footer")
# => {elem <div class="b" id="footer"> {elem <b> "footer" </b>} </div>}
# class��c���ѹ����롣
div2["class"] = "c"
# DIV���Ǥ����Ƥ�test���ѹ����롣
div2.inner_html = "test"
# �Τ��˽��Ѥ�äƤ��롣
div2             # => {elem <div class="c" id="footer"> "test" </div>}
puts h
# >> <html>
# >> <head><title>Sample</title></head><body>
# >> <div id="content">&lt;Hpricot&gt;</div>
# >> <div class="c" id="footer">test</div>
# >> </body></html>
