#!/usr/local/bin/ruby -Ke
RUBY_VERSION                    # => "1.8.7"
File.read "euc.txt"             # => "���ܸ�\n�ˤۤ�\n"
open("euc.txt") {|f| f.read 4 } # => "����"
File.read "euc.txt", 4          # => "����"
# IO.read�Τդ��Ĥ��optional�������ɤ߹��४�ե��å�
File.read "euc.txt", 4, 7       # => "�ˤ�"
