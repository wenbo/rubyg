# ��ʸ���󡢶����󡢶��ϥå����true�ˤʤ롣
"".empty?   # => true
[].empty?   # => true
{}.empty?   # => true
# ����ʸ���Τߤ�ʸ����Ǥ϶��ȤϤߤʤ���ʤ���
" ".empty?  # => false
# nil��false�ˤ�empty?���������Ƥ��ʤ��Τǥ��顼�ˤʤ롣
nil.empty? rescue $!
# => #<NoMethodError: undefined method `empty?' for nil:NilClass>
false.empty? rescue $!
# => #<NoMethodError: undefined method `empty?' for false:FalseClass>
# ���Υ��֥������Ȥϵ��ǤϤʤ����Ǥ��롣��ա�
if "" # !> string literal in condition
  puts "��ʸ����Ͽ��Ǥ���"
else
  puts "��ʸ����ϵ��Ǥ���"
end
# >> ��ʸ����Ͽ��Ǥ���
