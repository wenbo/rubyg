#!/usr/local/bin/ruby -Ke
# ����ʸ����ʬ�䤹�롣
" a b  c\t\r\nd ".split                   # => ["a", "b", "c", "d"]
" a b  c\t\r\nd ".split(/\s+/)            # => ["", "a", "b", "c", "d"]
# �����ʸ����ʬ�䤹�롣
"rubikitch@ruby-lang.org".split(/@/)      # => ["rubikitch", "ruby-lang.org"]
# ʸ��������Ǥ��롣
"a+b+c".split("+")                        # => ["a", "b", "c"]
# �ѥ�̾������Ǥ�ʬ�䤹�롣��������Enumerable#drop��Ruby 1.8.7�ʹߡ�
"/usr/local/bin/ruby".split("/")          # => ["", "usr", "local", "bin", "ruby"]
"/usr/local/bin/ruby".split("/")[1..-1]   # => ["usr", "local", "bin", "ruby"]
"/usr/local/bin/ruby".split("/").drop(1)  # => ["usr", "local", "bin", "ruby"]
# ʸ�����1ʸ������ʬ�䤹�륤�ǥ����ࡣ
"[̾��]".split(//)                        # => ["[", "̾", "��", "]"]
",a,b,c,,d,".split(",")                   # => ["", "a", "b", "c", "", "d"]
# ʬ����θ��٤�ؼ����롣
",a,b,c,,d,".split(",",3)                 # => ["", "a", "b,c,,d,"]
# �����ζ�ʸ�����ޤࡣ
",a,b,c,,d,".split(",",-1)                # => ["", "a", "b", "c", "", "d", ""]
# URL�Υ������ʬΥ���롣
"http://127.0.0.1/wiki?p=Foo".split("?", 2)  # => ["http://127.0.0.1/wiki", "p=Foo"]
"http://127.0.0.1/wiki".split("?", 2)        # => ["http://127.0.0.1/wiki"]
# ()�դ�����ɽ������ꤷ������()�����ʬ���̤˴ޤ�롣
"a+b-c*d".split(/([\+\-\*\/])/)  # => ["a", "+", "b", "-", "c", "*", "d"]
"a++b--".split(/([\+\-]){2}/)    # => ["a", "+", "b", "-"]
