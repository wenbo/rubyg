require 'stringio'
# io��2�Ԥ�ʸ�����񤭹���᥽�åɡ�
def write_2lines(io)  io.puts "abc"; io.puts "def"  end
str = "**********\n"
# StringIO���֥������Ȥ�������롣
io = StringIO.new str
# IO�������StringIO��������Ϥ���
write_2lines io
# IO��Ʊ���᥽�åɤ��Ȥ��롣
io.pos     # => 8
io.rewind  # => 0
io.read    # => "abc\ndef\n**\n"
io.path    # => nil
# ((:StringIO#string:))��ʸ��������Ƥ��֤���
io.string  # => "abc\ndef\n**\n"
# StringIO��ͳ�Ǹ���ʸ����Ͻ��Ѥ�ä���
str        # => "abc\ndef\n**\n"
