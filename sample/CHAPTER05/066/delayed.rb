delayed = lambda{|value| "delayed interpolation: value=#{value}" }
delayed[9999]                 # => "delayed interpolation: value=9999"
