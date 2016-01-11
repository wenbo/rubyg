# yamlライブラリにYAMLが定義されているので読み込む
require 'yaml'
class X
  def initialize(a) @a = a end
end
obj = X.new "test"                         # => #<X:0xb7acd3f4 @a="test">
# YAMLデータを返す。
mdat = YAML.dump obj
# YAMLデータを復元するとオブジェクトがコピーされる。
YAML.load mdat                             # => #<X:0xb7accabc @a="test">
# YAMLデータをファイルに書き込む。
open("test.yaml", "w") {|f| YAML.dump obj, f }
# YAMLデータを保存したファイルを読み込んでオブジェクトを復元する。どちらでもよい。
open("test.yaml", "r"){|f| YAML.load(f) }  # => #<X:0xb7acc0a8 @a="test">
YAML.load(File.read("test.yaml"))          # => #<X:0xb7acbba8 @a="test">
YAML.load_file("test.yaml")                # => #<X:0xb7acb680 @a="test">
# YAMLデータを表示する。
puts mdat
# >> --- !ruby/object:X 
# >> a: test
