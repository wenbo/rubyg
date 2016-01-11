# ��פ�׻������Enumerable#sum�פϤ��äƤ⤤���Ȼפ��ΤǼ�ʬ��������Ƥ�������inject {|s,x| s+x }�פϤ��ĤƤι�פΥ��ǥ����ࡣ
module Enumerable
  def sum
    self.inject{|sum,element| sum + element }
  end
end

# ��������Ǥι�פ���롣
[1,2,3,4,5].sum    # => 15
# ʸ����βû����������Ƥ���ΤǤ�������ʸ����ˤ�Ŭ�ѤǤ��뤬���̾�ϡ�Array#join�פ�Ȥ�
%w[a b c d e].sum  # => "abcde"
# �ϰ���ο��ͤι�פ���롣
(1..10).sum        # => 55
