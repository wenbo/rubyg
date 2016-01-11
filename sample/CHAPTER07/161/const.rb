"File::Stat".split(/::/).inject(Object){|s,x| s.const_get(x)}  # => File::Stat
"File::Stat".split(/::/).inject(Object, :const_get)            # => File::Stat
"File::Stat".split(/::/)                                       # => ["File", "Stat"]
Object.const_get("File")                                       # => File
File.const_get("Stat")                                         # => File::Stat
