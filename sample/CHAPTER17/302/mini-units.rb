module TinyUnits                                    # *1
  def self.define_unit(name, quantity, *aliases)    # *2
    Numeric.module_eval do
      define_method(name) { self * quantity }       # *4
      aliases.each {|ali| alias_method ali, name }  # *5
    end
    define_method(name) {|x| x / quantity }         # *6
    aliases.each do |ali|
      alias_method ali, name                        # *5
      module_function ali                           # *7
    end    
    module_function name                            # *7
  end
  private_class_method :define_unit                 # *3
end

# 単位を定義
module TinyUnits
  define_unit :cm,    0.01
  define_unit :mm,    0.1.cm
  define_unit :inch,  2.54.cm, :in
  define_unit :feet,  12.inch, :ft
  define_unit :yard,  3.feet
  define_unit :mile,  1760.yard
end

TinyUnits.define_unit :feet, 12.inch rescue $!
# => #<NoMethodError: private method `define_unit' called for TinyUnits:Module>

# 使用例
1.cm                # => 0.01
1.mm                # => 0.001
1.inch              # => 0.025400000000000002
1.feet              # => 0.3048
1.mile              # => 1609.3440000000003
1.yard              # => 0.9144000000000001
tall = 6.ft + 2.in  # => 1.8796000000000002

TinyUnits.cm(tall)      # => 187.96
include TinyUnits
cm(tall)         # => 187.96

def feet_inch(len)
  int, mod = len.divmod 1.ft
  [int, TinyUnits.inch(mod)]
end
feet_inch(tall)     # => [6, 2.0000000000000027]
