ary = [1, 2, 3]
hash = {:one => 1, :two => 2}
# ���󡦥ϥå���Ȥ�ˡ�length�ס���size�ץ᥽�åɤǥ���������ޤ롣
ary.length                  # => 3
ary.size                    # => 3
hash.length                 # => 2
hash.size                   # => 2
# �ͥ��Ȥ��줿����ϳ�¦�Υ������Ȥʤ롣
nested = [[1,2], [3,4,5]]
nested.length               # => 2
# ���ʤߤ˥ͥ��Ȥ��줿��Τ�ޤ������Ǥ����ˤϡ�ʿ�경��������Υ���������롣
nested.flatten              # => [1, 2, 3, 4, 5]
nested.flatten.length       # => 5
# ��¦������Υ������򤹤٤�����ˤ�((:Enumerable#map:))��ʻ�Ѥ��롣
nested.map{|ia| ia.length}  # => [2, 3]
# �����󡦶��ϥå���Υ�������0��
[].length                   # => 0
{}.length                   # => 0
