class X
  def initialize(a) @a = a end
end
obj = X.new 7                                    # => #<X:0x826cb9c @a=7>
# Marshal�ǡ������֤���
mdat = Marshal.dump obj                          # => "\x04\bo:\x06X\x06:\a@ai\f"
# Marshal�ǡ�������������ȥ��֥������Ȥ����ԡ�����롣
Marshal.load mdat                                # => #<X:0x826c7c8 @a=7>
# Marshal�ǡ�����ե�����˽񤭹��ࡣ�Х��ʥ�ʤΤǥХ��ʥ�⡼�ɤǥե�����򳫤���
open("marshal.dat", "wb") {|f| Marshal.dump obj, f }
# Marshal�ǡ�������¸�����ե�������ɤ߹���ǥ��֥������Ȥ��������롣
open("marshal.dat", "rb"){|f| Marshal.load(f) }  # => #<X:0x826c4d0 @a=7>
# �ե�����˥ƥ����ȥ⡼�ɤȥХ��ʥ�⡼�ɤζ��̤Τʤ�OS�ξ��Ϥ���Ǥ������Ǥ��롣
Marshal.load(File.read("marshal.dat"))           # => #<X:0x826c2a0 @a=7>
