# コマンドラインの第1引数にprintを指定した場合に実行するメソッド。
def do_print(*args)  puts "Print:#{args.join ', '}"  end
# コマンドラインの第1引数にlistを指定した場合に実行するメソッド。
def do_list(*args)   puts "List:#{args.join ', '}"   end
# 呼ぶメソッドをコマンドラインの第1引数で分岐する。第1引数の頭に「do_」をつけたメソッドを呼ぶ。残りのコマンドライン引数をそのメソッドに渡す。
__send__ "do_#{ARGV.first}", *ARGV[1..-1]
