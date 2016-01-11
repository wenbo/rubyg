# Ʊ���ѿ������Ǥˤ���ȥ��֥������Ȥ϶�ͭ�����
s = "hoge"
a = [s, s]                    # => ["hoge", "hoge"]
h = {:x => s, :y => s}        # => {:x=>"hoge", :y=>"hoge"}
a[0].upcase!
s                             # => "HOGE"
a                             # => ["HOGE", "HOGE"]
h                             # => {:x=>"HOGE", :y=>"HOGE"}

# Array.new(size, value)��value����ͭ�����
a1 = Array.new(2, "hoge")     # => ["hoge", "hoge"]
a1[0].equal? a1[1]            # => true
a1[0].upcase!                 
a1                            # => ["HOGE", "HOGE"]
# �˲�Ū�᥽�åɤ��Ȥ����������ʤ�Х֥�å���Ȥ�
a2 = Array.new(2) { "hoge" }  # => ["hoge", "hoge"]
a2[0].upcase!
a2                            # => ["HOGE", "hoge"]

# �ϥå���Υǥե�����ͤ϶�ͭ�����
h1 = Hash.new("bar")
h1[:x] = "foo"
h1                            # => {:x=>"foo"}
# ���Ǥ��ʤ��Τǥǥե�����ͤ����Ȥ���롢������˲�Ū�᥽�åɤ�Ŭ�Ѥ���ȡ�
h1[:y].upcase!
h1[:z]                        # => "BAR"
# �ǥե�����ͤ��˲�Ū�᥽�åɤ�����
h2 = Hash.new{|hash,k| hash[k] = "bar" }
h2[:x] = "foo"
h2                            # => {:x=>"foo"}
h2[:y].upcase!
h2[:z]                        # => "bar"

# Array#fill(value, range)��value����ͭ�����
a1 = []
a1.fill("hoge", 0..1)
a1                            # => ["hoge", "hoge"]
a1[0].upcase!
a1                            # => ["HOGE", "HOGE"]
a2 = []
(0..1).each {|i| a2[i] = "hoge" }
a2                            # => ["hoge", "hoge"]
a2[0].upcase!
a2                            # => ["HOGE", "hoge"]
