power2 = {0=>1, 1=>2, 2=>4, 3=>8}
# �����Τߤ���������롣
power2.keys    # => [0, 1, 2, 3]
# �ͤΤߤ���������롣
power2.values  # => [1, 2, 4, 8]
# �������ͤΥڥ�����������롣
power2.to_a    # => [[0, 1], [1, 2], [2, 4], [3, 8]]
# Enumerable�Υ᥽�åɤ���Ѥ���ȡ�to_a���줿��Τ���������롣
power4 = power2.map{|k,v| [k, v*v]}        # => [[0, 1], [1, 4], [2, 16], [3, 64]]
# ���Ƥ��ͤ����������̤Υϥå����������ˡ�Ϥ����Ĥ����롣
Hash[*power4.flatten]                      # => {0=>1, 1=>4, 2=>16, 3=>64}
p4={}; power2.each{|k,v| p4[k]=v*v }; p4   # => {0=>1, 1=>4, 2=>16, 3=>64}
power2.inject({}){|h,(k,v)| h[k]=v*v; h }  # => {0=>1, 1=>4, 2=>16, 3=>64}
# Ruby 1.8.7�ʹ�
{}.tap{|h| power2.each{|k,v| h[k]=v*v }}   # => {0=>1, 1=>4, 2=>16, 3=>64}