require 'rubygems'
require 'active_support'

"".blank?            # => true
# ����ʸ������ʤ�ʸ����϶���Ȥߤʤ���롣
" \t\r\n".blank?     # => true
# �����ʸ�����ޤޤ�Ƥ��������ǤϤʤ���
" \t\r a \n".blank?  # => false
nil.blank?           # => true
false.blank?         # => true
true.blank?          # => false
[].blank?            # => true
{}.blank?            # => true
# 0�϶���ǤϤʤ��Τ���ա�
0.blank?             # => false
Object.new.blank?    # => false
