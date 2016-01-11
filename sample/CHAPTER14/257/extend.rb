class Archiver            # ���������֥ե�����򰷤����饹
  def initialize(archive_file)
    @archive = archive_file
# ���������֥ե�����γ�ĥ�Ҥ˱�����extract�᥽�åɤ����򤹤롣
    case archive_file
    when /\.tar\.gz$/, /\.tgz$/ then extend TarGz
    when /\.lzh$/               then extend LHA
    end
  end
# .tar.gz / .tgz ��Ÿ�����ޥ�ɡ�
  module TarGz
    def extract() "tar xzf #@archive"  end
  end
# .lzh ��Ÿ�����ޥ�ɡ�
  module LHA
    def extract() "lha x #@archive"    end
  end
end
# ��ĥ�Ҥ˱������̤�extract�᥽�åɤ��¹Ԥ���롣
Archiver.new("foo.tgz").extract # => "tar xzf foo.tgz"
Archiver.new("bar.lzh").extract # => "lha x bar.lzh"
