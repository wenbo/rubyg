# ��¦��a���ѹ������
a = 1
[9].each {|x| a = 2}
a  # => 2
# a�ϥ֥�å�������
a = 1
[9].each {|x;a| a = 2} # !> shadowing outer local variable - a
a  # => 1
