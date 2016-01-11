str = "string"
hash = {str => :ok}
hash["string"]                     # => :ok
# ���ԡ���freeze���ƥ����ˤ��Ƥ��뤳�Ȥ��狼�롣
hash.keys.first.frozen?            # => true
hash.keys.first.equal? str         # => false
# ���Υ�����񤭴����Ƥ�����ס�
str.upcase!; str                   # => "STRING"
hash                               # => {"string"=>:ok}
hash["string"]                     # => :ok
# �������Τ�Τ�񤭴����褦�Ȥ���ȥ��顼�ˤʤäƤ���롣
hash.keys.first.upcase! rescue $!  # => #<RuntimeError: can't modify frozen string>
