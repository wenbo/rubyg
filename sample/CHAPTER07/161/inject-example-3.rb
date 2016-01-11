(1..3).map{|i| [i,2**i]}                           # => [[1, 2], [2, 4], [3, 8]]
(1..3).inject([]){|a,i| a << [i,2**i]}             # => [[1, 2], [2, 4], [3, 8]]
(2..3).inject([[1,2]]){|a,i| a << [i,2*a[-1][1]]}  # => [[1, 2], [2, 4], [3, 8]]

(1..3).inject({}){|h,i| h[i]=2**i; h}          # => {1=>2, 2=>4, 3=>8}
(2..3).inject({1=>2}){|h,i| h[i]=2*h[i-1]; h}  # => {1=>2, 2=>4, 3=>8}

(1..3).inject({}){|h,i| h.tap{h[i]=2**i}}      # => {1=>2, 2=>4, 3=>8}
{}.tap{|h| (1..3).each {|i| h[i]=2**i}}        # => {1=>2, 2=>4, 3=>8}

[[1,"a"], [2,"bc"], [3,"def"]].inject(0){|sum,(n,str)| sum + str.length}  # => 6

"File::Stat".split(/::/).inject(Object){|s,x| s.const_get(x)}  # => File::Stat
"File::Stat".split(/::/).inject(Object, :const_get)            # => File::Stat
"File::Stat".split(/::/)                                       # => ["File", "Stat"]
Object.const_get("File")                                       # => File
File.const_get("Stat")                                         # => File::Stat
