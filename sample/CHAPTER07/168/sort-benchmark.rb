require 'benchmark'
# �Ǹ��1��irb��ɽ������
randary = Array.new(100000){rand}; 1
# �̾�Υ�����
Benchmark.realtime{ randary.sort }               # => 0.410367012023926
# Array��ȿž�ϰ�֤ǤǤ���
Benchmark.realtime{ randary.reverse }            # => 0.00122284889221191
# ������߽祽���Ȥ�sort.reverse����®
Benchmark.realtime{ randary.sort.reverse }       # => 0.400442123413086
Benchmark.realtime{ randary.sort{|a,b| b<=>a} }  # => 2.38153600692749
Benchmark.realtime{ randary.sort_by{|a| -a} }    # => 0.59135890007019
