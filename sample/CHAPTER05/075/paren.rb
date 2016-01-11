class String
  def paren_match?
    count('(') == count(')')
  end
end

"(a b (c))".paren_match?    # => true
"(a b (c)))".paren_match?   # => false
