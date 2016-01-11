# Ruby 1.9（つまりIO#set_encodingが定義されている）ならば、
if $stdout.respond_to? :set_encoding
# 標準出力の外部エンコーディングをロケールエンコーディングにする。
  $stdout.set_encoding "locale"
# Ruby 1.8ならば、
else
# nkfライブラリにNKF.nkfが定義されているので読み込む
  require 'nkf'
# OUTPUT_KCODEはNKFの出力する文字コード指定。mswin環境ならばShift_JISにする。
  if RUBY_PLATFORM =~ /mswin/
    OUTPUT_KCODE = 's'
# 環境変数LANG（ja_JP.eucJPなどと指定されている）から文字コードを読み取る。
  elsif ENV['LANG'].to_s =~ /ja_JP\.(.)/
    k = $1.downcase
# NKFでUTF-8に変換するのは「u」ではなくて「w」。
    OUTPUT_KCODE = k == 'u' ? 'w' : k
  else
# 非mswin環境で環境変数LANGが設定されていないとエラーにする。
    raise "Set environment variable LANG."
  end
# $stdoutの特異メソッドを定義することで出力関数の挙動を変更できる。
  def $stdout.write(str)
# $KCODEの情報からNKFの入力文字コードを指定する。
    k = $KCODE[0,1].upcase
    kcode = k == 'U' ? 'W' : k
# NKFで文字コード変換した文字列でIO#writeを呼ぶ。
    super NKF.nkf("-#{kcode}#{OUTPUT_KCODE}", str)
  end
end
