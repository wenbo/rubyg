ary = [12,24,83,61]
# ��Enumerable#min�פǺǾ��ͤ���롣
ary.min                        # => 12
# ��Enumerable#max�פǺ����ͤ���롣
ary.max                        # => 83
# 1�ΰ̤κǾ��ˤʤ������롣
ary.min{|a,b| a%10 <=> b%10 }  # => 61
# Ruby 1.8.7�ʹߤǤϡ�Enumerable#minmax�פǺǾ��͡������ͤ�Ʊ���˵����롣
ary.minmax                     # => [12, 83]
# Ruby 1.8.7�ʹߤǤϡ�Enumerable#min_by�ס���Enumerable#max_by�ס���Enumerable#minmax_by�פ��Ȥ��롣1�ΰ̡�n%10�ˤκǾ��͡������ͤ���롣
ary.min_by{|n| n%10 }          # => 61
ary.max_by{|n| n%10 }          # => 24
ary.minmax_by{|n| n%10 }       # => [61, 24]
