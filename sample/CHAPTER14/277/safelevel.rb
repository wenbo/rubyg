# �ץ���೫�ϻ��Υ����ե�٥��0��
$SAFE   # => 0
# �����ե�٥��1�����ꤹ�롣
$SAFE = 1
Thread.start do
# ����åɤϿƥ���åɡʤ��ξ��ϥᥤ�󥹥�åɡˤ��ͤ�����Ѥ���
  $SAFE # => 1
# ����å���Τߥ����ե�٥��2�����ꤹ�롣
  $SAFE = 2
end.join
# $SAFE�Ϥ��������Ƥ⥰���Х��ѿ��ǤϤʤ���
$SAFE   # => 1
# �����ե�٥�򲼤��褦�Ȥ����SecurityError�ˤʤ롣
begin $SAFE = 0
rescue SecurityError
  $!    # => #<SecurityError: tried to downgrade safe level from 1 to 0>
end

