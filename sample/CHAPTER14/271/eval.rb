a = 1
# ���ߤ�ʸ̮�Ǽ���ɾ�����롣
eval "a"                      # => 1
eval "a+2"                    # => 3
eval "a", binding             # => 1
# bind��ʸ̮�Ǥ�a���ͤ����롣ξ�Ԥ�������
def func1(bind)
  eval "a", bind              # => 1
  # Binding#eval��Ruby 1.8.7�ʹ�
  bind.eval "a"               # => 1
end
# �֥�å��ƤӽФ�����ʸ̮�Ǥ�a���ͤ����롣
def func2(&block)
  eval "a", block.binding     # => 1
  block.binding.eval "a"      # => 1
end
# ��binding�״ؿ��Ǹ��ߤ�ʸ̮���Ϥ����Ȥ��Ǥ��롣
func1 binding                 # => 1
# �֥�å���Binding���ݻ����Ƥ���Τ�ʸ̮��᥽�åɤ������뤳�Ȥ��Ǥ��롣
func2 {}                      # => 1
# eval�ǥ������ѿ���������Ƥ�ͭ���ˤϤʤ�ʤ���
eval "b=3"
# ���μ���Ruby 1.8�Ǥϡ�3�פˤʤ뤬��Ruby 1.9�Ǥϥ��顼�ˤʤ�
eval "b" rescue $!
# => #<NameError: undefined local variable or method `b' for main:Object>
b rescue $!
# => #<NameError: undefined local variable or method `b' for main:Object>
# ʸ���� "str" ��ʸ̮��length�᥽�åɤ�ɾ�����롣
"str".instance_eval "length"  # => 3
# Array#length�������Array#my_length�˥��ԡ����롣
Array.module_eval "alias :my_length :length"
[1,2].my_length               # => 2
