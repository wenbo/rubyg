RUBY_VERSION                    # => "1.9.1"
Array.new(6,0).tap {|a| 6000.times { a[(0..5).to_a.sample] += 1 }}
# => [1021, 991, 1011, 1010, 1003, 964]
Array.new(6,0).tap {|a| 6000.times { a[(0..5).sort_by { rand }.first] += 1 }}
# => [989, 969, 1005, 1015, 1007, 1015]
Array.new(6,0).tap {|a| 6000.times { a[(0..5).sort { rand(3)-1 }.first] += 1 }}
# => [1960, 547, 723, 438, 804, 1528]
