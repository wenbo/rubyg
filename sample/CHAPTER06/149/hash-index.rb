# Ruby 1.8.7以前ではHash#keyが定義されていないのでaliasする。
unless {}.respond_to? :key  # Hash#keyが定義されていないなら
  class Hash
    # Hash#indexの定義をHash#keyにコピーする
    alias :key :index       
  end
end

hash = {1=>"one"}
# "one"に対応するキーを得る。
hash.key "one"    # => 1
hash.index "one"  # => 1 # !> Hash#index is deprecated; use Hash#key
