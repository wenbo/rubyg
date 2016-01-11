# IO���饹�����SEEK_CUR���������Ƥ��롣
IO::SEEK_CUR               # => 1
# IO��Ѿ�����File���饹����⥢�������Ǥ��롣
File::SEEK_CUR             # => 1
# const_get��̾������ꤷ��������ͤ����롣
IO.const_get(:SEEK_CUR)    # => 1
File.const_get(:SEEK_CUR)  # => 1
# Ruby 1.9�Ǥ�const_get����2������false����ꤹ��ȡ����Υ��饹��������줿����ˤ������������Ǥ��ʤ���
File.const_get(:SEEK_CUR,false) rescue $!   # => #<NameError: uninitialized constant File::SEEK_CUR>

# const_get�η������������
# ��::�פ�Ȥä��������ϤǤ��ʤ���
Object.const_get("IO::SEEK_CUR") rescue $!  # => #<NameError: wrong constant name IO::SEEK_CUR>
# eval�ϼ�ü���ᤤ������Ψ�̤Ǥ⥻�����ƥ��̤Ǥ�褯�ʤ���
eval "IO::SEEK_CUR"                   # => 1
def toplevel_const_get(name)   # �ͥ��Ȥ������̾���б�������const_get
# ��::�פǶ��ڤꡢObject����������򻲾Ȥ�³����С�name��ɽ������˥��������Ǥ��롣
  name.split(/::/).inject(Object){|o,c| o.const_get(c) }
end
# toplevel_const_get�ؿ���������ƻȤ��Τ��ɤ���
toplevel_const_get("IO::SEEK_CUR")    # => 1
toplevel_const_get("File::SEEK_CUR")  # => 1
# ̾���ǻ��ꤷ�������Ȥäƥ��֥������Ȥ�������롣
Object.const_get("Range").new(1,3)    # => 1..3
stat = toplevel_const_get("File::Stat").new("const-get.rb")
stat.class                            # => File::Stat
