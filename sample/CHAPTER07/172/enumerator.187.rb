ary = %w[cat echo grep ls]
# �����֤��᥽�åɤ˥֥�å���Ĥ��ʤ���Enumerator�ˤʤ롣
ary.each_with_index      # => #<Enumerator:0xb7d6f990>
# ((:Enumerable#each_with_index:))�ϥ���ǥå����Ĥ��Ƿ����֤��᥽�åɡ��ɤ���ͤǷ����֤���뤫�ϡ�to_a�ץ᥽�åɤǤ狼�롣
ary.each_with_index.to_a # => [["cat", 0], ["echo", 1], ["grep", 2], ["ls", 3]]
# each_with_index��((:Enumerable#select:))��Ŭ�Ѥ������㡣
ary.each_with_index.select{|x, i| i >= 2 and x.length >= 3 }.map(&:first) # => ["grep"]
# ((:Enumerable#each_slice:))��N�Ĥ����Ȥˤ��Ʒ����֤��᥽�åɡ�
ary.each_slice(2).to_a   # => [["cat", "echo"], ["grep", "ls"]]
# each_slice��((:Enumerable#map:))��Ŭ�Ѥ����㡣
ary.each_slice(2).map{|a,b| [a,b.upcase] } # => [["cat", "ECHO"], ["grep", "LS"]]
# ʸ�����Х�������Ѵ������㡣
"cat".each_byte.to_a                       # => [99, 97, 116]
