ary = []
# ��push�פȡ�pop�פ��б����Ƥ��롣����������˺��Ѥ��롣
ary.push(1,2,3)                      # => [1, 2, 3]
ary.pop                              # => 3
ary                                  # => [1, 2]
ary.pop 2                            # => [1, 2]
ary                                  # => []
# ���������Ǥ��ʤ��ʤä�����nil���֤���
ary.pop                              # => nil

ary = []
# ��unshift�פȡ�shift�פ��б����Ƥ��롣�������Ƭ�˺��Ѥ��롣
ary.unshift(1).unshift(2).unshift(3) # => [3, 2, 1]
ary.shift                            # => 3
ary                                  # => [2, 1]
ary.shift 2                          # => [2, 1]
ary                                  # => []
# ���������Ǥ��ʤ��ʤä�����nil���֤���
ary.shift                            # => nil
