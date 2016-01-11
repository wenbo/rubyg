ary = ["one", "two", "three"]
i = 0
while i < ary.length            # 不等号を間違いかねない
  s = ary[i]
  "{#{s}}"                      # => "{one}", "{two}", "{three}"
  i += 1                        # インクリメントを忘れかねない
end
