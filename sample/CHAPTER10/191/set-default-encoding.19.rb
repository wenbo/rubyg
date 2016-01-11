Encoding.default_external       # => #<Encoding:EUC-JP>
Encoding.default_external = "SJIS" # !> setting Encoding.default_external
Encoding.default_external       # => #<Encoding:Shift_JIS>
Encoding.default_internal       # => nil
Encoding.default_internal = "UTF-8" # !> setting Encoding.default_internal
Encoding.default_internal       # => #<Encoding:UTF-8>

