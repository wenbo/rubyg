class String
# String#external_filterを定義する。progは実行するコマンド。
  def external_filter(prog)
# 読み書き両用モードでパイプを作成する。
    IO.popen(prog, "wb+") do |pipe|
# progの標準入力に書き込む。
      pipe.write self
# 入力が終了したらすぐに閉じる。これは書き込み終了を知らせるために必須。
      pipe.close_write
# progの標準出力を読む。
      pipe.read
    end
  end
end
# 文字列をフィルターで加工する。両者は等価。
"hoge".external_filter("ruby -e 'puts ARGF.read.upcase'")  # => "HOGE\n"
`echo hoge | ruby -e 'puts ARGF.read.upcase'`              # => "HOGE\n"
