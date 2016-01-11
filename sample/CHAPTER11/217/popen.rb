# �ѥ��פǼ¹Ԥ���Ruby������ץȡ�ɸ�����Ϥ���1�Ԥ��ɤߡ�ñ���2����Ϥ��롣���Ϥν����ϡ�^D�ס�
script = %q{
  STDOUT.sync = true
  ARGF.each_line {|l| l.chomp!; print "#{l.upcase}\n#{l.capitalize}\C-d" }
}
# �ҥץ����Ȥ���Ruby���󥿥ץ꥿��ư�����ɤ߽�ξ�ѤΥѥ��פ�������롣
IO.popen(%[ruby -e '#{script}'], "w+") do |pipe|
  DELIMITER = "\C-d"
# �ѥ��פ�ñ����������롣
  pipe.puts "word"
# DELIMITER�ޤǥѥ��פ��ɤࡣ
  answer = pipe.gets(DELIMITER)                      # => "WORD\nWord\x04"
# ������DELIMITER���롣
  answer.chomp!(DELIMITER)                           # => "WORD\nWord"
# ���ڤ�β��Ԥ�ʬ�䤹�롣
  answer.split(/\n/)                                 # => ["WORD", "Word"]
# �ʲ�Ʊ�͡�
  pipe.puts "ruby"
  pipe.gets(DELIMITER).chomp(DELIMITER).split(/\n/)  # => ["RUBY", "Ruby"]
  pipe.puts "rails"
  pipe.gets(DELIMITER).chomp(DELIMITER).split(/\n/)  # => ["RAILS", "Rails"]
  # �ѥ��פ˥ǡ������ĤäƤ��ʤ����ᡢ���λ�����pipe.gets����ȱʱ���Ԥ�³����
end
