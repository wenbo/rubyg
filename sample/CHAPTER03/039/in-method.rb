def customize(str)    # �ðۥ᥽�åɤ��������᥽�å�
  a = 1
  class << str
    # �ðۥ᥽�å�����γ��Υ������ѿ��ϸ����ʤ�
    a rescue $! 
    # => #<NameError: undefined local variable or method `a' for #<Class:#<String:0x85fae44>>>
    def category1() self[0,1] end   # �ǽ��ʸ��
  end
  def str.category2() self[1,1] end # ����ʸ��
end
item = "EXfoo"
customize(item) 
item.category1  # => "E"
item.category2  # => "X"
