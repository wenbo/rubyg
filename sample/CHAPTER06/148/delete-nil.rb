hash = {1=>"one", 2=>nil}       # => {1=>"one", 2=>nil}
hash.delete(3)                  # => nil
hash.delete(2)                  # => nil
hash                            # => {1=>"one"}
hash[1]=nil
hash                            # => {1=>nil}

