# ���Ƥ�2�ʾ�Ǥ��뤫�ɤ�����
[1,2,3].all?{|x| x >= 2}    # => false
[2,3,4].all?{|x| x >= 2}    # => true
# �ɤ줫��4�ʾ�Ǥ��뤫�ɤ�����
[1,2,3].any?{|x| x >= 4}    # => false
[2,3,4].any?{|x| x >= 4}    # => true
# �֥�å��ʤ���Enumerable#all?�פ�&�ΰ��̲���
[true, true, true].all?     # => true
[true, false, true].all?    # => false
# �֥�å��ʤ���Enumerable#any?�פ�|�ΰ��̲���
[false, true, true].any?    # => true
[false, false, false].any?  # => false
# �֥�å�ɾ������������ȡ���̤����ꤷ�������Ƿ�̤��֤��Ƥ��뤳�Ȥ��狼�롣
eval_count = 0              # �֥�å�ɾ�����
[10,1,2].any?{|x| eval_count +=1; x >= 4}  # => true
eval_count                                 # => 1
