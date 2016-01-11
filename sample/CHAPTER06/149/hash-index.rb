# Ruby 1.8.7�����Ǥ�Hash#key���������Ƥ��ʤ��Τ�alias���롣
unless {}.respond_to? :key  # Hash#key���������Ƥ��ʤ��ʤ�
  class Hash
    # Hash#index�������Hash#key�˥��ԡ�����
    alias :key :index       
  end
end

hash = {1=>"one"}
# "one"���б����륭�������롣
hash.key "one"    # => 1
hash.index "one"  # => 1 # !> Hash#index is deprecated; use Hash#key
