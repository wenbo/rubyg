class Reporter
  def initialize(args)
# args��Hash���Ϥ�Τǡ��ɤ�ʥ��������ꤵ��Ƥ��뤫�Ǿ��ʬ���򤷤ơ�Ŭ�ڤʷ����Ѵ����롣ɬ�פʥ��������ꤵ��Ƥ��ʤ�����㳰ȯ����
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
# @format�˱������᥽�åɤ�ưŪ�˸ƤӽФ���
  def report()  __send__ "output_to_#{@format}"  end
  private        # �ºݤ��Ѵ������ϰʲ���private�᥽�åɤǡ������Ǥϲ�������
  def output_to_html()  "`#@content' in HTML"  end
  def output_to_xml()   "`#@content' in XML"   end
end
# ʸ�����XML���Ѵ����롣
r = Reporter.new :format => :xml, :string => "FOO"
r.report  # => "`FOO' in XML"
# IO��StringIO��read�᥽�åɤ���ĥ��֥������Ȥ�HTML���Ѵ����롣
require 'stringio'
r = Reporter.new :format => :html, :io => StringIO.new("strio")
r.report  # => "`strio' in HTML"
# ɬ�פʥ��������ꤵ��Ƥ��ʤ������㳰ȯ����
Reporter.new :format => :xml  rescue $!
# => #<ArgumentError: Reporter.new must have :filename, :io, or :string keyword.>
