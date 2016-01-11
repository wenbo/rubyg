# -*- coding: shift_jis -*-
require 'kconv'
# Shift_JISの文字列をファイルに書き込み、そのファイルの実際の文字コードを返す関数
def write_test(mode)
  file = "output"
# 文字列リテラルはShift_JIS。
  open(file, mode) {|f| f.puts "日本語ですよ。" }
# このFile.readではエンコーディング変換されない。ファイルの文字コードを推測する。
  Kconv.guess(File.read(file))
ensure
  File.unlink file
end

# ロケールエンコーディング＝default_externalはEUC-JP。
Encoding.default_external        # => #<Encoding:EUC-JP>
Encoding.find("locale")          # => #<Encoding:EUC-JP>
# 外部エンコーディングを指定しないと、変換されずに書き込まれる。
write_test "w+"                  # => #<Encoding:Shift_JIS>
# 外部エンコーディングを明示するとエンコーディング変換される。
write_test "w+:Shift_JIS"        # => #<Encoding:Shift_JIS>
write_test "w+:UTF-8"            # => #<Encoding:UTF-8>
# 内部エンコーディングは無視される。
write_test "w+:UTF-8:Shift_JIS"  # => #<Encoding:UTF-8>
write_test "w+:UTF-8:EUC-JP"     # => #<Encoding:UTF-8>

