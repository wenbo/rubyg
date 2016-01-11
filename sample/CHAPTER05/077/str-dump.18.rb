#!/usr/local/bin/ruby -Ke
# String#dumpとString#inspectの結果を表示する関数。
def test(str) printf("dump=%s inspect=%s\n", str.dump, str.inspect) end
# 「eval(string.dump) == string」が成立する。
eval("code\n".dump) == "code\n"             # => true
eval("こんにちは".dump) == "こんにちは"     # => true
# 非表示文字がない場合は文字列の両端に「"」が付くだけ。
test "dumped"
# ベル文字とタブ文字がバックスラッシュ記法になる。
test "bell and tab " << 7 << 9
# $KCODEが正しく設定されていれば、String#inspectは日本語文字列をバックスラッシュ記法に置き換えない。
test "'おは'"
$KCODE='n'
test "'おは'"
# >> dump="dumped" inspect="dumped"
# >> dump="bell and tab \a\t" inspect="bell and tab \a\t"
# >> dump="'\244\252\244\317'" inspect="'おは'"
# >> dump="'\244\252\244\317'" inspect="'\244\252\244\317'"
