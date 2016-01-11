class X
  def initialize(a) @a = a end
end
obj = X.new 7                                    # => #<X:0x826cb9c @a=7>
# Marshalデータを返す。
mdat = Marshal.dump obj                          # => "\x04\bo:\x06X\x06:\a@ai\f"
# Marshalデータを復元するとオブジェクトがコピーされる。
Marshal.load mdat                                # => #<X:0x826c7c8 @a=7>
# Marshalデータをファイルに書き込む。バイナリなのでバイナリモードでファイルを開く。
open("marshal.dat", "wb") {|f| Marshal.dump obj, f }
# Marshalデータを保存したファイルを読み込んでオブジェクトを復元する。
open("marshal.dat", "rb"){|f| Marshal.load(f) }  # => #<X:0x826c4d0 @a=7>
# ファイルにテキストモードとバイナリモードの区別のないOSの場合はこれでも復元できる。
Marshal.load(File.read("marshal.dat"))           # => #<X:0x826c2a0 @a=7>
