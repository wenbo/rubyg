# yaml�饤�֥���YAML���������Ƥ���Τ��ɤ߹���
require 'yaml'
class X
  def initialize(a) @a = a end
end
obj = X.new "test"                         # => #<X:0xb7acd3f4 @a="test">
# YAML�ǡ������֤���
mdat = YAML.dump obj
# YAML�ǡ�������������ȥ��֥������Ȥ����ԡ�����롣
YAML.load mdat                             # => #<X:0xb7accabc @a="test">
# YAML�ǡ�����ե�����˽񤭹��ࡣ
open("test.yaml", "w") {|f| YAML.dump obj, f }
# YAML�ǡ�������¸�����ե�������ɤ߹���ǥ��֥������Ȥ��������롣�ɤ���Ǥ�褤��
open("test.yaml", "r"){|f| YAML.load(f) }  # => #<X:0xb7acc0a8 @a="test">
YAML.load(File.read("test.yaml"))          # => #<X:0xb7acbba8 @a="test">
YAML.load_file("test.yaml")                # => #<X:0xb7acb680 @a="test">
# YAML�ǡ�����ɽ�����롣
puts mdat
# >> --- !ruby/object:X 
# >> a: test
