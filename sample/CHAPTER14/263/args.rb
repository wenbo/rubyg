# lambda�ϸ�̩�ʰ��������å�
f = lambda {|x,y| y}
f[1] rescue $!  # => #<ArgumentError: wrong number of arguments (1 for 2)>
# Proc.new�ϰ���������å����ʤ�
f = Proc.new {|x,y| y}
f[1] rescue $!  # => nil
