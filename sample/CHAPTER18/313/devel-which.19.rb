require 'forwardable'
require 'socket'
# ��$"�פ˥��ɤ��줿�饤�֥��Υե�ѥ��ǳ�Ǽ����Ƥ��롣�饤�֥��Υե�ѥ��Τ���cgi��ޤ��Τ�ȴ���Ф���
$".grep(/forwardable/)  # => ["/pkgs/ruby19/lib/ruby19/1.9.0/forwardable.rb"]
# Ʊ�ͤ�socket��ޤ�饤�֥���ȴ���Ф���
$".grep(/socket/)       # => ["/pkgs/ruby19/lib/ruby19/1.9.0/i686-linux/socket.so"]
# ���פ���饤�֥�꤬�ʤ����϶�����ˤʤ롣
$".grep(/not-exist/)    # => []
