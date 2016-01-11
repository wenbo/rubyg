# ��¤��Dog��������롣���Ф�:name��:age��
Dog = Struct.new :name, :age   # => Dog
# momo��Dog�Υ��󥹥��󥹡�
momo = Dog.new "Momo", 8       # => #<struct Dog name="Momo", age=8>
# �������������Ǥ�ϥå�������Ǥ���������Ǥ���Ф˥��������Ǥ��롣
[ momo.name, momo.age ]        # => ["Momo", 8]
[ momo[:name], momo[:age] ]    # => ["Momo", 8]
[ momo["name"], momo["age"] ]  # => ["Momo", 8]
[ momo[0], momo[1] ]           # => ["Momo", 8]
# ����̾�������֤롣Ruby 1.8�Ǥ�ʸ����Ruby 1.9�Ǥϥ���ܥ�ˤʤ롣
momo.members                   # => [:name, :age]
Dog.members                    # => [:name, :age]
# ���Фο���
momo.length                    # => 2
# ���Фι����ϥ������������Ǥ�ϥå�������Ǥ���������Ǥ��ǽ��
momo.age = 9
momo                           # => #<struct Dog name="Momo", age=9>
# ���Ф�ưŪ���ɲäǤ��ʤ������������Ǥ��ְ㤤��ȯ�����䤹����
momo.height rescue $!
# => #<NoMethodError: undefined method `height' for #<struct Dog name="Momo", age=9>>
(momo.height = 0.5) rescue $!
# => #<NoMethodError: undefined method `height=' for #<struct Dog name="Momo", age=9>>
# Struct�Υ��֥��饹�ˤʤäƤ��롣���饹���֥������Ȥ���ӤϷѾ��ط�����ӡ�
Dog < Struct                   # => true
# ��¤�Τ��ä��Ȥ������饹�ʤΤǿ����˥᥽�åɤ�����Ǥ��롣
class Dog
  def bark() "woof woof!"  end
end
momo.bark                      # => "woof woof!"
# ((:Array#each:))�Τ褦�˥��Ф��ͤǷ����֤���
momo.each {|m| puts "each: #{m.inspect}" }
# ((:Hash#each_pair:))�Τ褦�� [����̾, ���Ф���] �Υڥ��Ƿ����֤���
momo.each_pair {|m,v| puts "each_pair: #{m.inspect} = #{v.inspect}" }
# >> each: "Momo"
# >> each: 9
# >> each_pair: :name = "Momo"
# >> each_pair: :age = 9
