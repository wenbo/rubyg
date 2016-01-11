String.method_defined? :length         # => true
String.public_method_defined? :length  # => true
# 継承・インクルードで得たメソッドでも真になる
Array.method_defined? :map             # => true
Enumerable.method_defined? :map        # => true
# privateメソッドにはprivate_method_defined?を使う必要がある
Kernel.method_defined? :print          # => false
Kernel.private_method_defined? :print  # => true

