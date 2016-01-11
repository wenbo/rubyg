# rexml/document�饤�֥���REXML::Parsers���������Ƥ���Τ��ɤ߹���
require 'rexml/document'
# rexml/streamlistener�饤�֥���REXML::Parsers::StreamParser���������Ƥ���Τ��ɤ߹��ࡣ
require 'rexml/streamlistener'
class TitleListener
# �ꥹ�ʤ�ɬ�פʥ᥽�åɤ���������롣
  include REXML::StreamListener
  def initialize() @stack = [] end
  TAGS = %w[chapter section subsection title]
# ���ϥ������褿�Ȥ��˵�ư�����᥽�åɡ���̣�Τ��륿���ξ�祹���å�������롣
  def tag_start(name, attrs)  @stack.push name if TAGS.include? name      end
# ��λ�������褿�Ȥ��˵�ư�����᥽�åɡ���̣�Τ��륿���ξ�祹���å�����Ф���
  def tag_end(name)           @stack.pop if TAGS.include? name            end
# �ƥ����Ȥ��褿�Ȥ��˵�ư�����᥽�åɡ�title���Ǥ���Ȥξ��Τ߽������롣
  def text(content)      title_handler(content) if @stack.last == 'title' end
  def title_handler(content)
# �����å���Ĺ���˱����ƥ���ǥ�Ȥ���롣
    indent = " " * (@stack.length - 2) * 2
    puts "#{indent}#{content}"
  end
end
# �ꥹ�ʤ��������File�ȤȤ��REXML::Parsers::StreamParser���Ϥ������Ϥ��롣
listener = TitleListener.new
open("sample.xml"){|xml| REXML::Parsers::StreamParser.new(xml, listener).parse }
# >> Ruby Programming
# >>   Introduction
# >>   Syntax
# >>     Literal
# >>     Operator & Precedence
# >>   Metaprogramming
