require 'stringio'
# ioに2行の文字列を書き込むメソッド。
def write_2lines(io)  io.puts "abc"; io.puts "def"  end
str = "**********\n"
# StringIOオブジェクトを作成する。
io = StringIO.new str
# IOの代わりにStringIOを引数に渡す。
write_2lines io
# IOと同じメソッドが使える。
io.pos     # => 8
io.rewind  # => 0
io.read    # => "abc\ndef\n**\n"
io.path    # => nil
# ((:StringIO#string:))は文字列の内容を返す。
io.string  # => "abc\ndef\n**\n"
# StringIO経由で元の文字列は書き変わった。
str        # => "abc\ndef\n**\n"
