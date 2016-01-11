ary = %w[a b]
# �����Ⱦ軻����ȷ����֤��ˤʤ롣
repeated = ary * 3         # => ["a", "b", "a", "b", "a", "b"]
# Ruby 1.8.7�ʹߤ���((:Array#cycle:))��Ȥ��롣
ary.cycle(3).to_a          # => ["a", "b", "a", "b", "a", "b"]
# ʸ����Ⱦ軻��������Ǥδ֤�ʸ�����Ϥ����ʸ�����֤롣((:Array#join:))��Ʊ����
ary * ":"                  # => "a:b"
# ���Ǥϥ��ԡ�����ʤ���
ary[0].equal? repeated[0]  # => true
ary[0].equal? repeated[2]  # => true
# �������˲�Ū�᥽�åɤ�Ŭ�Ѥ�������Ѥʤ��Ȥˤʤ롣
repeated[0].upcase!
repeated                   # => ["A", "b", "A", "b", "A", "b"]
ary                        # => ["A", "b"]
