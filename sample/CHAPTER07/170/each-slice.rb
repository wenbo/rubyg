#!/usr/local/bin/ruby -Ke
# enumerator�饤�֥���Enumerator���������Ƥ���Τ��ɤ߹��ࡣRuby 1.8.7�ʹߤǤ��Ȥ߹��ߤˤʤ�Τ����ס�
require 'enumerator'
# �ܼ��ǡ����Ͼϥ����ȥ�ȥڡ��������Ȥ��¤٤롣
contents = [
  "�Ϥ����", 1,
  "Ruby�δ����μ�", 2,
  "����Ū�ʥġ���", 20,         # ����κǸ�����Ǥ��,�פǽ�������
]
# 2���Ǥ��ĥ롼�פ��롣
contents.each_slice(2) do |chapter, page|
  puts "#{chapter} p#{page}"
end
# >> �Ϥ���� p1
# >> Ruby�δ����μ� p2
# >> ����Ū�ʥġ��� p20
