open("sample.txt") do |f|
# IO#linesで1行ごとにループするEnumeratorを作成する。
  enumerator = f.lines       # => #<Enumerable::Enumerator:0xb7d3ffc4>
# そしてeachでループする。
  enumerator.each {|line| puts "lines: #{line}" }
end
# >> lines: 日本語
# >> lines: にほんご
