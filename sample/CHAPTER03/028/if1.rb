# �̾�ξ��ʬ����
if 6 % 4 == 0
  s = "6��4���ܿ�"
elsif 6 % 2 == 0
  s = "6�϶���"
else
  s = "6�ϴ��"
end
s    # => "6�϶���"
# ���ʬ�������ͤ���ġ�
v1 = if 6 % 4 == 0
       "6��4���ܿ�"
     elsif 6 % 2 == 0
       "6�϶���"
     else
       "6�ϴ��"
     end
v1   # => "6�϶���"
# 1�Ԥǽ񤯤Ȥ���then��ɬ�ס�
if true then 1 else 2 end  # => 1