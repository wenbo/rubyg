ary = ["zero", "one", "two"]
# ����κǽ�����Ǥ���Ф���first��Ȥ��롣
ary[0]                    # => "zero"
ary.fetch(0)              # => "zero"
ary.first                 # => "zero"
# ����κǸ�����Ǥ���Ф�����ο�����ꤹ��ȺǸ�����Ǥ�������롣last��Ȥ���
ary[-1]                   # => "two"
ary.fetch(-1)             # => "two"
ary.last                  # => "two"
# ����ǥå�����1�����Ǥ����롣
ary[1]                    # => "one"
ary.fetch(1)              # => "one"
# �Ǹ夫��2���ܤ����Ǥ����롣
ary[-2]                   # => "one"
ary.fetch(-2)             # => "one"
# []��¸�ߤ��ʤ�����ǥå�������ꤹ���nil���֤���
ary[999]                  # => nil
# fetch�����Ǥ��ʤ����IndexError�Ȥʤ롣
ary.fetch(999) rescue $!  # => #<IndexError: index 999 out of array>
# fetch�˥֥�å���Ĥ�������Ǥ��ʤ�����ɾ������롣
ary.fetch(999) {|i| "ary[#{i}] is not found" } # => "ary[999] is not found"

hash1 = {:zero=>0, :one=>1, :two=>2}
hash2 = {0=>"zero", 1=>"one", 2=>"two"}
# �ϥå�����ͤμ��Ф���
hash1[:zero]                   # => 0
hash1.fetch(:zero)             # => 0
# ����Ʊ��[]��¸�ߤ��ʤ���������ꤹ���nil���֤���
hash2[:three]                  # => nil
# �����ܤ�������Ѥ��ʤ������¤ϥϥå�����ͤμ��Ф���
hash2[0]                       # => "zero"
# fetch�������Ʊ�͡��������б������ͤ��ʤ����֥�å�����ꤵ��Ƥ��ʤ����Ruby 1.8�Ǥ�IndexError����Ruby 1.9�Ǥ�KeyError�㳰��ȯ�����롣
hash1.fetch(:three) rescue $!  # => #<KeyError: key not found>
hash1.fetch(:three){|key| "hash1[#{key.inspect}] is not found" }
# => "hash1[:three] is not found"
