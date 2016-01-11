require 'drb'
# Front�λ��Ȥ����롣
remote = DRbObject.new_with_uri "druby://127.0.0.1:54354"
# ServerObject�����Ϥ��Ǥ�äƤ����������饤����Ȥ�ServerObject���Τ�ʤ��Τ�DRbUnknown�ˤʤ롣
dumped = remote.dumped
# => #<DRb::DRbUnknown:0xb7ca61f8
#     @buf="\004\bS:\021ServerObject\006:\nvalue0",
#     @name="ServerObject">
# ������¦�Ǥ�inspect�η�̤��֤롣
remote.dumped_inspect # => "#<struct ServerObject value=nil>"
# DRbUnknown�˥᥽�åɤ���������ȥ��顼�ˤʤ롣
(dumped.value = 1) rescue $!
# => #<NoMethodError: undefined method `value=' for #<DRb::DRbUnknown:0xb7ca61f8>>
# ServerObjectUndumped�λ��Ȥ�����ʻ����Ϥ��ˡ�
undumped = remote.undumped
# => #<DRb::DRbObject:0xb7ca3408 @ref=-605614038, @uri="druby://127.0.0.1:54354">
# ���Ȥ��Ф��Ƥϥ᥽�åɤ��������뤳�Ȥ��Ǥ���������¦��ȿ�Ǥ���Ƥ��롣
undumped.value = 2
remote.undumped_inspect # => "#<struct ServerObjectUndumped value=2>"
# ���饤����Ȥ����Τ�ʤ����֥������Ȥ򥵡��Ф�������
ClientObject = Struct.new :a
co = ClientObject.new 8  # => #<struct ClientObject a=8>
# ���֥������Ȥ���̤˻����Ϥ��ˤ������extend����Ѥ��롣
co.extend DRbUndumped
# ���饤����Ȥ��饵���Фػ����Ϥ�������ϡ����줬ɬ�ס��ʤ��ȥ��顼�ˤʤ롣
DRb.start_service
# dumped�ؤϥ᥽�åɤ������Ǥ��ʤ��Τǡ�undumped�إ᥽�åɤ���������ʻ����Ϥ��ˡ�
undumped.value = co
# �Τ��˻��Ȥ��ϤäƤ��롣
remote.undumped_inspect
# => "#<struct ServerObjectUndumped value=#<DRb::DRbObject:0xb7ca3a0c @ref=-605750488, @uri=\"druby://meg:54765\">>"
# ���Ȥ����������äƤ����ΤǼ��Τ���롣
remote.undumped.value           # => #<struct ClientObject a=8>
remote.undumped.value.a         # => 8
