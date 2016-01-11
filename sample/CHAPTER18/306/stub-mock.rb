require 'rubygems'
require 'test/unit'
# mocha�饤�֥���Mocha���������Ƥ���Τ��ɤ߹���
require 'mocha'
require 'open-uri'

# �ޤ��񤫤�Ƥ��ʤ�foo�ؿ��������뤳�Ȥ�twice_of_foo�ؿ��Υƥ��Ȥ����
def twice_of_foo(x)  foo(x) * 2  end
class TestTwiceOfFoo < Test::Unit::TestCase
  def test_twice_of_foo
# 7������Ȥ��ƸƤӽФ���9���֤�foo�᥽�åɤ������롣
    self.stubs(:foo).with(7).returns(9)
    assert_equal 18, twice_of_foo(7)
  end
end

# ���߻����ե����ޥåȤ���ؿ��Υƥ��Ȥ����
def format_current_time()  Time.now.strftime "%Y/%m/%d %H:%M:%S"  end
class TestTime < Test::Unit::TestCase
  def test_format_current_time
# ��1993/2/24 11:22:33�פ�Time���֥������Ȥ��֤��褦�ˡ�Time.now�פ������롣
    Time.stubs(:now).returns(Time.local(1993,2,24,11,22,33))
    assert_equal "1993/02/24 11:22:33", format_current_time
  end
end

# URL�˥�����������HTML�Υ����ȥ��ȴ���Ф��ؿ��򥪥ե饤��ǥƥ��Ȥ�����
def get_title(url)  URI(url).read[ /<title>(.+?)<\/title>/im, 1 ]  end
class TestGetTitle < Test::Unit::TestCase
  def test_get_title
    html = "<head>\n <title>Rubikitch.love?(Ruby) == true</title> \n"
    url = "http://www.rubyist.net/~rubikitch/"
# URI(url)��URI::HTTP���֥������Ȥ��֤��Τǡ������ʤ�URI::HTTP���֥������Ȥ��Ф��Ƥ�html���֤��褦�ˡ�URI::HTTP#read�פ������롣
    uri = URI::HTTP.any_instance.stubs(:read).returns(html)
    assert_equal "Rubikitch.love?(Ruby) == true", get_title(url)
  end
end
# >> Loaded suite -
# >> Started
# >> ...
# >> 
# >> Finished in 0.003735416 seconds.
# >> 
# >> 3 tests, 3 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
