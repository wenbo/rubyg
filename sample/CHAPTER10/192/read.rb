#!/usr/local/bin/ruby -Ke
# �ե����뤫�����Τ��ɤ߹��ࡣ
open("euc.txt") {|f| f.read }       # => "���ܸ�\n�ˤۤ�\n"
# �ե����뤫�����Τ��ɤ߹��ߡ��Ԥ��Ȥ�ʬ�䤹�롣
open("euc.txt") {|f| f.readlines }  # => ["���ܸ�\n", "�ˤۤ�\n"]
# ������û�̷���
File.read("euc.txt")                # => "���ܸ�\n�ˤۤ�\n"
File.readlines("euc.txt")           # => ["���ܸ�\n", "�ˤۤ�\n"]
