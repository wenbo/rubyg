a = [1,2,3]
# Array#permutationはEnumeratorを返すので、列挙するには「to_a」をつける。
a.permutation          # => #<Enumerator:0xb7db13cc>
# aの要素を並べ変えるすべての方法を列挙する。引数を省略した場合は要素数を指定したのと同じ。
a.permutation.to_a
# => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
# 2個の要素を選ぶ順列を列挙する。
a.permutation(2).to_a
# => [[1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2]]
# 0個の要素を選ぶ順列は空集合だけなので空配列のみの配列を返す。
a.permutation(0).to_a  # => [[]]
a.permutation(1).to_a  # => [[1], [2], [3]]
a.permutation(8).to_a  # => []
# Array#combinationはEnumeratorを返すので、列挙するには「to_a」をつける。
a.combination(2)       # => #<Enumerator:0xb7d85984>
# 2個の要素を選ぶ組み合わせを列挙する。
a.combination(2).to_a  # => [[1, 2], [1, 3], [2, 3]]
a.combination(0).to_a  # => [[]]
a.combination(1).to_a  # => [[1], [2], [3]]
a.combination(8).to_a  # => []
# 組み合わせ各々においてブロックを評価する。
a.combination(2) {|x,y| puts "<#{x}, #{y}>" }
# 直積集合を求める。
[1,2].product([3,4])   # => [[1, 3], [1, 4], [2, 3], [2, 4]]
[1,2].product([3,4], [5,6])
# => [[1, 3, 5], [1, 3, 6], [1, 4, 5], [1, 4, 6], [2, 3, 5], [2, 3, 6], [2, 4, 5], [2, 4, 6]]
[1,2].product([3])     # => [[1, 3], [2, 3]]
[1,2].product()        # => [[1], [2]]
[1,2].product()        # => [[1], [2]]
# >> <1, 2>
# >> <1, 3>
# >> <2, 3>
