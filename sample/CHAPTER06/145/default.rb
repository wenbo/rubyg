# ��Hash.new�פΰ����ǥǥե�����ͤ����ꤹ�롣
h1 = Hash.new(0)
# �ǥե�����ͤ��ͤ����ꤵ��Ƥ��ʤ����˻Ȥ��롣
h1[:not_exist]  # => 0
# ((:Hash#default:))��((:Hash#default=:))�ǥǥե�����ͤ򻲾ȡ������Ǥ��롣
h1.default      # => 0
h1.default = 1  # => 1
h1[:not_exist]  # => 1

# �ǥե�����ͤ�freeze���뤳�Ȥ��˲�Ū�᥽�åɤ����롣Ruby 1.8�Ǥ�TypeError����Ruby 1.9�Ǥ�RuntimeError��ȯ�����롣
h2 = Hash.new("default".freeze)
h2[:not_exist]  # => "default"
h2[:not_exist].upcase! rescue $!  # => #<RuntimeError: can't modify frozen string>

# �ǥե�����ͤ�֥�å��ǻ��ꤹ�뤳�Ȥ��Ǥ��롣
h3 = Hash.new {|h,k| h[k] = "default" }
# �ͤ����ꤵ��Ƥ��ʤ��Τǥ֥�å���ɾ������롣
h3[:not_exist]  # => "default"
h3  # => {:not_exist=>"default"}
# �֥�å���Ȥ����˲�Ū�᥽�åɤˤ��б��Ǥ��롣
h3[:not_exist2].upcase!
h3  # => {:not_exist=>"default", :not_exist2=>"DEFAULT"}
h3[:not_exist3]  # => "default"
h3  # => {:not_exist=>"default", :not_exist2=>"DEFAULT", :not_exist3=>"default"}
