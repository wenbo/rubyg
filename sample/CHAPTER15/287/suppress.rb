require 'rubygems'
require 'active_support'
# ZeroDivisionError��SyntaxError��̵�뤵���nil���֤롣
suppress(ZeroDivisionError, SyntaxError) { 1/0; :not_reached }  # => nil
# ���������㳰�ǤϤʤ������㳰��ȯ�����롣
suppress(SecurityError) { 1/0 } rescue $!  # => #<ZeroDivisionError: divided by 0>
# �㳰��ȯ�����ʤ����ϺǸ��ɾ�������ͤ��֤롣
suppress(SecurityError) { 1; 2 }           # => 2
