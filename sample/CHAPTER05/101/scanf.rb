# scanfライブラリにString#scanfが定義されているので読み込む
require 'scanf'
# 10進整数（%d）、16進整数（%x）、8進整数（%o）、接頭辞付き整数（%i）、小数（%f）を取り出す。
"1 1b 10 0x1b 010 3.1".scanf '%d %x %o %i %i %f' # => [1, 27, 8, 27, 8, 3.1]
# マッチした部分のみを返す。
"1".scanf '%d %x %i %i %f'  # => [1]
# マッチしない場合は空配列が返る。
"".scanf '%d %x %i %i %f'   # => []
# 最初の3文字と残りを分ける。
"subsection".scanf '%3s%s'  # => ["sub", "section"]
# 整数を桁ごとに区切る。
"12345".scanf '%1d%2d%d'    # => [1, 23, 45]

# 名前、年齢、誕生日、職業が順に書いているテキストデータを処理する例
text = <<'EOF'
高橋 24 10/3 Ruby プログラマー
工藤 22 11/23 デザイナー
EOF
# scanf書式文字列の設定。「%*c」はスペースを読み飛ばすため。「%[^\n]」は改行以外の文字列。
format = '%s %d %s%*c%[^\n]'
# ブロックをつけないと最初のマッチのみ返す。
text.scanf(format)  # => ["高橋", 24, "10/3", "Ruby プログラマー"]
# ブロックをつけるとすべてのマッチを処理する。
text.scanf(format) {|ary| ary }
# => [["高橋", 24, "10/3", "Ruby プログラマー"], ["工藤", 22, "11/23", "デザイナー"]]
# 構造体Profileを定義する。
Profile = Struct.new :name, :age, :birthday, :job
# テキストデータを構造体Profileの配列に変換する。
text.scanf(format) {|ary| Profile.new(*ary) }
# => [#<struct Profile name="高橋", age=24, birthday="10/3", job="Ruby プログラマー">,
#     #<struct Profile name="工藤", age=22, birthday="11/23", job="デザイナー">]
