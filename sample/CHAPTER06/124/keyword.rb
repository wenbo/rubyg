KEYWORDS = [:name, :age, :job, :tel]
# ������ɤ��椫�����Ф줿���Ȥ�����å����롣
selected = [:name, :job]
selected.all? {|e| KEYWORDS.include? e }   # => true
(selected - KEYWORDS).empty?               # => true
# �����ʥ�����ɤ������硣
invalid = [:name, :invalid]
invalid - KEYWORDS                         # => [:invalid]
(invalid - KEYWORDS).empty?                # => false
