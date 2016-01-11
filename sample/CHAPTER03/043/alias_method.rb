class Array
  def self.make_aliases
    method = :length
    alias_method "#{method}_org", method
  end
  make_aliases
end
[1,2].length                      # => 2
[1,2].length_org                  # => 2
