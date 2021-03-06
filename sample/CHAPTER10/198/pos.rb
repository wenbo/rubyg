# ファイルを読み書きモードで開く。
open("sample.txt", "w+") do |f|
  f.print "0123456789"
# ファイルポインタを末尾から1つ前（9）に移動する。
  f.seek(-1, IO::SEEK_END)
  f.pos       # => 9
# ファイルポインタを先頭から5つ先（5）に移動する。
  f.pos = 5
# 1文字読んだのでファイルポインタがひとつ進む。
  f.read(1)   # => "5"
  f.pos       # => 6
# ファイルポインタを現在位置（6）から3つ前に移動する。
  f.pos -= 3
# 先頭から4バイト目の文字をXに書き換える。
  f.print "X"
# ファイルポインタを先頭（0）まで巻戻す。
  f.rewind
  f.pos       # => 0
# 確かに書き変わっている。
  f.read      # => "012X456789"
end
