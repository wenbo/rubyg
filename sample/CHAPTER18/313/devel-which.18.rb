# devel/whichライブラリにwhich_libraryが定義されているので読み込む
require 'devel/which'
# forwardable.rbのファイル名を得る。
which_library 'forwardable'  # => "/usr/local/lib/ruby/1.8/forwardable.rb"
# socket.soのファイル名を得る。
which_library 'socket'       # => "/usr/local/lib/ruby/1.8/i686-linux/socket.so"
# 存在しないライブラリを指定したらnilが返る。
which_library 'not-exist'    # => nil
