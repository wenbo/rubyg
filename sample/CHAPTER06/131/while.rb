ary = ["one", "two", "three"]
i = 0
while i < ary.length            # �������ְ㤤���ͤʤ�
  s = ary[i]
  "{#{s}}"                      # => "{one}", "{two}", "{three}"
  i += 1                        # ���󥯥���Ȥ�˺�줫�ͤʤ�
end
