module Mod
  def self.meth
    attr_accessor :a
    "Mod.meth"
  end
  meth  # => "Mod.meth"
  attr_accessor :b
end
