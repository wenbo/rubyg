ary = ["a", ["b"]]
repeated = Array.new(ary.length*3){|i| ary[i%ary.length].clone}
# => ["a", ["b"], "a", ["b"], "a", ["b"]]
# �Τ��˥��ԡ�����Ƥ���
[ ary[0].object_id, repeated[0].object_id ]        # => [68546930, 68766870]
# �ͥ��Ȥ������ǤޤǤϥ��ԡ�����ʤ�
[ ary[1][0].object_id, repeated[1][0].object_id ]  # => [68546920, 68546920]
