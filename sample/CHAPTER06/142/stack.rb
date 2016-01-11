# 括弧の対応が取れているかどうかを判定する関数
def paren_match?(expr)
  stack = []
# 閉括弧に対応する開括弧を表すハッシュ
  open_parens = {')'=>'(', '}'=>'{'}
# 式を走査し、括弧が登場するたびに括弧文字を「paren」ブロックパラメータに代入する。
  expr.scan(/[\(\{\)\}]/) do |paren|
# 括弧で場合分けし、閉括弧が多すぎたり、最後の括弧が対応するものでなかった場合はfalseを返す。
    case paren
    when '(','{'
      stack.push paren
    when ')','}'
      if stack.empty? or stack.last != open_parens[paren]
        return false
      else
        stack.pop
      end
    end
  end
# 閉括弧が少なすぎる場合はスタックは空にはならないのでfalseになる。
  stack.empty?
end
paren_match? "1+(2*3)"      # => true
paren_match? "(1+(2*3)"     # => false
paren_match? "1+(2*3))"     # => false
paren_match? "1+{2*(3+3)}"  # => true
paren_match? "1+{2*(3+3})"  # => false

