class Person
  def initialize(name)  @name, @married = name, false  end
  attr_accessor :married   # Person#married��Person#married=���������
  protected :married=      # Person#married=�Τߤ�protected�ˤ���
  def marry!(partner)
    # self��Ʊ�����饹�ʤΤ�protected�ʥ᥽�åɤ��Ƥ٤롣
    self.married = true
    partner.married = true
  end
end
tom = Person.new "Tom"  # => #<Person:0xb7ae4388 @name="Tom", @married=false>
may = Person.new "May"  # => #<Person:0xb7ae4180 @name="May", @married=false>
# ��������ϸƤ٤ʤ���
(tom.married = true) rescue $!  # => #<NoMethodError: protected method `married=' called for #<Person:0xb7ae4388 @name="Tom", @married=false>>
tom.married             # => false
tom.marry! may
tom                     # => #<Person:0xb7ae4388 @name="Tom", @married=true>
may                     # => #<Person:0xb7ae4180 @name="May", @married=true>
