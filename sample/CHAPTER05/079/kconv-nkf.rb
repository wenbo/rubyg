#!/usr/local/bin/ruby -Ke
# <%= require_description 'NKF.nkf・Kconv', "kconv" %>
require 'kconv'
euc = "ありがとう、NKF。"
# 入力文字コードを付けてUTF-8に変換する。
utf8 = NKF.nkf("-Ew", euc)
# 入力文字コードを推測してShift_JISに変換する。
sjis = NKF.nkf("-s", euc)
# String#kconvで入力文字コードを付けてJISに変換する。
jis = euc.kconv(Kconv::JIS, Kconv::EUC)
# String#toXXXは入力文字コードを推測して変換するお手軽メソッド。
euc.tojis == jis    # => true
jis.toutf8 == utf8  # => true
# String#isXXXは文字コードの妥当性を検証する。
euc.iseuc           # => true
sjis.isutf8         # => false
