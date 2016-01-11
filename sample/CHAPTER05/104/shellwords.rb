# shellwords�饤�֥���Shellwords#shellwords���������Ƥ���Τ��ɤ߹���
require 'shellwords'
# ���������ʤ�Х��ڡ�����ޤ�뤳�Ȥ��Ǥ��롣
Shellwords.shellwords %q!ruby -e 'puts "fuga"'! # => ["ruby", "-e", "puts \"fuga\""]
# �⥸�塼��ؿ��ʤΤ�include���ƴؿ�Ū�᥽�åɸƤӽФ����Ǥ��롣
include Shellwords
# ��ʸ�����ޤ��㡣
shellwords %q!ruby -e ''!                       # => ["ruby", "-e", ""]
shellwords %q!ruby -e ""!                       # => ["ruby", "-e", ""]
shellwords %q!echo fuga!                        # => ["echo", "fuga"]
