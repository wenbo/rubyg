# 0�ǽ�������줿2x2�ε����󼡸�����
Array.new(2){ Array.new(2,0) }       # => [[0, 0], [0, 0]]
# ʸ����"string"�ǽ�������줿2x2�ε����󼡸�����ʸ����ˤ��˲�Ū�᥽�åɤ�����Τǥ֥��å��ǽ���ͤ����ꤷ�Ƥ��롣
Array.new(2){ Array.new(2){"str"} }  # => [["str", "str"], ["str", "str"]]
# 4x3�ε����󼡸���������󼰤Ǻ������롣����¿��������ϥͥ��Ȥ�������˲᤮�ʤ���
table = [[ 1, 2, 3],
         [ 4, 5, 6],
         [ 7, 8, 9],
         [10,11,12]]
# 0��0��ʺ���ˤ����ǡ�
table[0][0]              # => 1
# 1��1������ǡ�
table[1][1]              # => 5
# 3��2��ʱ����ˤ����ǡ�
table[3][2]              # => 12
# ����¿��������μ��������졣0��999������Ǥ�999��0������Ǥ�¸�ߤ��ʤ������㳰ȯ������Τ���ԤΤߡ������ա�
table[0][999]            # => nil
table[999][0] rescue $!  # => #<NoMethodError: undefined method `[]' for nil:NilClass>
# �ͥ��Ȥ��������ʿ�경�ˡ�
table.flatten            # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
# ���Ǥ�1�Ĥ��Ľ�������ˤ���ť롼�פ���Ѥ��롣��each_with_index�פʤ��i��j��ȥ���ǥå����˥��������Ǥ��롣�����Ǥ���ť롼�פ���ǿ����������elements�פˡ�table�פ����Ǥ��ɲä��Ƥ��롣
elements = []
table.each_with_index do |line, i|
  line.each_with_index {|element, j| elements << element}
end
elements          # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
# �Ĳ��ι�פ�׻�����Τǡ�Array#sum�פ�������롣
class Array; def sum() inject{|s,x| s+x } end; end
# ���줾��ιԤι��
line_sums   = table.map{|line| line.sum }          # => [6, 15, 24, 33]
# ���줾�����ι�פ�׻�����ˤ�Array#transpose��ž�֤��Ƥ���Ԥι�פ���롣
column_sums = table.transpose.map{|col| col.sum }  # => [22, 26, 30]
# �Ĳ��׻��򤹤�櫓�ǤϤʤ���Υ���ǡ����򰷤��ˤ�����򥭡��ˤ����ϥå����Ȥ���
hash = { [0,0]=>1 }
hash[[3,2]] = 12
hash         # => {[0, 0]=>1, [3, 2]=>12}
hash[[3,2]]  # => 12