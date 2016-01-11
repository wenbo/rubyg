# 出力メソッドを使うには書き込み用にファイルを開く必要がある。
open("output.txt", "w") do |f|
# writeはひとつしか引数を持てない。
  f.write "write: "
  f.write 123
  f.write "\n"
# printは複数個の引数を持てて、そのまま連結して出力する。
  f.print "print: ", 456, "\n"
# putsはそれぞれの引数を表示した後に改行を入れる。
  f.puts "<puts>", 789, "</puts>"
# putsに引数をつけないと空行を入れる。
  f.puts
# <<はselfを返すため、連結できる。
  f << "<<: " << 0 << "\n"
# printfは書式付き出力。
  f.printf "printf: %d\n", 999
# putcで1文字の文字列か整数に対応する文字コードの文字を出力する
  f.putc "C"
  f.putc 97                     # 'a' の文字コード
  f.puts
end
# 標準出力にoutput.txtの内容を表示する。当然、Kernel#printでも構わない。
$stdout.print File.read("output.txt")
# >> write: 123
# >> print: 456
# >> <puts>
# >> 789
# >> </puts>
# >> 
# >> <<: 0
# >> printf: 999
# >> Ca
