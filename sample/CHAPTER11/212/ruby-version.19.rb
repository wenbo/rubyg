[ RUBY_VERSION, RUBY_PATCHLEVEL, RUBY_RELEASE_DATE ]  # => ["1.9.1", 0, "2009-01-30"]
RUBY_DESCRIPTION   # => "ruby 1.9.1p0 (2009-01-30 revision 21907) [i686-linux]"
# Ruby 1.9�ξ��ϡ�new�פ��֤���
if RUBY_VERSION >= "1.9" then "new" else "old" end  # => "new"
# Ruby 1.9����ӥ�����ɽ�����RUBY_REVISION��Ƴ�����줿��
RUBY_REVISION      # => 21907
