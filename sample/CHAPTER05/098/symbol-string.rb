# ����ܥ��ʸ������Ѵ����롣
:identity.to_s               # => "identity"
:identity.id2name            # => "identity"
# ��Ÿ���Ǥϥ���ܥ�̾�������ޤ�롣
"symbol name: #{:identity}"  # => "symbol name: identity"
# Symbol#inspect�ϡ�:�פ����֤���롣
:identity.inspect            # => ":identity"
# ʸ����򥷥�ܥ���Ѵ����롣
"new_symbol".intern          # => :new_symbol
"new_symbol".to_sym          # => :new_symbol
