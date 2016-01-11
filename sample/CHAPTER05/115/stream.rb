# rexml/documentライブラリにREXML::Parsersが定義されているので読み込む
require 'rexml/document'
# rexml/streamlistenerライブラリにREXML::Parsers::StreamParserが定義されているので読み込む。
require 'rexml/streamlistener'
class TitleListener
# リスナに必要なメソッドを定義させる。
  include REXML::StreamListener
  def initialize() @stack = [] end
  TAGS = %w[chapter section subsection title]
# 開始タグが来たときに起動されるメソッド。興味のあるタグの場合スタックに入れる。
  def tag_start(name, attrs)  @stack.push name if TAGS.include? name      end
# 終了タグが来たときに起動されるメソッド。興味のあるタグの場合スタックから出す。
  def tag_end(name)           @stack.pop if TAGS.include? name            end
# テキストが来たときに起動されるメソッド。title要素の中身の場合のみ処理する。
  def text(content)      title_handler(content) if @stack.last == 'title' end
  def title_handler(content)
# スタックの長さに応じてインデントを決める。
    indent = " " * (@stack.length - 2) * 2
    puts "#{indent}#{content}"
  end
end
# リスナを作成し、FileとともにREXML::Parsers::StreamParserに渡し、解析する。
listener = TitleListener.new
open("sample.xml"){|xml| REXML::Parsers::StreamParser.new(xml, listener).parse }
# >> Ruby Programming
# >>   Introduction
# >>   Syntax
# >>     Literal
# >>     Operator & Precedence
# >>   Metaprogramming
