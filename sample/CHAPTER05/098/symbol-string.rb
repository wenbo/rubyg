# シンボルを文字列に変換する。
:identity.to_s               # => "identity"
:identity.id2name            # => "identity"
# 式展開ではシンボル名が埋め込まれる。
"symbol name: #{:identity}"  # => "symbol name: identity"
# Symbol#inspectは「:」が前置される。
:identity.inspect            # => ":identity"
# 文字列をシンボルに変換する。
"new_symbol".intern          # => :new_symbol
"new_symbol".to_sym          # => :new_symbol
