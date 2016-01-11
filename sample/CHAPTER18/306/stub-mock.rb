require 'rubygems'
require 'test/unit'
# mochaライブラリにMochaが定義されているので読み込む
require 'mocha'
require 'open-uri'

# まだ書かれていないfoo関数を偽装することでtwice_of_foo関数のテストを書く例
def twice_of_foo(x)  foo(x) * 2  end
class TestTwiceOfFoo < Test::Unit::TestCase
  def test_twice_of_foo
# 7を引数として呼び出すと9を返すfooメソッドを偽装する。
    self.stubs(:foo).with(7).returns(9)
    assert_equal 18, twice_of_foo(7)
  end
end

# 現在時刻をフォーマットする関数のテストを書く例
def format_current_time()  Time.now.strftime "%Y/%m/%d %H:%M:%S"  end
class TestTime < Test::Unit::TestCase
  def test_format_current_time
# 「1993/2/24 11:22:33」のTimeオブジェクトを返すように「Time.now」を偽装する。
    Time.stubs(:now).returns(Time.local(1993,2,24,11,22,33))
    assert_equal "1993/02/24 11:22:33", format_current_time
  end
end

# URLにアクセスしてHTMLのタイトルを抜き出す関数をオフラインでテストする例
def get_title(url)  URI(url).read[ /<title>(.+?)<\/title>/im, 1 ]  end
class TestGetTitle < Test::Unit::TestCase
  def test_get_title
    html = "<head>\n <title>Rubikitch.love?(Ruby) == true</title> \n"
    url = "http://www.rubyist.net/~rubikitch/"
# URI(url)はURI::HTTPオブジェクトを返すので、いかなるURI::HTTPオブジェクトに対してもhtmlを返すように「URI::HTTP#read」を偽装する。
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
