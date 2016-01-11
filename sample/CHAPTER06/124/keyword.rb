KEYWORDS = [:name, :age, :job, :tel]
# キーワードの中から選ばれたことをチェックする。
selected = [:name, :job]
selected.all? {|e| KEYWORDS.include? e }   # => true
(selected - KEYWORDS).empty?               # => true
# 不正なキーワードがある場合。
invalid = [:name, :invalid]
invalid - KEYWORDS                         # => [:invalid]
(invalid - KEYWORDS).empty?                # => false
