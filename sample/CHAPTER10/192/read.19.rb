# エンコーディングを指定する例
# Shift_JISで書かれたファイルの内容を行ごとに分割する。
sjis_txt = open("sjis.txt", "r:Shift_JIS") {|f| f.readlines }
sjis_txt.map(&:encoding)  # => [#<Encoding:Shift_JIS>, #<Encoding:Shift_JIS>]
sjis_txt = File.readlines("sjis.txt", :encoding => "Shift_JIS")
sjis_txt.map(&:encoding)  # => [#<Encoding:Shift_JIS>, #<Encoding:Shift_JIS>]
# EUC-JPで書かれたファイルをUTF-8に変換する。
euc_txt_utf8 = File.read("euc.txt", :encoding => "EUC-JP:UTF-8")
euc_txt_utf8.encoding     # => #<Encoding:UTF-8>
# 外部エンコーディングを指定読み込み、後で((:String#encode:))によるエンコーディング変換をしてもよい。
euc_txt_euc = File.read("euc.txt", :encoding => "EUC-JP")
euc_txt_euc.encode("UTF-8") == euc_txt_utf8  # => true
# エンコーディングを指定しない場合のエンコーディングはdefault_internalかdefault_externalになる。
File.read("euc.txt").encoding  # => #<Encoding:EUC-JP>
Encoding.default_external = "EUC-JP" # !> setting Encoding.default_external
Encoding.default_internal = "Shift_JIS" # !> setting Encoding.default_internal
File.read("euc.txt").encoding  # => #<Encoding:Shift_JIS>
