#!/usr/local/bin/ruby -Ku
require 'yaml'
str = "日本語"
str.to_yaml                     # => "--- !binary |\n5pel5pys6Kqe\n\n"
YAML.load(str.to_yaml) == str   # => true
YAML.load("--- 日本語") == str  # => true

require 'rubygems'
require 'ya2yaml'
str.ya2yaml                     # => "--- 日本語\n"
str.to_yaml                     # => "--- !binary |\n5pel5pys6Kqe\n\n"
[Object, String, Array, Hash, Symbol, Struct].each do |klass| # 置き換え
  klass.class_eval { alias to_yaml ya2yaml } # !> discarding old to_yaml
end
str.to_yaml                     # => "--- 日本語\n"
