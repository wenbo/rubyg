#!/usr/local/bin/ruby -Ke
# String#dump��String#inspect�η�̤�ɽ������ؿ���
def test(str) printf("dump=%s inspect=%s\n", str.dump, str.inspect) end
# ��eval(string.dump) == string�פ���Ω���롣
eval("code\n".dump) == "code\n"             # => true
eval("����ˤ���".dump) == "����ˤ���"     # => true
# ��ɽ��ʸ�����ʤ�����ʸ�����ξü�ˡ�"�פ��դ�������
test "dumped"
# �٥�ʸ���ȥ���ʸ�����Хå�����å��嵭ˡ�ˤʤ롣
test "bell and tab " << 7 << 9
# $KCODE�����������ꤵ��Ƥ���С�String#inspect�����ܸ�ʸ�����Хå�����å��嵭ˡ���֤������ʤ���
test "'����'"
$KCODE='n'
test "'����'"
# >> dump="dumped" inspect="dumped"
# >> dump="bell and tab \a\t" inspect="bell and tab \a\t"
# >> dump="'\244\252\244\317'" inspect="'����'"
# >> dump="'\244\252\244\317'" inspect="'\244\252\244\317'"
