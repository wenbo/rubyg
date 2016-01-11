class Object;      def foo() "Object#foo" end; end
class Super;       def bar() "Super#bar"  end; end
class Sub < Super; def baz() "Sub#baz"    end; end
Sub.ancestors  # => [Sub, Super, Object, Kernel]

Sub.new.baz    # => "Sub#baz"
Sub.new.bar    # => "Super#bar"
Sub.new.foo    # => "Object#foo"
