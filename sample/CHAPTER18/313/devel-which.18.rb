# devel/which�饤�֥���which_library���������Ƥ���Τ��ɤ߹���
require 'devel/which'
# forwardable.rb�Υե�����̾�����롣
which_library 'forwardable'  # => "/usr/local/lib/ruby/1.8/forwardable.rb"
# socket.so�Υե�����̾�����롣
which_library 'socket'       # => "/usr/local/lib/ruby/1.8/i686-linux/socket.so"
# ¸�ߤ��ʤ��饤�֥�����ꤷ����nil���֤롣
which_library 'not-exist'    # => nil
