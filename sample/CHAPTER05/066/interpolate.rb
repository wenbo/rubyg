lv  = "HTTP"
@iv = 1
@@cv = :symbol
$gv = Time.now
# to_s特異メソッドを定義しているオブジェクト。
CONST = Object.new
def CONST.to_s() "CONSTANT!!" end

# lvの値を埋め込む。
"lv's value is #{lv}"                # => "lv's value is HTTP"
# 一応文字列結合でも表現できるが、式展開の方が圧倒的にわかりやすい。
@iv.to_s + " + " + @iv.to_s + " = " + (@iv+@iv).to_s   # => "1 + 1 = 2"
# インスタンス変数、クラス変数、グローバル変数は「{}」を省略できる。文字列以外は「to_s」メソッドで文字列化して埋め込む。
"#@iv + #@iv = #{@iv + @iv}"         # => "1 + 1 = 2"
"#@@cv is like string"               # => "symbol is like string"
%<Current time: #$gv>                # => "Current time: 2008-11-02 06:24:11 +0900"
# 極端な話、to_sメソッドは特異メソッドでも構わない。
%Q!Object is stringified: #{CONST}!  # => "Object is stringified: CONSTANT!!"
# 「#{}」の中身は任意のRubyの式が埋め込めるので、クォートが含まれていても構わない。
"nesting quote: #{"hoge"}"           # => "nesting quote: hoge"
# ダブルクォート文字列の中で式展開を無効にするには「\#{}」のようにエスケープする。
puts "disable interpolation: \#{1+1}"
# >> disable interpolation: #{1+1}
