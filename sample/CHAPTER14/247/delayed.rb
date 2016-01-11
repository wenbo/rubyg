# �ٱ�����������
# ̤������Υ��󥹥����ѿ���nil��
@v         # => nil # !> instance variable @v not initialized
# 2���ٱ��������롣
@v ||= 2   # => 2
@v         # => 2
# �����ͤ����ꤵ��Ƥ����硢�ٱ���������ɾ�����Ƥⲿ�ⵯ����ʤ���
@v = 3
@v ||= 2   # => 3
@v         # => 3
#3 ��������false�ϵ��ʤΤ��ٱ����������ͤ����ꤵ��Ƥ��ޤ�������ա�
@v = false
@v ||= 2   # => 2
@v         # => 2

# 1��6�Τ������������������
(1..6).select{|i| i%2 == 0}.map{|i| i*i} # => [4, 16, 36]
for i in 1..6         # for���ϥ������פ���ʤ��Τ�ary�ϳ����鸫����
# �����ΤȤ�������ary���ɲä��롣��ary ||= []�פϥ������ѿ�������ͤƤ��롣
  (ary ||= []) << i*i if i%2 == 0
end
ary   # => [4, 16, 36]
# �ٱ�������Ȥ�ʤ��Ȥ��Τ褦�ˤʤ롣
ary = []
for i in 1..6
  ary << i*i if i%2 == 0
end
ary   # => [4, 16, 36]

# ñ���Ĺ���ǥ��롼��ʬ���������Enumerable#group_by��Ruby 1.8.7�ʹߡ�
"This is a ball".split.group_by{|w| w.length}
# => {1=>["a"], 2=>["is"], 4=>["This", "ball"]}
module Enumerable
  def my_group_by__delayed
    hash_of_ary = {}    # ��ñ�Τ���inject�ϻȤ�ʤ��Ǥ���
    each do |elem|      # ��self.each�פϡ�each�פȽ񤱤�
# �֥�å���ɾ����̤򥭡��ˤ��ơ����Ǥ��ɲä��롣
      (hash_of_ary[ yield(elem) ] ||= []) << elem
    end
    hash_of_ary
  end
  def my_group_by__hash_new
# �ٱ�������Ȥ�ʤ��Ȥ��ϡ��֥�å��դ�((:Hash.new:))��Ȥ���
    hash_of_ary = Hash.new {|h,k| h[k] = []}
    each do |elem|
      hash_of_ary[ yield(elem) ] << elem
    end
    hash_of_ary
  end
end
"This is a ball".split.my_group_by__delayed{|w| w.length}
# => {1=>["a"], 2=>["is"], 4=>["This", "ball"]}
"This is a ball".split.my_group_by__hash_new{|w| w.length}
# => {1=>["a"], 2=>["is"], 4=>["This", "ball"]}
