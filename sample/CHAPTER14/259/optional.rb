RUBY_VERSION     # => "1.9.1"
class Object
  define_method(:opt) {|opt=1| opt }
  define_method(:opt_rest) {|opt=1, *rest| [opt, rest] }
  define_method(:opt_block) {|opt=2, &block| opt * block[] }
end
opt              # => 1
opt_rest         # => [1, []]
opt_block { 3 }  # => 6
