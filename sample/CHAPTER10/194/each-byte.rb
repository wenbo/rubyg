#!/usr/local/bin/ruby -Ke
# Ruby 1.8.6�Ǥ�Integer#ord���������Ƥ��ʤ��Τ�������롣
unless 1.respond_to? :ord
  class Integer;  def ord() self end;  end
end
File.read("sample.txt")         # => "abc���ܸ�\n\n"
open("sample.txt") do |f|
# �Х��Ȥ�ɽ��������ɽ�����롣
  f.each_byte {|b| print b, " " }
  puts
# �ե�����ݥ��󥿤���Ƭ���᤹��
  f.rewind
  f.each_byte do |b|
    case b
# ʸ���Ǿ��ʬ��������b�פ��褿�Ȥ���ɾ�����롣
    when ?b.ord then puts "b�Ǥ���"
    end
  end
end
# >> 97 98 99 198 252 203 220 184 236 10 10 
# >> b�Ǥ���
