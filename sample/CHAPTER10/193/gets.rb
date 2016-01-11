# �ե�����򳫤������Τ��ɤ߹��߲��ԤǶ��ڤ롣
open("sample.txt") {|f| f.readlines } # => ["���ܸ�\n", "�ˤۤ�\n"]
open("sample.txt") do |f|
# gets�ε�ư���㡣�����֤��Ȥ��ȼ��ιԤ�缡�ɤ�Ǥ�����
  f.gets                              # => "���ܸ�\n"
  f.gets                              # => "�ˤۤ�\n"
# �����ơ�EOF��ã�����nil���֤���
  f.gets                              # => nil
end
open("sample.txt") do |f|
# gets��while��ʻ�Ѥ���1�Ԥ����ɤ߹��ळ�Ȥ��Ǥ��롣���ʤߤ�puts�������˲��Ԥ�ޤ�Ǥ��Ƥ�ޤ�Ǥ��ʤ��Ƥ���Ԥ򤷤Ƥ���롣
  while line = f.gets
    puts "gets: #{line}"
  end
end
open("sample.txt") do |f|
  f.each_line do |line|
# ���λ�����line�ϲ��Ԥ�ޤ�Ǥ���Τ�chomp!�ǲ��Ԥ��������
    line.chomp!
    puts "each_line: <#{line}>"
  end
end
# �ե�����򳫤����Ҥ餬�ʤ�ޤ�ԡ�����ɽ�� /[��-��]/�ˤ���Ф���
open("sample.txt") {|f| f.grep(/[��-��]/) } # => ["�ˤۤ�\n"]
# open��IO#each_line��ʻ�礷����Ρ�
File.foreach("sample.txt") do |line|
  puts "foreach: #{line}"
end
# open��IO#readlines��ʻ�礷����Ρ�
File.readlines("sample.txt")                # => ["���ܸ�\n", "�ˤۤ�\n"]
# >> gets: ���ܸ�
# >> gets: �ˤۤ�
# >> each_line: <���ܸ�>
# >> each_line: <�ˤۤ�>
# >> foreach: ���ܸ�
# >> foreach: �ˤۤ�
