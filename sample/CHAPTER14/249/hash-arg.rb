class Reporter
  def initialize(args)
# argsはHashで渡るので、どんなキーが指定されているかで場合分けをして、適切な形に変換する。必要なキーが指定されていなければ例外発生。
    @content = if args.key? :filename
                 File.read(args[:filename])
               elsif args.key? :io
                 args[:io].read
               elsif args.key? :string
                 args[:string]
               else
                 raise ArgumentError,
                   "Reporter.new must have :filename, :io, or :string keyword."
               end
    @format = args[:format] or raise ArgumentError, "Reporter.new must have :format keyword."
  end
# @formatに応じたメソッドを動的に呼び出す。
  def report()  __send__ "output_to_#{@format}"  end
  private        # 実際の変換処理は以下のprivateメソッドで。ここでは仮実装。
  def output_to_html()  "`#@content' in HTML"  end
  def output_to_xml()   "`#@content' in XML"   end
end
# 文字列をXMLに変換する。
r = Reporter.new :format => :xml, :string => "FOO"
r.report  # => "`FOO' in XML"
# IOやStringIO等readメソッドを持つオブジェクトをHTMLに変換する。
require 'stringio'
r = Reporter.new :format => :html, :io => StringIO.new("strio")
r.report  # => "`strio' in HTML"
# 必要なキーが指定されていない場合は例外発生。
Reporter.new :format => :xml  rescue $!
# => #<ArgumentError: Reporter.new must have :filename, :io, or :string keyword.>
