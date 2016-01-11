require 'erb'
src = File.read "percent.test.rtxt"
Class.new do 
  ERB.new(src, 0, '%').result binding
  # => "% percent\n1 + 1 = 2\n"
end

Class.new do 
  ERB.new(src).result binding rescue $!
  # => #<NameError: undefined local variable or method `a' for #<Class:0xb7cdf4f8>>
end

`erb percent.test.rtxt`                    # => "% percent\n1 + 1 = 2\n"
`erubis -E PercentLine percent.test.rtxt`  # => "% percent\n1 + 1 = 2\n"
