# 0�ʾ�1̤���ε�����������롣
rand                                # => 0.10891217731558
rand                                # => 0.0095903069166311
rand                                # => 0.315119863253873
# 0��9�ε��������10�ĺ������롣
Array.new(10) { rand 10 }           # => [2, 0, 7, 5, 5, 6, 4, 0, 7, 8]
# 1��6�ε��������10�ĺ������롣���������Υ��ߥ�졼�����
Array.new(10) { rand(6)+1 }         # => [3, 5, 3, 6, 3, 4, 3, 6, 2, 5]
