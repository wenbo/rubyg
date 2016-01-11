# 範囲に含まれているかチェックする。
2.between?(1,10)                 # => true
2.between?(4,10)                 # => false
(1..10).include? 2               # => true
(4..10).include? 2               # => false
# 「Comparable#between?」は「..」による範囲オブジェクト同様終端を含むのでtrueになる。
10.between?(2,10)                # => true
(2..10).include? 10              # => true
# 「...」による範囲オブジェクトは終端を含まないのでfalseになる。
(2...10).include? 10             # => false
# 必ず小さい方を左に指定しないといけない。
2.between?(10,1)                 # => false
(10..1).include? 2               # => false
# 文字列にも適用できる。ただし、Range#include?はRuby 1.9ではとても遅くなる。
"elf".between?("air","fairy")    # => true
"elf".between?("end","fairy")    # => false
("air".."fairy").include? "elf"  # => true
("end".."fairy").include? "elf"  # => false
# 「Range#===」は「Range#include?」と定義されているのでcase式で使える。
case 2
when 1..10
  puts "OK"
end
# >> OK
