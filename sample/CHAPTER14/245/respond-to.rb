# stringio�饤�֥���StringIO���������Ƥ���Τ��ɤ߹���
require 'stringio'
# StringIO��IO�Τ褦�˰�����ʸ����
strio = StringIO.new "strio"  # => #<StringIO:0xb7dacc00>
str = "str"
# StringIO#read��¸�ߤ��롣
strio.respond_to? :read       # => true
# String#read��¸�ߤ��ʤ���
str.respond_to? :read         # => false
# �����ѡ����饹�Υ᥽�åɡ�Object#object_id�ˤ�¸�ߤ��롣
str.respond_to? :object_id    # => true

# ���֥������ȤΡ����ơפ��֤��ؿ���������롣read�᥽�åɤ���ĥ��֥������ȡ�IO���ˤ�read������Τ򡢻����ʤ���ΤϤ��Τޤޤ��֤���
def content(x)  x.respond_to?(:read) ? x.read : x  end
# String��StringIO��IO�ˤ�String��ɸ�ಽ�Ǥ��롣
content(strio)                # => "strio"
content(str)                  # => "str"
