# 3���Ǥ�Ʊ�쥪�֥������Ȥ���������Ǥ��˲�Ū�᥽�åɤ�Ŭ�Ѥ���ȡ������Ǥ��ѹ�����Ƥ��ޤ���
ary = Array.new(3, "a")         # => ["a", "a", "a"]
ary[0].replace "A"
ary                             # => ["A", "A", "A"]
# ������ɤ�����ˤϡ����֥������Ȥ��ѹ��ԲĤˤ��롣
ary = Array.new(3, "a".freeze)  # => ["a", "a", "a"]
ary[0].frozen?                  # => true
# �ѹ����褦�Ȥ������㳰��ȯ������Τǡ��տޤ��ʤ��񤭴�������ץ������롣Ruby 1.8�Ǥ�TypeError��Ruby 1.9�Ǥ�RuntimeError�Ȥʤ롣
ary[0].replace "A" rescue $!    # => #<RuntimeError: can't modify frozen string>
