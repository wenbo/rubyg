lv  = "HTTP"
@iv = 1
@@cv = :symbol
$gv = Time.now
# to_s�ðۥ᥽�åɤ�������Ƥ��륪�֥������ȡ�
CONST = Object.new
def CONST.to_s() "CONSTANT!!" end

# lv���ͤ������ࡣ
"lv's value is #{lv}"                # => "lv's value is HTTP"
# ���ʸ������Ǥ�ɽ���Ǥ��뤬����Ÿ������������Ū�ˤ狼��䤹����
@iv.to_s + " + " + @iv.to_s + " = " + (@iv+@iv).to_s   # => "1 + 1 = 2"
# ���󥹥����ѿ������饹�ѿ��������Х��ѿ��ϡ�{}�פ��ά�Ǥ��롣ʸ����ʳ��ϡ�to_s�ץ᥽�åɤ�ʸ���󲽤��������ࡣ
"#@iv + #@iv = #{@iv + @iv}"         # => "1 + 1 = 2"
"#@@cv is like string"               # => "symbol is like string"
%<Current time: #$gv>                # => "Current time: 2008-11-02 06:24:11 +0900"
# ��ü���á�to_s�᥽�åɤ��ðۥ᥽�åɤǤ⹽��ʤ���
%Q!Object is stringified: #{CONST}!  # => "Object is stringified: CONSTANT!!"
# ��#{}�פ���Ȥ�Ǥ�դ�Ruby�μ����������Τǡ��������Ȥ��ޤޤ�Ƥ��Ƥ⹽��ʤ���
"nesting quote: #{"hoge"}"           # => "nesting quote: hoge"
# ���֥륯������ʸ�������Ǽ�Ÿ����̵���ˤ���ˤϡ�\#{}�פΤ褦�˥��������פ��롣
puts "disable interpolation: \#{1+1}"
# >> disable interpolation: #{1+1}
