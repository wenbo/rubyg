#!/usr/local/bin/ruby
# ��ñ�̤ǽ������롣
ARGF.each_line do |line|
# ������Υե�����̾��
  filename = ARGF.filename
# ������Υե�����ι��ֹ档
  lineno = ARGF.file.lineno
  puts "#{filename}:#{lineno}:#{line}"
end
