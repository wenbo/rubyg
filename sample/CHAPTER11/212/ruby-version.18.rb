# Ruby�ΥС������
RUBY_VERSION       # => "1.8.7"
# Ruby�Υѥå���٥롣
RUBY_PATCHLEVEL    # => 160
# ��꡼���������ա����뤤�Ϻǽ��������
RUBY_RELEASE_DATE  # => "2009-04-08"
# ��ruby -v�פ�ɽ�������ʸ���󡣡�Ruby 1.8.7�ʹߡ�
RUBY_DESCRIPTION   # => "ruby 1.8.7 (2009-04-08 patchlevel 160) [i686-linux]"
# Ruby 1.8�ξ��ϡ�old�פ��֤���
if RUBY_VERSION >= "1.9" then "new" else "old" end  # => "old"
