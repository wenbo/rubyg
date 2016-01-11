# CamelCaseな変数名を単語に分ける
v = "javaCamelCaseVariable"
v.split(/(?=[A-Z])/)          # => ["java", "Camel", "Case", "Variable"]
v.scan(/(?:\A|[A-Z])[a-z]+/)  # => ["java", "Camel", "Case", "Variable"]
# 最後の5文字を境に区切る
"abcdefghi".split(/(?=.{5}\z)/) # => ["abcd", "efghi"]
# 最初の5文字を境に区切る（Ruby 1.9）
"abcdefghi".split(/(?<=\A.{5})/) # => ["abcde", "fghi"]
