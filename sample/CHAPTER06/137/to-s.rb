ary = [1, "a", Array, ["inner", ["array"]]]
# �ʹ֤��ɤߤ䤹�������ˤ��롣
ary.inspect   # => "[1, \"a\", Array, [\"inner\", [\"array\"]]]"
# ʸ����򶴤߹��ࡣ��ά�������Ǥ�Ϣ�뤹�롣
ary.join      # => "1aArrayinnerarray"
ary.join ""   # => "1aArrayinnerarray"
ary.join " "  # => "1 a Array inner array"
# ��*�ױ黻�ҥ᥽�åɤ�ʸ�������ꤷ�����ϡ�Array#join�פ�Ʊ���ˤʤ롣
ary * " "     # => "1 a Array inner array"
