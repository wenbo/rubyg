# csvライブラリにCSVが定義されているので読み込む
require 'csv'
# CSV文字列の扱い
# 「,」や改行が含まれないことが保証されている場合は、String#splitで解析できる。
"1,2\r\n3,4\r\n".split("\r\n").map {|l| l.split(",") } # => [["1", "2"], ["3", "4"]]
#1 厳密にCSV文字列を解析するにはCSV.parseを使用する。
CSV.parse(%Q!1,2,3\r\n4,5,"6,7"\r\n!) # => [["1", "2", "3"], ["4", "5", "6,7"]]
#1 配列をCSV文字列に変換するにはCSV.generate_lineを使用する。Ruby 1.8では末尾の改行が付かず、Ruby 1.9では付く。
CSV.generate_line [0, "a\nb", "c,d"]     # => "0,\"a\nb\",\"c,d\"\n"
# CSVファイルの扱い
# CSVファイルを作成する。
CSV.open("sample.csv", "w") do |csv|
# データは「<<」で1行分のデータを書き込む。
  csv << [1, "line1\nline2"]
  csv << [2, "with,comma"]
  csv << [3, '/"dquote"/']
end

# CSVファイルから1行ずつ読み込む。
CSV.foreach("sample.csv") do |row|
  row # => ["1", "line1\nline2"], ["2", "with,comma"], ["3", "/\"dquote\"/"]
end
# CSVファイルを一気に読み込む。
CSV.read("sample.csv")
# => [["1", "line1\nline2"], ["2", "with,comma"], ["3", "/\"dquote\"/"]]
# 書き込まれたCSVファイルはこのようになっている。
print File.read("sample.csv")
# >> 1,"line1
# >> line2"
# >> 2,"with,comma"
# >> 3,"/""dquote""/"
