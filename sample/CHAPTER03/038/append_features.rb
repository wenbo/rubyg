module M
  def self.append_features(mod)
    puts "pre-include"
    super
    puts "post-include1"
  end
  def self.included(mod)
    puts "post-include2"
  end
  def a_module_method() :module_method end
end
include M
a_module_method  # => :module_method
# >> pre-include
# >> post-include1
# >> post-include2
