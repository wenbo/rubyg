# -*- coding: euc-jp -*-
#index ��������������
str = "�����ƥ��ȡ���"
str =~ /�ƥ���/        # => 2
str.index "�ƥ���"     # => 2
str.index "��"         # => 0
str.index "��", 4      # => 5
# ������4���ܡ����ʤ������ǥå���3���鱦�Ρ���õ����
str.index "��", -4     # => 5
str.rindex "��"        # => 6
str.rindex "��", 3     # => 1
# ������2���ܡ����ʤ������ǥå���5���麸�Ρ���õ����õ�����ϰ��֤����礦�ɡ��ˤʤäƤ��롣
str.rindex "��", -2    # => 5
str.include? "�ƥ���"  # => true
str =~ /test/          # => nil
str.index "test"       # => nil
str.include? "test"    # => false
