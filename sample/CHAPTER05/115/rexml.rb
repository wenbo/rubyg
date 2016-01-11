# rexml/documentライブラリにREXML::Documentが定義されているので読み込む
require 'rexml/document'
def c(obj) [obj.class, obj] end # 解説用メソッド

# XMLファイルを読み込んで解析する。
c(doc = open("sample.xml") {|xml| REXML::Document.new xml })
# => [REXML::Document, <UNDEFINED> ... </>]
# abstract要素の内容を得る。
c doc.elements
# => [REXML::Elements, #<REXML::Elements:0xb7c69f64 @element=<UNDEFINED> ... </>>]
c doc.elements["//abstract"]       # => [REXML::Element, <abstract> ... </>]
c doc.elements["//abstract"].text  # => [String, "How to learn Ruby"]
# ルートからdocument→chapter→sectionの1番目と要素をたどる。
c doc.elements["/document/chapter/section"]
# => [REXML::Element, <section difficulty='very low'> ... </>]
# ルートからdocument→chapter→sectionの2番目と要素をたどる。
c sect2 = doc.elements["/document/chapter/section[2]"]
# => [REXML::Element, <section difficulty='low'> ... </>]
# 属性をハッシュのサブクラスで得る。
c sect2.attributes # => [REXML::Attributes, {"difficulty"=>difficulty='low'}]
# difficulty属性の値を得る。
c sect2.attributes["difficulty"] # => [String, "low"]
c sect2.attribute("difficulty") # => [REXML::Attribute, difficulty='low']
c sect2.attribute("difficulty").to_s # => [String, "low"]
# sect2のノードからsubsection→titleの2番目と要素をたどり、内容を得る。
sect2.elements["subsection/title[2]"].text # => "Operator & Precedence"
# difficulty属性がhighなsection→titleと要素をたどり、内容を得る。
doc.elements["//section[@difficulty='high']/title"].text # => "Metaprogramming"
# ドキュメントルート。
c doc.root                   # => [REXML::Element, <document> ... </>]
chap = doc.elements["//chapter"] # => <chapter> ... </>
# chapter要素の子の各々のsection要素において処理する。
chap.elements.each("section") do |elm|
  c elm
  # => [REXML::Element, <section difficulty='very low'> ... </>]
  #    , [REXML::Element, <section difficulty='low'> ... </>]
  #    , [REXML::Element, <section difficulty='high'> ... </>]
end
# chapter要素の子の各々のsection要素のタイトルを得る。ただしmapメソッドは使えない。
chap.elements.collect("section") {|elm| elm.elements["title"].text }
# => ["Introduction", "Syntax", "Metaprogramming"]
