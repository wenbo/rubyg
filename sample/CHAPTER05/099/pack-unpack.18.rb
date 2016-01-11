Marshal.dump "test"         # => "\004\b\"\ttest"
# Ruby 1.8で文字列「test」をMarshal形式に変換した文字列を解析する。
packed = "\004\b\"\ttest"
# 「\004」、「\b」を8ビット整数（c)として、「"」をASCII文字列（a）として、「\t」を8ビット整数として、残りをASCII文字列（a*）として解釈し、その結果を配列に詰める。
packed.unpack "c c a c a*"  # => [4, 8, "\"", 9, "test"]
# 今度は逆に、先程の結果の一部を改変してバイナリ文字列を作成する。これが文字列「foo」のMarshal形式である。
newbin = [4, 8, "\"", 8, "foo"].pack("c c a c a*") # => "\004\b\"\bfoo"
# 作成したMarshalデータを読み込むと、復元される。
Marshal.load newbin # => "foo"
