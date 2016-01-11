# ��������
# only�Τߤ���Ф���
%w[only clearly fast].grep("only")                      # => ["only"]

# ����ɽ���ޥå�
# ly��ޤ�ʸ�������Ф���
%w[only clearly fast].grep(/ly/)                      # => ["only", "clearly"]
# �֥�å���Ĥ����ɾ����̤򽸤᤿�����֤롣���μ��������ˤʤ롣
%w[only clearly fast].grep(/ly/) {|s| s.upcase }      # => ["ONLY", "CLEARLY"]
%w[only clearly fast].grep(/ly/).map {|s| s.upcase }  # => ["ONLY", "CLEARLY"]
# �ޥå��������Ǥ�¸�ߤ��ʤ����϶������֤롣
%w[only clearly fast].grep(/hoge/)                    # => []
%w[only clearly fast].grep(/hoge/) {|s| s.upcase }    # => []
# ����Υ᥽�åɤΤ�������to_X�׷����Τ�Τ���Ф���
# Ruby 1.8����ʸ��������Ruby 1.9���ȥ���ܥ�����ˤʤ롣
Array.instance_methods.grep(/^to_.$/) # => [:to_s, :to_a]

# ���饹̾���⥸�塼��̾�ǥޥå�
# ���ͤΤߤ�ȴ���Ф���
["1.1", 3.14, 2, 99999999999999].grep(Numeric)  # => [3.14, 2, 99999999999999]
# ʸ����Τߤ�ȴ���Ф���
["1.1", 3.14, 2, 99999999999999].grep(String)   # => ["1.1"]

# �ϰϥ��֥������Ȥǥޥå�
# �ϰ���ο��Τߤ�ȴ���Ф���
[0, 1, 1.1, 2, 3].grep(1..2)    # => [1, 1.1, 2]
