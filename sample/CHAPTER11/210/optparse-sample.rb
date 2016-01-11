#!/usr/local/bin/ruby
# optparse�饤�֥���ARGV.options���������Ƥ���Τ��ɤ߹���
require 'optparse'
# ���ޥ�ɥ饤�������URI���Ѵ����뤿���optparse/uri�饤�֥�꤬ɬ�ס�
require 'optparse/uri'
# ���ޥ�ɥ饤�������Time���Ѵ����뤿���optparse/time�饤�֥�꤬ɬ�ס�
require 'optparse/time'
opts = {}
ARGV.options do |o|
# ���ޥ�ɤν񼰤�񤯡�$0�ϼ¹ԥ�����ץȤΥե�����̾��
  o.banner = "ruby #$0 [options] [args]"

# ���ץ����μ�����������롣
  o.separator "Ruby-like options:"
# Ruby���󥿥ץ꥿�Υ��ץ����򿿻����롣
  # ̵�������ץ�����-w�ס���--warning�ס�
  o.on("-w", "--warning", "turn warnings on for your script") {|x| opts[:warning] = x }
  # ������ɬ�ܤΥ��ץ�����-r�ס�ʣ���ġˡ�
  o.on("-r library", "require the library"){|x| (opts[:libs] ||= []) << x }
  # ������ɬ�ܤΥ��ץ�����-K�ס���--kanji�ס������򥷥�ܥ���Ѵ����롣
  o.on("-K kcode", "--kanji", "specifies KANJI code-set", "(Japanese)",
    'n'=>:none, 'e'=>:eucJP, 's'=>:Shift_JIS, 'u'=>:UTF8) {|x| opts[:kanji] = x }
  # ��������ά��ǽ�ʥ��ץ�����-T�ס�����ɽ���˥ޥå������ΤΤ߼����դ��롣
  o.on("-T [level]", /^[0-4]$/, "turn on tainting checks") {|x| opts[:taint] = (x||0).to_i }

  o.separator "Misc options:"
# ����μ����ɬ�ܰ������륪�ץ�����������롣���Ѵ�����ƥ֥�å��ѥ�᡼�����Ϥ롣
  # ��������ǤΤɤ줫������˼�륪�ץ�����--candidate�ס�
  o.on("--candidate X", %w[a b c]) {|x| opts[:candidate] = x }
  # ��ư���������ΰ������륪�ץ�����--float�ס�
  o.on("--float X", Float) {|x| opts[:float] = x }
  # ���ͤΰ������륪�ץ�����--numeric�ס�
  o.on("--numeric X", Numeric) {|x| opts[:numeric] = x }
  # �����ΰ������륪�ץ�����--integer�ס�
  o.on("--integer X", Integer) {|x| opts[:integer] = x }
  # URI�ΰ������륪�ץ�����--uri�ס�
  o.on("--uri X", URI) {|x| opts[:uri] = x }
  # ����ʸ���������˼�륪�ץ�����--time�ס�
  o.on("--time X", Time) {|x| opts[:time] = x }
  # ����ޤǶ��ڤ�줿ʸ���������˼�륪�ץ�����--array�ס�
  o.on("--array X,Y,...", Array){|x| opts[:array] = x }
  # ����ɽ��������˼�륪�ץ�����--regexp�ס�
  o.on("--regexp RE", Regexp){|x| opts[:regexp] = x }
# �ºݤ˥��ץ�����������롣ARGV���񤭴������롣
  o.parse!
end
# �������줿���ץ����ȻĤä����ޥ�ɥ饤�������ɽ�����롣
puts "opts=#{opts.inspect},  ARGV=#{ARGV.inspect}"
