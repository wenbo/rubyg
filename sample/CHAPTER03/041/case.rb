# �ʲ�����ǤϤ��٤�"OK"��ɽ�����ޤ���
# Ʊ����Ƚ��
case 1
when 0
  p "NG"
when 1, 2
  p "OK"
else
  p "NG"
end
# ���饹Ƚ���ľ�ܤΥ��󥹥��󥹤Ǥ������
case 1
when Fixnum
  p "OK"
end
# ���饹Ƚ��ʥ��֥��饹�ξ��ˡ��ǽ�˥ޥå�����when���ɾ������Τ�when Fixnume����ʬ��ɾ������ʤ���
case 1
when Numeric
  p "OK"
when Fixnum
  p "NG"
end
# �⥸�塼��Υ��󥯥롼��Ƚ��
case [1]
when Enumerable
  p "OK"
end
# �ϰϤ����äƤ��뤫Ƚ��
case 5
when 1..10
  p "OK"
end
# ����ɽ���ޥå�Ƚ��
case "abracadabra"
when /cad/
  p "OK"
end
# *ary��1,2,3��Ÿ������������Ÿ����
ary = [1,2,3]
case 1
when *ary
  p "OK"
end
