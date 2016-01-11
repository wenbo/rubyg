require 'ostruct'
o = OpenStruct.new :a => 1, :object_id => 3
o.a               # => 1
o.object_id       # => 68712290 (��¸�Υ᥽�åɤϥ��ФˤǤ��ʤ���)
o[:a] rescue $!   # => #<NoMethodError: undefined method `[]' for #<OpenStruct a=1, object_id=3>>
o.b = 2
o.abracadabra = 7
o.abracadsbra     # => nil  (�Ǥ��ְ㤤�Ǥ⥨�顼�ˤʤ�ʤ���)
o                 # => #<OpenStruct a=1, object_id=3, b=2, abracadabra=7>
