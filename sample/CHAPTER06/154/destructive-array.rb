ary = [1]
hash = {ary => :ok}
hash[[1]]                   # => :ok
# �����ϥ��ԡ�����ʤ���
hash.keys.first.equal? ary  # => true
# ������񤭴�����ȥϥå����ͤ������Τ��ͤ���Ф��ʤ��ʤ롪
ary[0] = 2; ary             # => [2]
hash                        # => {[2]=>:ok}
hash[ary]                   # => nil
hash[[2]]                   # => nil
