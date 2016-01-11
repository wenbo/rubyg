# rexml/document�饤�֥���REXML::Document���������Ƥ���Τ��ɤ߹���
require 'rexml/document'
def c(obj) [obj.class, obj] end # �����ѥ᥽�å�

# XML�ե�������ɤ߹���ǲ��Ϥ��롣
c(doc = open("sample.xml") {|xml| REXML::Document.new xml })
# => [REXML::Document, <UNDEFINED> ... </>]
# abstract���Ǥ����Ƥ����롣
c doc.elements
# => [REXML::Elements, #<REXML::Elements:0xb7c69f64 @element=<UNDEFINED> ... </>>]
c doc.elements["//abstract"]       # => [REXML::Element, <abstract> ... </>]
c doc.elements["//abstract"].text  # => [String, "How to learn Ruby"]
# �롼�Ȥ���document��chapter��section��1���ܤ����Ǥ򤿤ɤ롣
c doc.elements["/document/chapter/section"]
# => [REXML::Element, <section difficulty='very low'> ... </>]
# �롼�Ȥ���document��chapter��section��2���ܤ����Ǥ򤿤ɤ롣
c sect2 = doc.elements["/document/chapter/section[2]"]
# => [REXML::Element, <section difficulty='low'> ... </>]
# °����ϥå���Υ��֥��饹�����롣
c sect2.attributes # => [REXML::Attributes, {"difficulty"=>difficulty='low'}]
# difficulty°�����ͤ����롣
c sect2.attributes["difficulty"] # => [String, "low"]
c sect2.attribute("difficulty") # => [REXML::Attribute, difficulty='low']
c sect2.attribute("difficulty").to_s # => [String, "low"]
# sect2�ΥΡ��ɤ���subsection��title��2���ܤ����Ǥ򤿤ɤꡢ���Ƥ����롣
sect2.elements["subsection/title[2]"].text # => "Operator & Precedence"
# difficulty°����high��section��title�����Ǥ򤿤ɤꡢ���Ƥ����롣
doc.elements["//section[@difficulty='high']/title"].text # => "Metaprogramming"
# �ɥ�����ȥ롼�ȡ�
c doc.root                   # => [REXML::Element, <document> ... </>]
chap = doc.elements["//chapter"] # => <chapter> ... </>
# chapter���ǤλҤγơ���section���Ǥˤ����ƽ������롣
chap.elements.each("section") do |elm|
  c elm
  # => [REXML::Element, <section difficulty='very low'> ... </>]
  #    , [REXML::Element, <section difficulty='low'> ... </>]
  #    , [REXML::Element, <section difficulty='high'> ... </>]
end
# chapter���ǤλҤγơ���section���ǤΥ����ȥ�����롣������map�᥽�åɤϻȤ��ʤ���
chap.elements.collect("section") {|elm| elm.elements["title"].text }
# => ["Introduction", "Syntax", "Metaprogramming"]
