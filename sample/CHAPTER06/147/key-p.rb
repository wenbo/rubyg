hash = { "one"=>1, "two"=>2 }
# ��������Ĥ������å�����ˤϡ�Hash#key?�פ���Ѥ��롣
hash.key? "one"    # => true
hash.key? "three"  # => false
# ��Hash#key?�פ�ŵ��Ū�����Ӥϡ�unless��ʻ�Ѥ����ͤ����ꤹ�롣
hash["three"]=3 unless hash.key? "three"
hash               # => {"one"=>1, "two"=>2, "three"=>3}
# Hash#key?�εդ��ͤ���Ĥ������å�����ˤϡ�Hash#value?�פ���Ѥ��롣
hash.value? 1      # => true
hash.value? 4      # => false
