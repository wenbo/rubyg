# 1��10�Ǻǽ�ζ�����n%2 == 0�ˤ���롣
(1..10).find{|n| n%2 == 0 }                     # => 2
a = %w[fire thunder Ice Water]
# ��ʸ������Ϥޤ�ǽ�����Ǥ���롣��Enumerable#detect�פϡ�Enumerable#find�פ���̾��
a.detect{|s| s =~ /^[A-Z]/ }                    # => "Ice"
# ���Ǥȥ���ǥå�����Ʊ���˵��롣
require 'enumerator'
a.enum_for(:each_with_index).detect{|s,i| s =~ /^[A-Z]/ }  # => ["Ice", 2]
# a>10���������ǽ�Υڥ�����롣
pairs = [[7,"fire"], [10,"thunder"], [11, "ice"], [18, "water"]]
pairs.find{|x,y| x>10 }                         # => [11, "ice"]
