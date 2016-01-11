# ファイルを開き、全体を読み込み改行で区切る。
open("sample.txt") {|f| f.readlines } # => ["日本語\n", "にほんご\n"]
open("sample.txt") do |f|
# getsの挙動の例。繰り返し使うと次の行を順次読んでいく。
  f.gets                              # => "日本語\n"
  f.gets                              # => "にほんご\n"
# そして、EOFに達するとnilを返す。
  f.gets                              # => nil
end
open("sample.txt") do |f|
# getsとwhileを併用して1行ずつ読み込むことができる。ちなみにputsは末尾に改行を含んでいても含んでいなくても改行をしてくれる。
  while line = f.gets
    puts "gets: #{line}"
  end
end
open("sample.txt") do |f|
  f.each_line do |line|
# この時点でlineは改行を含んでいるのでchomp!で改行を取り除く。
    line.chomp!
    puts "each_line: <#{line}>"
  end
end
# ファイルを開き、ひらがなを含む行（正規表現 /[ぁ-ん]/）を取り出す。
open("sample.txt") {|f| f.grep(/[ぁ-ん]/) } # => ["にほんご\n"]
# openとIO#each_lineを併合したもの。
File.foreach("sample.txt") do |line|
  puts "foreach: #{line}"
end
# openとIO#readlinesを併合したもの。
File.readlines("sample.txt")                # => ["日本語\n", "にほんご\n"]
# >> gets: 日本語
# >> gets: にほんご
# >> each_line: <日本語>
# >> each_line: <にほんご>
# >> foreach: 日本語
# >> foreach: にほんご
