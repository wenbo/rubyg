# �Ȥ߹����ѿ��Υꥹ�� + �ץ������������Ƥ��륰���Х��ѿ��Υꥹ��
$gvars = global_variables  # => [:$;, ...(length=58)]
# $gvars, $lvars, $gvar2 ��ޤޤ�Ƥ���
$gvars.grep(/var/)         # => [:$gvars, :$lvars, :$gvar2]
$lvars = local_variables
$lvars.reject! {|x| x =~ /xmp/} # nodisp
$lvars       # => [:lvar, :lvar2]
lvar = 0
if false     # ��ã�����ʤ�������
  $gvar2 = 0
  lvar2 = 0
end
