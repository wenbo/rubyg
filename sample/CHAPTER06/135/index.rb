# index 0 1 2 3 4 5
nums = [7,5,9,8,9,1]
# �����ͤȺǾ��ͤ���롣
max = nums.max   # => 9
min = nums.min   # => 1
# ������9��2�սꤢ�뤬��Array#index�Ϻǽ�Υ���ǥå�����Array#rindex�ϺǸ�Υ���ǥå�������롣
nums.index max   # => 2
nums.rindex max  # => 4
# �Ǿ���1��1�սꤷ���ʤ��Τǡ�ξ�Ԥ�Ʊ���ͤˤʤ롣
nums.index min   # => 5
nums.rindex min  # => 5
# nums��¸�ߤ��ʤ����֥������Ȥ���ꤷ������nil�ˤʤ롣
nums.index 9999  # => nil
