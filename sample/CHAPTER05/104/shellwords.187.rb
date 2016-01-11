require 'shellwords'
# ���ڡ����ϥ�����Υ᥿ʸ���򥨥������פ��롣
"argument with (space)".shellescape # => "argument\\ with\\ \\(space\\)"
cmd = %q!ruby -e 'puts "fuga"'!
# ñ��ʬ�䤹�롣
args = cmd.shellsplit               # => ["ruby", "-e", "puts \"fuga\""]
# �����뤬���Ǥ���褦��ñ���Ĥʤ��롣���ڡ����ϥ��������פ���롣������β��Ǥ�cmd��������
args.shelljoin                      # => "ruby -e puts\\ \\\"fuga\\\""
# Kernel#open�Ȥ�ʻ���㡣
open("|" << ["echo", "foo bar"].shelljoin) do |io|
  io.read                           # => "foo bar\n"
end
# Kernel#system����������޲𤹤�Ȥ������ޥ�ɥ饤������������Array#shelljoin��Ÿ�����롣
system "#{args.shelljoin}; #{args.shelljoin}"
# >> fuga
# >> fuga
