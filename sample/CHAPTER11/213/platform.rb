# Windows�Ǥ��뤫Ƚ�̤���ؿ���
def windows?(platform = RUBY_PLATFORM)
  platform =~ /win/i and platform !~ /darwin/
end
# ɮ�ԤΥޥ����Pentium 4��GNU/Linux��
RUBY_PLATFORM       # => "i686-linux"
windows?            # => nil
windows? "mswin32"  # => true
# darwin��Mac OS X�ʤΤǡ�win�פȤ���ʸ���󤬴ޤޤ�Ƥ��Ƥ�Windows�ǤϤʤ���
windows? "darwin"   # => false
