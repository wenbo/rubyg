errmsg = "Error: out of memory"
# ��\A�פ�ʸ�������Ƭ���̣����᥿ʸ����
errmsg =~ /\AWarning/                   # => nil
errmsg =~ /\AError/                     # => 0
# �ä˳���ʸ����������ξ���Regexp.union�ȼ�Ÿ�����Ȥ߹�碌������ɽ�����������ɬ�פ����롣
errmsg =~ /\A#{Regexp.union("Error")}/  # => 0
# ��\z�פ�ʸ����ν�ü���̣����᥿ʸ����
errmsg =~ /memory\z/                    # => 14
errmsg.match(/memory\z/)                # => #<MatchData "memory">
errmsg.match(/found\z/)                 # => nil
